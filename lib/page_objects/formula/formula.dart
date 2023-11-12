import 'package:flutter_notion_sdk/page_objects/formula/formula_model.dart';

class Formula {
  final FormulaModel formula;
  Formula({required this.formula});
  factory Formula.fromMap(Map<String, dynamic> map) {
    final currentFormula = FormulaModel.generate(map['type']);
    return currentFormula.fromMap(map);
  }
}
