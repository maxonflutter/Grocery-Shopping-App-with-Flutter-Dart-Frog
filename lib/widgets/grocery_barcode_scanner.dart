import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class GroceryBarcodeScanner extends StatefulWidget {
  const GroceryBarcodeScanner({super.key});

  @override
  State<GroceryBarcodeScanner> createState() => _GroceryBarcodeScannerState();
}

class _GroceryBarcodeScannerState extends State<GroceryBarcodeScanner> {
  late MobileScannerController controller = MobileScannerController();
  Barcode? barcode;
  BarcodeCapture? capture;
  MobileScannerArguments? arguments;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    final scanWindow = Rect.fromCenter(
      center: size.center(Offset.zero),
      width: 200,
      height: 200,
    );
    return Builder(
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
              onDetect: (BarcodeCapture barcode) async {
                print(barcode.barcodes.first);
                print(barcode.barcodes.first);

                controller.stop();

                showModalBottomSheet(
                  context: context,
                  builder: (context) => Container(
                    height: 200,
                    child: const Center(
                      child: Text("barcode.barcodes.first.displayValue"),
                    ),
                  ),
                ).then(
                  (isManuallyHidden) {
                    if (isManuallyHidden ?? false) {
                      controller.start();
                    } else {
                      controller.start();
                    }
                  },
                );

                controller.stop();

                // capture = barcode;
                // setState(() => this.barcode = barcode.barcodes.first);
              },
              errorBuilder: (context, error, child) {
                return ScannerErrorWidget(error: error);
              },
            ),
            if (barcode != null &&
                barcode?.corners != null &&
                arguments != null)
              CustomPaint(
                painter: BarcodeOverlay(
                  barcode: barcode!,
                  arguments: arguments!,
                  boxFit: BoxFit.contain,
                  capture: capture!,
                ),
              ),
            CustomPaint(painter: ScannerOverlay(scanWindow)),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                alignment: Alignment.bottomCenter,
                height: 100,
                color: Colors.black.withOpacity(0.4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: SizedBox(
                        width: size.width - 120,
                        height: 50,
                        child: FittedBox(
                          child: Text(
                            barcode?.displayValue ?? 'Scan something!',
                            overflow: TextOverflow.fade,
                            style: textTheme.headlineMedium!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
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

    final ratioWidth =
        (Platform.isIOS ? capture.width! : arguments.size.width) /
            adjustedSize.destination.width;
    final ratioHeight =
        (Platform.isIOS ? capture.height! : arguments.size.height) /
            adjustedSize.destination.height;

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

class ScannerErrorWidget extends StatelessWidget {
  const ScannerErrorWidget({Key? key, required this.error}) : super(key: key);

  final MobileScannerException error;

  @override
  Widget build(BuildContext context) {
    String errorMessage;

    switch (error.errorCode) {
      case MobileScannerErrorCode.controllerUninitialized:
        errorMessage = 'Controller not ready.';
        break;
      case MobileScannerErrorCode.permissionDenied:
        errorMessage = 'Permission denied';
        break;
      case MobileScannerErrorCode.unsupported:
        errorMessage = 'Scanning is unsupported on this device';
        break;
      default:
        errorMessage = 'Generic Error';
        break;
    }

    return ColoredBox(
      color: Colors.black,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Icon(Icons.error, color: Colors.white),
            ),
            Text(
              errorMessage,
              style: const TextStyle(color: Colors.white),
            ),
            Text(
              error.errorDetails?.message ?? '',
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
