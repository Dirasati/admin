import 'package:dirasaty_admin/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfWidget extends StatelessWidget {
  final SfPdfViewer pdfViewer;

  final double? width;
  final double? height;
  final double? borderRadius;
  const PdfWidget({
    super.key,
    required this.pdfViewer,
    this.width,
    this.height,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 0),
        color: Colors.white,
        border: Border.all(color: AppColors.black, width: 1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius ?? 0),
        child: pdfViewer,
      ),
    );
  }
}
