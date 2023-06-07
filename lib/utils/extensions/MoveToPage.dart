import 'package:flutter/material.dart';

extension MoveToPage on BuildContext {
  push({required String nameRoute, arguments}) {
    Navigator.of(this).pushNamed(nameRoute, arguments: arguments);
  }
}
