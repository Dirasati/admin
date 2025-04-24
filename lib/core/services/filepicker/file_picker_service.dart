import 'dart:async';

import 'package:dirasaty_admin/core/di/locator.dart';
import 'package:dirasaty_admin/core/shared/dto/filedto/file_dto.dart';
import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';

mixin FilePickerService<T extends FileDTO> {
  Future<T?> pickFile();

  Future<List<T>?> pickFiles({int? maxFiles});
}

@lazySingleton
class PdfPickerService with FilePickerService<LocalPdfDTO> {
  final _picker = FilePicker.platform;

  @override
  Future<LocalPdfDTO?> pickFile() {
    return _picker
        .pickFiles(
          type: FileType.custom,
          allowedExtensions: ['pdf'],
          allowMultiple: false,
        )
        .then((value) {
          if (value != null && value.files.isNotEmpty) {
            return LocalPdfDTO(value.files.first);
          }
          return null;
        });
  }

  @override
  Future<List<LocalPdfDTO>?> pickFiles({int? maxFiles}) {
    return _picker
        .pickFiles(
          type: FileType.custom,
          allowedExtensions: ['pdf'],
          allowMultiple: true,
        )
        .then((value) {
          if (value != null && value.files.isNotEmpty) {
            return value.files
                .map((file) => LocalPdfDTO(file))
                .toList();
          }
          return null;
        });
  }
}
