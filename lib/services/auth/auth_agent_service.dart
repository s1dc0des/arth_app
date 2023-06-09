import 'dart:io';
import 'package:agent_dart/agent/auth.dart';
import 'package:agent_dart/identity/delegation.dart';
import 'package:agent_dart/identity/ed25519.dart';
import 'package:agent_dart/utils/extension.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'arth_auth_client.dart';

// copied from agent dart auth
// https://github.com/AstroxNetwork/agent_dart_auth.git

Future<String> webAuth(AuthPayload payload) async {
  return await FlutterWebAuth.authenticate(
    url: payload.url,
    callbackUrlScheme: payload.scheme,
    // preferEphemeral: true,
  );
}

class WebAuthProvider extends AuthClient {
  bool useLocalPage;
  int port;
  HttpServer? server;

  // A handle on the IdP window.
  WebAuthProvider({
    required String scheme,
    required String path,
    Identity? identity,
    SignIdentity? key,
    DelegationChain? chain,
    Uri? authUri,
    AuthFunction authFunction = webAuth,
    this.useLocalPage = true,
    this.port = 32768,
  }) : super(
          scheme: scheme,
          authFunction: authFunction,
          identity: identity,
          path: path,
          key: key,
          chain: chain,
          authUri: authUri,
        );

  Future<void> start([AuthClientLoginOptions? options, String? provider]) async {
    if (useLocalPage) {
      key ??= await Ed25519KeyIdentity.generate(null);
      var page = generateHtml(
        sessionPublicKey: key!.getPublicKey().toDer().toHex(),
        callbackPath: path,
        callbackScheme: scheme,
        authUri: authUri,
      );
      server = await startServer(page, port);

      try {
        await login(options, provider);
      } catch (e) {
        server?.close(force: true);
        rethrow;
      }
      server?.close(force: true);
    } else {
      await login(options, provider);
      server?.close(force: true);
    }
  }

  @override
  void handleFailure(String? errorMessage, void Function(String? error)? onError) {
    server?.close(force: true);
    super.handleFailure(errorMessage, onError);
  }
}

String generateHtml({
  required String sessionPublicKey,
  required String callbackScheme,
  required String callbackPath,
  Uri? authUri,
}) {
  final withHash =
      authUri != null ? authUri.toString() : Uri.parse('$identityProviderDefault/$identityProviderEndpoint').toString();

  return """
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Grant Access to Flutter</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <style>
    html, body { margin: 0; padding: 0; }
    main {
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      min-height: 100vh;
      font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol;
    }
    #icon {
      font-size: 96pt;
    }
    #text {
      padding: 2em;
      max-width: 260px;
      text-align: center;
    }
    .text {
      padding: 2em;
      max-width: 260px;
      text-align: center;
    }
    #button a {
      display: inline-block;
      padding: 6px 12px;
      color: white;
      border: 1px solid rgba(27,31,35,.2);
      border-radius: 3px;
      background-image: linear-gradient(-180deg, #34d058 0%, #22863a 90%);
      text-decoration: none;
      font-size: 14px;
      font-weight: 600;
    }
    #button a:active {
      background-color: #279f43;
      background-image: none;
    }
  </style>
  
</head>
<body>
  <main>
    <div id="icon">&#x1F3C7;</div>
    <div id="text">You are being redirected to</div> 
    <div class="text">$withHash...</div>
    <div id="button" onclick="getValue()"><a>Click To Continue</a></div>
  </main>
  <script>
    var idpWindow;

    const toHex = arr => Array.from(arr, i => i.toString(16).padStart(2, "0")).join("");
    const fromHexString = hexString => new Uint8Array(hexString.match(/.{1,2}/g).map(byte => parseInt(byte, 16)));
    
    function getValue() {
      idpWindow = window.open('$withHash', 'idpWindow');
      if (idpWindow != undefined) {
        var listener = window.addEventListener('message', function (event) {
          var message = event.data;
          switch (message.kind) {
            case 'authorize-ready': {
              // IDP is ready. Send a message to request authorization.
              var request = {
                kind: 'authorize-client',
                sessionPublicKey: fromHexString('$sessionPublicKey'),
                maxTimeToLive: undefined,
              };
              
              idpWindow.postMessage(request, '$withHash');
              break;
            }
            case 'authorize-client-success':
              idpWindow.close();
              console.log(message);
              const { userPublicKey, delegations } = message;
           
              const newDelegations = delegations.map((d) => {
                const { pubkey, expiration } = d.delegation;
                return {
                  delegation: {
                    pubkey: toHex(pubkey),
                    expiration: expiration.toString(),
                  },
                  signature: toHex(d.signature),
                };
              });

              const newUserPublicKey = toHex(userPublicKey);

              const data = {
                delegations: newDelegations,
                publicKey: newUserPublicKey,
              };
              const json = JSON.stringify(data);

              window.removeEventListener('message', listener);
              window.location.href = '$callbackScheme://$callbackPath?success=true&&json=' + json;
              break;
            case 'authorize-client-failure':
              idpWindow.close();
              window.removeEventListener('message', listener);
              window.location.href =
                '$callbackScheme://$callbackPath?success=false&&json=' + message.text;
              break;
            default:
              break;
          }
        });
      }
    }
  </script>
</body>

</html>
""";
}

Future<HttpServer> startServer(String html, int port) async {
  final server = await HttpServer.bind('127.0.0.1', port);
  server.listen((req) async {
    req.response.headers.add('Content-Type', 'text/html');
    req.response.write(html);
    req.response.close();
  });
  return server;
}
