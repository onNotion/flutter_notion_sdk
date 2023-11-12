import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:notion_sdk/notion_config.dart';

class NotionClient {
  NotionClient();

  Future<http.StreamedResponse> sendRequest({
    required String endpoint,
    required String method,
    Map<String, dynamic>? body,
  }) async {
    var headers = {
      'Content-Type': 'application/json',
      'Notion-Version': NotionConfig.instance.notionVersion,
      'Authorization': NotionConfig.instance.notionApiKey
    };
    debugPrint('NotionClient: $method $endpoint');
    debugPrint('NotionClient: $headers');
    debugPrint('NotionClient API: ${NotionConfig.instance.notionApiKey}');
    var uri = Uri.parse('https://api.notion.com/v1/$endpoint');
    var request = http.Request(method, uri)..headers.addAll(headers);

    if (body != null) {
      request.body = json.encode(body);
    }

    return request.send();
  }
}