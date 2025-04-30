part of 'subject_dto.dart';

class UpdateSubjectDto extends SubjectDto {
  final SubjectModel _subject;

  UpdateSubjectDto(this._subject)
    : super(
        nameController: TextEditingController(text: _subject.name),

        levelController: EditingController<String>(_subject.level),

        coefficientController: EditingController<int>(
          _subject.coefficient,
        ),

        isMainController: BooleanEditingController(
          _subject.isMain ?? false,
        ),
      );

  String get id => _subject.id!;

  @override
  Future<Map<String, dynamic>> toMap() async {
    return {
      if (nameController.text != _subject.name)
        'name': nameController.text,

      if (levelController.value != _subject.level)
        'level': levelController.value,

      if (coefficientController.value != _subject.coefficient)
        'coefficient': coefficientController.value,

      if (isMainController.value != _subject.isMain)
        'isMain': isMainController.value,
    };
  }
}
