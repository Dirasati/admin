part of 'paent_dto.dart';

class UpdateParentDto extends ParentDto {
  final ParentModel _parent;

  UpdateParentDto(this._parent);

  @override
  Future<Map<String, dynamic>> toMap() {
    return Future.value({});
  }

  @override
  void dispose() {}

  String get id => _parent.id!;
}
