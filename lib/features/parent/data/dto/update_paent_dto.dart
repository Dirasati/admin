part of 'paent_dto.dart';

class UpdateParentDto extends ParentDto {
  @override
  Future<Map<String, dynamic>> toMap() {
    return Future.value({});
  }

  @override
  void dispose() {}

  String get id => '';
}
