part of 'file_dto.dart';

/// PdfDTO is a subclass of FileDTO that represents a PDF file.
abstract class PdfDTO extends FileDTO {
  final SfPdfViewer pdfViewer;

  PdfDTO(this.pdfViewer);

  @override
  Widget build({
    double? width,
    double? height,
    double? borderRadius,
  }) => PdfWidget(
    pdfViewer: pdfViewer,
    width: width,
    height: height,
    borderRadius: borderRadius,
  );
}

/// LocalPdfDTO is a subclass of PdfDTO that represents a local PDF file.
class LocalPdfDTO extends PdfDTO {
  final _pdfUploadService = locator<PdfCloudStorageService>();

  final PlatformFile _pdfFile;

  LocalPdfDTO(this._pdfFile)
    : super(SfPdfViewer.memory(_pdfFile.bytes!));

  @override
  Future<String> get url async =>
      _pdfUploadService.upload(_pdfFile.bytes!, _pdfFile.name);
}

/// RemotePdfDTO is a subclass of PdfDTO that represents a remote PDF file.
class RemotePdfDTO extends PdfDTO {
  final String _url;

  RemotePdfDTO(this._url) : super(SfPdfViewer.network(_url));

  @override
  Future<String> get url async => _url;
}
