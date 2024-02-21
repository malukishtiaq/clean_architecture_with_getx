import 'document.dart';

abstract class DocumentListEntity {
  const DocumentListEntity({
    this.listDocumentsSent,
    this.listDocumentsReceived,
  });

  final List<DocumentEntity>? listDocumentsSent;
  final List<DocumentEntity>? listDocumentsReceived;

  DocumentListEntity copyWith({
    final List<DocumentEntity>? listDocumentsSent,
    final List<DocumentEntity>? listDocumentsReceived,
  });
}
