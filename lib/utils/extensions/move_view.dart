import 'package:flutter/material.dart';

extension Nav on BuildContext {
  push({required String nameScreen, Object? arguments}) {
    return Navigator.pushNamed(this, nameScreen, arguments: arguments);
  }

  pushAndRemoveUntil({required String nameScreen, Object? arguments}) {
    return Navigator.pushNamedAndRemoveUntil(
        this, nameScreen, ModalRoute.withName('/'),
        arguments: arguments);
  }
}
