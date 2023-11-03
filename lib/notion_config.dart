class NotionConfig {
  late String notionVersion;
  late String notionApiKey;

  static final NotionConfig _singleton = NotionConfig._internal();

  factory NotionConfig({String? version, String? apiKey}) {
    if (version != null) _singleton.notionVersion = version;
    if (apiKey != null) _singleton.notionApiKey = apiKey;
    return _singleton;
  }

  NotionConfig._internal();

  static NotionConfig get instance => _singleton;

  // You could also include methods to validate the provided keys.
}
