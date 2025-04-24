import 'dart:async';

import 'package:dirasaty_admin/core/shared/widgets/pdf_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:dirasaty_admin/core/di/locator.dart';
import 'package:dirasaty_admin/core/services/cloudstorage/cloud_storage.service.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

part 'pdf_dto.dart';

abstract class FileDTO {
  /// Widget builder to display the file
  Widget build({double? width, double? height, double? borderRadius});

  Future<String> get url;
}
