import 'package:dirasaty_admin/core/services/filepicker/file_picker_service.dart';
import 'package:dirasaty_admin/core/shared/classes/dimensions.dart';
import 'package:dirasaty_admin/core/shared/classes/editioncontollers/generic_editingcontroller.dart';
import 'package:dirasaty_admin/core/shared/dto/filedto/file_dto.dart';
import 'package:dirasaty_admin/core/shared/widgets/button.dart';
import 'package:dirasaty_admin/core/themes/colors.dart';
import 'package:dirasaty_admin/core/themes/font_styles.dart';
import 'package:dirasaty_admin/core/themes/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppFileField<T extends FileDTO, D extends FilePickerService<T>>
    extends StatelessWidget {
  final EditingController<T> controller;

  final D filePickerService;

  final String? label;
  final String uploadText;

  final double? height;
  final double? width;
  final double? borderRadius;

  final bool isRequired;

  const AppFileField({
    super.key,
    this.label,
    required this.controller,
    required this.filePickerService,
    this.uploadText = 'Upload',
    this.height,
    this.width,
    this.borderRadius,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return FormField(
      validator: (_) {
        if (isRequired && controller.value == null) {
          return 'File is required';
        }
        return null;
      },
      builder:
          (state) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (label != null) ...[
                Text(label!, style: AppTextStyles.h4),
                heightSpace(8),
              ],

              ValueListenableBuilder(
                valueListenable: controller,
                builder: (context, value, child) {
                  return (value == null)
                      ? AppButton.secondary(
                        text: uploadText,
                        suffixIcon: AppIcons.file_upload,
                        onPressed: _uploadFile,
                      )
                      : Stack(
                        children: [
                          value.build(
                            width: width,
                            height: height,
                            borderRadius: borderRadius,
                          ),

                          PositionedDirectional(
                            top: 4.h,
                            end: 4.w,
                            child: IconButton(
                              onPressed: controller.clear,
                              icon: const Icon(
                                Icons.close,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      );
                },
              ),

              if (state.hasError) ...[
                heightSpace(4),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widthSpace(8),
                    Icon(
                      AppIcons.error_outline,
                      color: AppColors.red,
                      size: 20.r,
                    ),
                    widthSpace(8),
                    Expanded(
                      child: Text(
                        state.errorText!,
                        style: AppTextStyles.error,
                      ),
                    ),
                    widthSpace(8),
                  ],
                ),
              ],
            ],
          ),
    );
  }

  void _uploadFile() async {
    final file = await filePickerService.pickFile();
    if (file != null) controller.setValue(file);
  }
}
