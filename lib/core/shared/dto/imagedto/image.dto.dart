import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dirasaty_admin/core/di/locator.dart';
import 'package:dirasaty_admin/core/services/cloudstorage/cloud_storage.service.dart';

part 'local_image.dto.dart';
part 'remote_image.dto.dart';

abstract class ImageDTO {
  ImageProvider get image;

  Future<String> get imageUrl;
}

extension ImagesDtoMapper on List<ImageDTO> {
  Future<List<String>> get imageUrls async {
    return Future.wait(map((e) => e.imageUrl));
  }
}


abstract class VideoDTO {
  ImageProvider get video;

  Future<String> get videoUrl;
}