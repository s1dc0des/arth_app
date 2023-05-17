import 'package:http/http.dart' as http;

class BitcoinService {
  Future<int> getAccountBalance(String address) async {
    var url = Uri.parse('https://blockchain.info/q/addressbalance/$address');
    var response = await http.get(url);
    int balance = int.parse(response.body);
    return balance;
  }
}
