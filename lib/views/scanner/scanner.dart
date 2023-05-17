import 'dart:io';
import 'package:agent_dart/agent_dart.dart';
import 'package:arth_app/common/utils/amount_utils.dart';
import 'package:arth_app/common/utils/snack_bar_utils.dart';
import 'package:arth_app/views/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../common/enums/scan_type.dart';

class QrScanner extends StatefulWidget {
  final ScanType scanType;
  const QrScanner({super.key, required this.scanType});

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  late MobileScannerController controller = MobileScannerController(returnImage: true);
  Barcode? barcode;
  BarcodeCapture? capture;

  Future<void> onDetect(BarcodeCapture barcode) async {
    capture = barcode;
    setState(() => this.barcode = barcode.barcodes.first);
  }

  bool isPrincipal(String? s) {
    if (s == null) return false;
    try {
      Principal.from(s);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool isAccount(String? s) {
    if (s == null) return false;
    return isAccountId(s);
  }

  bool isBitcoinAddress(String? s) {
    if (s == null) return false;
    bool isv = AmountUtils.isvalidBtcAddress(s);
    print("the address is $s");
    print("the address is $isv");
    return isv;
  }

  MobileScannerArguments? arguments;

  @override
  Widget build(BuildContext context) {
    final scanWindow = Rect.fromCenter(
      center: MediaQuery.of(context).size.center(Offset.zero),
      width: 300,
      height: 300,
    );
    return Scaffold(
      body: Builder(
        builder: (context) {
          return Stack(
            fit: StackFit.expand,
            children: [
              MobileScanner(
                fit: BoxFit.cover,
                scanWindow: scanWindow,
                controller: controller,
                onScannerStarted: (arguments) {
                  setState(() {
                    this.arguments = arguments;
                  });
                },
                onDetect: onDetect,
              ),
              if (barcode != null && barcode?.corners != null && arguments != null)
                CustomPaint(
                  painter: BarcodeOverlay(
                    barcode: barcode!,
                    arguments: arguments!,
                    boxFit: BoxFit.contain,
                    capture: capture!,
                  ),
                ),
              CustomPaint(
                painter: ScannerOverlay(scanWindow),
              ),
              Positioned(
                bottom: 160,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  height: 60,
                  width: 1.sw,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ValueListenableBuilder(
                        valueListenable: controller.hasTorchState,
                        builder: (context, state, child) {
                          if (state != true) {
                            return IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.flash_off,
                                color: Colors.transparent,
                              ),
                            );
                          }
                          return IconButton(
                            color: Colors.white,
                            icon: ValueListenableBuilder(
                              valueListenable: controller.torchState,
                              builder: (context, state, child) {
                                switch (state) {
                                  case TorchState.off:
                                    return const Icon(
                                      Icons.flash_off,
                                      color: Colors.grey,
                                    );
                                  case TorchState.on:
                                    return const Icon(
                                      Icons.flash_on,
                                      color: Colors.yellow,
                                    );
                                }
                              },
                            ),
                            iconSize: 32.0,
                            onPressed: () => controller.toggleTorch(),
                          );
                        },
                      ),
                      IconButton(
                        color: Colors.white,
                        icon: ValueListenableBuilder(
                          valueListenable: controller.cameraFacingState,
                          builder: (context, state, child) {
                            switch (state) {
                              case CameraFacing.front:
                                return const Icon(Icons.camera_front);
                              case CameraFacing.back:
                                return const Icon(Icons.camera_rear);
                            }
                          },
                        ),
                        iconSize: 32.0,
                        onPressed: () => controller.switchCamera(),
                      ),
                      IconButton(
                        color: Colors.white,
                        icon: const Icon(Icons.image),
                        iconSize: 32.0,
                        onPressed: () async {
                          final ImagePicker picker = ImagePicker();
                          final XFile? image = await picker.pickImage(
                            source: ImageSource.gallery,
                          );
                          if (image != null) {
                            if (await controller.analyzeImage(image.path)) {
                              // controller.
                              if (!mounted) return;
                              Snack.show(context, "Barcode found!");
                            } else {
                              if (!mounted) return;
                              Snack.show(context, "No barcode found!", isError: true);
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    height: 100,
                    color: Colors.black.withOpacity(0.4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            if (!isPrincipal(barcode?.displayValue) && widget.scanType == ScanType.principal) ...[
                              Center(
                                child: SizedBox(
                                  width: 0.8.sw,
                                  height: 30,
                                  child: Center(
                                    child: Text(
                                      barcode?.displayValue != null ? "Invalid Principal" : 'Scan QR Code',
                                      overflow: TextOverflow.fade,
                                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                          color: barcode?.displayValue != null ? Colors.red : Colors.white, fontSize: 16),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                            if (!isAccount(barcode?.displayValue) && widget.scanType == ScanType.accountID) ...[
                              Center(
                                child: SizedBox(
                                  width: 0.8.sw,
                                  height: 30,
                                  child: Center(
                                    child: Text(
                                      barcode?.displayValue != null ? "Invalid Account" : 'Scan QR Code',
                                      overflow: TextOverflow.fade,
                                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                            color: barcode?.displayValue != null ? Colors.red : Colors.white,
                                            fontSize: 16,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                            if (!isBitcoinAddress(barcode?.displayValue) && widget.scanType == ScanType.bitcoinAddress) ...[
                              Center(
                                child: SizedBox(
                                  width: 0.8.sw,
                                  height: 30,
                                  child: Center(
                                    child: Text(
                                      barcode?.displayValue != null ? "Invalid bitcoin address" : 'Scan QR Code',
                                      overflow: TextOverflow.fade,
                                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                            color: barcode?.displayValue != null ? Colors.red : Colors.white,
                                            fontSize: 16,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                            if (isPrincipal(barcode?.displayValue) && widget.scanType == ScanType.principal) ...[
                              Center(
                                child: SizedBox(
                                  width: 0.8.sw,
                                  height: 30,
                                  child: FittedBox(
                                    child: Text(
                                      barcode?.displayValue ?? "",
                                      overflow: TextOverflow.fade,
                                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                            color: barcode?.displayValue != null ? Colors.green : Colors.white,
                                            fontSize: 16,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              CoolButton(
                                onTapUp: () {
                                  context.pop(barcode?.displayValue);
                                },
                                child: Text(
                                  "ok",
                                  style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.black),
                                ),
                              ),
                            ],
                            if (isAccount(barcode?.displayValue) && widget.scanType == ScanType.accountID) ...[
                              Center(
                                child: SizedBox(
                                  width: 0.8.sw,
                                  height: 30,
                                  child: FittedBox(
                                    child: Text(
                                      barcode?.displayValue ?? "",
                                      overflow: TextOverflow.fade,
                                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                            color: barcode?.displayValue != null ? Colors.green : Colors.white,
                                            fontSize: 16,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              CoolButton(
                                onTapUp: () {
                                  context.pop(barcode?.displayValue);
                                },
                                child: Text(
                                  "ok",
                                  style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.black),
                                ),
                              ),
                            ],
                            if (isBitcoinAddress(barcode?.displayValue) && widget.scanType == ScanType.bitcoinAddress) ...[
                              Center(
                                child: SizedBox(
                                  width: 0.8.sw,
                                  height: 30,
                                  child: FittedBox(
                                    child: Text(
                                      barcode?.displayValue ?? "",
                                      overflow: TextOverflow.fade,
                                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                          color: barcode?.displayValue != null ? Colors.green : Colors.white, fontSize: 16),
                                    ),
                                  ),
                                ),
                              ),
                              CoolButton(
                                onTapUp: () {
                                  context.pop(barcode?.displayValue);
                                },
                                child: Text(
                                  "ok",
                                  style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.black),
                                ),
                              ),
                            ]
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class ScannerOverlay extends CustomPainter {
  ScannerOverlay(this.scanWindow);

  final Rect scanWindow;

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPath = Path()..addRect(Rect.largest);
    final cutoutPath = Path()..addRect(scanWindow);

    final backgroundPaint = Paint()
      ..color = Colors.black.withOpacity(0.5)
      ..style = PaintingStyle.fill
      ..blendMode = BlendMode.dstOut;

    final backgroundWithCutout = Path.combine(
      PathOperation.difference,
      backgroundPath,
      cutoutPath,
    );
    canvas.drawPath(backgroundWithCutout, backgroundPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class BarcodeOverlay extends CustomPainter {
  BarcodeOverlay({
    required this.barcode,
    required this.arguments,
    required this.boxFit,
    required this.capture,
  });

  final BarcodeCapture capture;
  final Barcode barcode;
  final MobileScannerArguments arguments;
  final BoxFit boxFit;

  @override
  void paint(Canvas canvas, Size size) {
    if (barcode.corners == null) return;
    final adjustedSize = applyBoxFit(boxFit, arguments.size, size);

    double verticalPadding = size.height - adjustedSize.destination.height;
    double horizontalPadding = size.width - adjustedSize.destination.width;
    if (verticalPadding > 0) {
      verticalPadding = verticalPadding / 2;
    } else {
      verticalPadding = 0;
    }

    if (horizontalPadding > 0) {
      horizontalPadding = horizontalPadding / 2;
    } else {
      horizontalPadding = 0;
    }

    final ratioWidth = (Platform.isIOS ? capture.width! : arguments.size.width) / adjustedSize.destination.width;
    final ratioHeight = (Platform.isIOS ? capture.height! : arguments.size.height) / adjustedSize.destination.height;

    final List<Offset> adjustedOffset = [];
    for (final offset in barcode.corners!) {
      adjustedOffset.add(
        Offset(
          offset.dx / ratioWidth + horizontalPadding,
          offset.dy / ratioHeight + verticalPadding,
        ),
      );
    }
    final cutoutPath = Path()..addPolygon(adjustedOffset, true);

    final backgroundPaint = Paint()
      ..color = Colors.red.withOpacity(0.3)
      ..style = PaintingStyle.fill
      ..blendMode = BlendMode.dstOut;

    canvas.drawPath(cutoutPath, backgroundPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
