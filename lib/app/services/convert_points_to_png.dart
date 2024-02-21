import 'dart:io';
import 'dart:ui' as ui;
import 'dart:ui';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class ConvertPointsToPngServices extends GetxController {
  factory ConvertPointsToPngServices() {
    if (Get.isRegistered<ConvertPointsToPngServices>()) {
      return Get.find<ConvertPointsToPngServices>();
    } else {
      return Get.put(ConvertPointsToPngServices._());
    }
  }

  ConvertPointsToPngServices._();

  Future<ui.Image> rendered(List<Offset> points) async {
    ui.PictureRecorder recorder = ui.PictureRecorder();
    Canvas canvas = Canvas(recorder);
    SignaturePainter painter = SignaturePainter(points: points);
    painter.paint(canvas, const Size(300, 190));
    return recorder.endRecording().toImage(300, 190);
  }

  Future<String?> handleImage(List<Offset> points) async {
    Uuid uuid = const Uuid();
    String signatureName = uuid.v4();
    var image = await rendered(points);
    var pngBytes = await image.toByteData(format: ui.ImageByteFormat.png);

    if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.android) {
      Directory tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path;
      File imgFile = File('$tempPath/${signatureName}_signature.png');
      await imgFile.writeAsBytes(pngBytes!.buffer.asUint8List());
      return imgFile.path;
    } else {
      await FileSaver.instance.saveFile(
        name: '${signatureName}_signature.png',
        bytes: pngBytes?.buffer.asUint8List(),
        mimeType: MimeType.png,
      );
      return null;
    }
  }

  Future<String?> getFilePathFromTextField(Uint8List? bytes) async {
    Uuid uuid = const Uuid();
    String signatureName = uuid.v4();
    if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.android) {
      Directory tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path;
      File imgFile = File('$tempPath/${signatureName}_signature.png');

      if (bytes != null) {
        await imgFile.writeAsBytes(bytes);
      }
      return imgFile.path;
    } else {
      await FileSaver.instance.saveFile(
        name: '${signatureName}_signature.png',
        bytes: bytes,
        mimeType: MimeType.png,
      );
      return null;
    }
  }

  Future<String?> getCanvasImage(String str) async {
    var builder = ParagraphBuilder(
      ParagraphStyle(
        fontFamily: 'Cherolina',
        fontSize: 120,
      ),
    );
    builder.pushStyle(ui.TextStyle(color: Colors.black));
    builder.addText(str);

    Paragraph paragraph = builder.build();
    paragraph.layout(const ParagraphConstraints(width: 600));

    final recorder = PictureRecorder();
    var newCanvas = Canvas(recorder);

    newCanvas.drawParagraph(paragraph, Offset.zero);

    final picture = recorder.endRecording();
    var res = await picture.toImage(600, 200);
    ByteData? data = await res.toByteData(format: ImageByteFormat.png);

    Uuid uuid = const Uuid();
    String signatureName = uuid.v4();

    if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.android) {
      Directory tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path;
      File imgFile = File('$tempPath/${signatureName}_signature.png');
      if (data != null) {
        Uint8List bytes = data.buffer.asUint8List();
        await imgFile.writeAsBytes(bytes);
      }
      return imgFile.path;
    } else {
      await FileSaver.instance.saveFile(
        name: '${signatureName}_signature.png',
        bytes: data?.buffer.asUint8List(),
        mimeType: MimeType.png,
      );
      return null;
    }
  }
}

class SignaturePainter extends CustomPainter {
  final List<Offset> points;

  SignaturePainter({required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    final connectingLinePaint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1.0;

    for (var i = 0; i < points.length - 1; i++) {
      canvas.drawLine(points[i], points[i + 1], connectingLinePaint);
    }
  }

  @override
  bool shouldRepaint(SignaturePainter oldDelegate) {
    return true;
  }
}
