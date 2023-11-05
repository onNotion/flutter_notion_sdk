import 'package:notion_sdk/page_objects/formula/formula_boolean.dart';
import 'package:notion_sdk/page_objects/formula/formula_date.dart';
import 'package:notion_sdk/page_objects/formula/formula_number.dart';
import 'package:notion_sdk/page_objects/formula/formula_string.dart';
import 'package:notion_sdk/page_objects/formula/formula_type.dart';

abstract class FormulaModel {
  fromMap(Map<String, dynamic> map);
  factory FormulaModel.generate(String type) {
    switch (FormulaType.fromString(type)) {
      case FormulaType.boolean:
        return FormulaBoolean();
      case FormulaType.date:
        return FormulaDate();
      case FormulaType.number:
        return FormulaNumber();
      case FormulaType.string:
        return FormulaString();
    }
  }
}
