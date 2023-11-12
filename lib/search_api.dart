import 'dart:convert';
import 'package:flutter_notion_sdk/notion_client.dart';

class SearchApi {
  final NotionClient client = NotionClient();
  
  Future<Map<String, dynamic>> search({required String query}) async {
    
    var body = {
      "query": "",
      "sort": {"direction": "ascending", "timestamp": "last_edited_time"}
    };
    try {
      var response = await client.sendRequest(
        endpoint: 'search',
        method: 'POST',
        body: body,
      );

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        return json.decode(responseBody) as Map<String, dynamic>;
      } else {
        throw Exception(
            'Failed to retrieve the page: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  
}
