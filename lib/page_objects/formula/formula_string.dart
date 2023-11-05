import 'package:notion_sdk/page_objects/formula/formula_model.dart';

class FormulaString implements FormulaModel {
  final String value;
  FormulaString({this.value = ''});
  @override
  fromMap(Map<String, dynamic> map) {
    return FormulaString(
      value: map['string'],
    );
  }
}
