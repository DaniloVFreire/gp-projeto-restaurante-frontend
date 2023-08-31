import 'dart:io';

import 'package:flutter/material.dart';

class ImageManager{
  List<Image> images = [];

  populateImagesFromAssets() async {
    final dir = Directory('');
    final List<FileSystemEntity> entities = await dir.list().toList();
    entities.forEach(print);
    final Iterable<File> files = entities.whereType<File>();
  }
  populateImagesManually(){
    images = [];
    images.add(Image.asset('./assets/1panqueca.png',scale:0.8,fit: BoxFit.cover,height: 70,width: 70,));
    images.add(Image.asset('./assets/2latte.png',scale:2.0,fit: BoxFit.cover, alignment: FractionalOffset.center,width: 70, height: 70,));
    images.add(Image.asset('./assets/3executivo_de_frango.png',scale:0.8,fit: BoxFit.cover,height: 70,width: 70,));
    //Image image2 = Image.file(File(imagePath);
  }

}