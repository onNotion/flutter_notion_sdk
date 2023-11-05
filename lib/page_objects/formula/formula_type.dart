enum FormulaType {
  boolean('boolean'),
  date('date'),
  number('number'),
  string('string');

  final String value;
  const FormulaType(this.value);

  factory FormulaType.fromString(String value) =>
      FormulaType.values.firstWhere((e) => e.value == value);
}
