import 'package:arth_app/common/assets/assets.dart';
import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class QrService {
  Widget showQr(String data) {
    return PrettyQr(
      image: const AssetImage(Assets.ckBtc),
      typeNumber: 10,
      size: 200,
      data: data,
      errorCorrectLevel: QrErrorCorrectLevel.Q,
      roundEdges: true,
    );
  }
}
