import 'package:notion_sdk/page_objects/formula/formula_model.dart';

class FormulaNumber implements FormulaModel {
  final num value;

  FormulaNumber({this.value = 0});

  @override
  fromMap(Map<String, dynamic> map) {
    return FormulaNumber(
      value: map['number'],
    );
  }
}
