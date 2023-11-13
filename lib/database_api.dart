import 'dart:convert';

import 'package:flutter_notion_sdk/notion_client.dart';

class DatabaseAPI {
  final NotionClient client = NotionClient();
  Future<Map<String, dynamic>> createDatabase({
    required String pageId,
    required Map<String, dynamic> properties,
    required String title,
  }) async {
    try {
      var body = {
        'parent': {'type': 'page_id', 'page_id': pageId},
        'properties': properties,
        "title": [
          {
            "type": "text",
            "text": {"content": title, "link": null}
          }
        ],
      };

      var response = await client.sendRequest(
        endpoint: 'databases',
        method: 'POST',
        body: body,
      );
      if (response.statusCode == 200) {
        return json.decode(await response.stream.bytesToString());
      } else {
        throw Exception('Failed to create the page: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Map<String, dynamic>> retrieveDatabase(
      {required String databaseId}) async {
    try {
      var response = await client.sendRequest(
        endpoint: 'databases/$databaseId',
        method: 'GET',
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

  Future<Map<String, dynamic>> queryDatabase(
      {required String databaseId,
      required Map<String, dynamic> filter,
      required List<Map<String, dynamic>> sorts}) async {
    try {
      var body = {
        'filter': filter,
        'sorts': sorts,
      };
      var response = await client.sendRequest(
        endpoint: 'databases/$databaseId/query',
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

  Future<Map<String, dynamic>> filter({
    required String databaseId,
    required Map<String, dynamic> filter,
  }) async {
    try {
      var body = {
        'filter': filter,
      };
      var response = await client.sendRequest(
        endpoint: 'databases/$databaseId/query',
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
  Future<Map<String, dynamic>> sort({
    required String databaseId,
     required List<Map<String, dynamic>> sorts
  }) async {
    try {
      var body = {
        'sorts': sorts,
      };
      var response = await client.sendRequest(
        endpoint: 'databases/$databaseId/query',
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

  Future<Map<String, dynamic>> updateDatabase(
      {required String databaseId, required Map<String,dynamic> updateJson}) async {
    try {
      var response = await client.sendRequest(
        endpoint: 'databases/$databaseId',
        method: 'PATCH',
        body: updateJson
      );

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        return json.decode(responseBody) as Map<String, dynamic>;
      } else {
        throw Exception(
            'Failed to retrieve property: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Map<String, dynamic>> updateProperties(
      {required String databaseId,
      required Map<String, dynamic> properties}) async {
    try {
      var response = await client.sendRequest(
        endpoint: 'databases/$databaseId',
        method: 'PATCH',
        body: properties
      );

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        return json.decode(responseBody) as Map<String, dynamic>;
      } else {
        throw Exception('Failed to update the page: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
