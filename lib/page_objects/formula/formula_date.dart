import 'package:flutter_notion_sdk/page_objects/formula/formula_model.dart';

class FormulaDate implements FormulaModel {
  final DateTime? value;

  FormulaDate({this.value});

  @override
  fromMap(Map<String, dynamic> map) {
    return FormulaDate(
      value: DateTime.parse(map['date']),
    );
  }
}
