import 'dart:io';

import 'package:flutter/material.dart';

class ImageManager {
  List<Image> images = [];

  populateImagesManually() {
    images = [];
    images.add(Image.asset(
      './assets/1panqueca.png',
      scale: 0.8,
      fit: BoxFit.cover,
      height: 70,
      width: 70,
    ));
    images.add(Image.asset(
      './assets/2latte.png',
      scale: 2.0,
      fit: BoxFit.cover,
      alignment: FractionalOffset.center,
      width: 70,
      height: 70,
    ));
    images.add(Image.asset(
      './assets/3executivo_de_frango.png',
      scale: 0.8,
      fit: BoxFit.cover,
      height: 70,
      width: 70,
    ));
    //Image image2 = Image.file(File(imagePath);
  }
}
