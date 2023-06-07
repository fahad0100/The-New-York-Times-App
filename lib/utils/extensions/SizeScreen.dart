import 'package:flutter/material.dart';

extension SizeScreen on BuildContext {
  screenSize() {
    return MediaQuery.of(this).size;
  }

  screenHeight() {
    return MediaQuery.of(this).size.height;
  }

  screenSizeDividedBy({required double divideNumber}) {
    final sizeScreen = MediaQuery.of(this).size;

    return Size(
      sizeScreen.width / divideNumber,
      sizeScreen.width / divideNumber,
    );
  }

  screenWith() {
    return MediaQuery.of(this).size.width;
  }
}
