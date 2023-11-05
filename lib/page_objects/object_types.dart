enum ObjectTypes {
  checkbox('checkbox'),
  createdBy('created_by'),
  createdTime('created_time'),
  date('date'),
  email('email'),
  files('files'),
  formula('formula'),
  lastEditedBy('last_edited_by'),
  lastEditedTime('last_edited_time'),
  multiSelect('multi_select'),
  number('number'),
  people('people'),
  phoneNumber('phone_number'),
  relation('relation'),
  rollUp('rollup'),
  richText('rich_text'),
  select('select'),
  status('status'),
  title('title'),
  url('url'),
  unigueId('unigue_id'),
  verification('verification');

  final String value;
  const ObjectTypes(this.value);
  factory ObjectTypes.fromString(String value) =>
      ObjectTypes.values.firstWhere((e) => e.value == value);
}
