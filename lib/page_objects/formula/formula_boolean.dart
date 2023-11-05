import 'package:notion_sdk/page_objects/formula/formula_model.dart';

class FormulaBoolean implements FormulaModel {
  final bool value;

  FormulaBoolean({this.value = false});

  @override
  fromMap(Map<String, dynamic> map) {
    return FormulaBoolean(
      value: map['boolean'],
    );
  }
}
