import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:app/src/main_index.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

import '../../../../core/widgets/texts/black_texts.dart';
import '../../../../core/widgets/texts/primary_texts.dart';

class SignaturePad extends StatelessWidget {
  final Function(String?) onSigned;

  const SignaturePad({super.key, required this.onSigned});

  @override
  Widget build(BuildContext context) {
    GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlackMediumText(label: 'Signature', fontSize: 16),
        10.ph,
        Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Colors.grey),
          ),
          child: Stack(
            children: [
              SfSignaturePad(
                key: _signaturePadKey,
                onDrawEnd: () async {
                  await _signaturePadKey.currentState!
                      .toImage()
                      .then((value) async {
                    // get the image as a base64 string
                    final ByteData? byteData =
                        await value.toByteData(format: ImageByteFormat.png)!;
                    final Uint8List pngBytes = byteData!.buffer.asUint8List();
                    final String base64 = base64Encode(pngBytes);
                    onSigned(base64);
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.clear),
                onPressed: () async {
                  _signaturePadKey.currentState?.clear();
                  onSigned(null);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
