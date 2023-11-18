import 'dart:convert';

import 'package:flutter_notion_sdk/notion_client.dart';

class PagesAPI {
  final NotionClient client = NotionClient();
  Future<Map<String, dynamic>> createPage({
    required String databaseId,
    required Map<String, dynamic> properties,
    String? icon,
  }) async {
    try {
      var body = {
        'parent': {'database_id': databaseId},
        'properties': properties,
      };

      if (icon != null) {
        body['icon'] = {
          'type': 'emoji',
          'emoji': icon,
        };
      }

      var response = await client.sendRequest(
          endpoint: 'pages', method: 'POST', body: body, isNeedBearer: true);
      if (response.statusCode == 200) {
        return json.decode(await response.stream.bytesToString());
      } else {
        throw Exception('Failed to create the page: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Map<String, dynamic>> retrievePage({required String pageId}) async {
    try {
      var response = await client.sendRequest(
        endpoint: 'pages/$pageId',
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

  Future<Map<String, dynamic>> retrievePageProperty(
      {required String pageId, required String propertyId}) async {
    try {
      var response = await client.sendRequest(
        endpoint: 'pages/$pageId/$propertyId',
        method: 'GET',
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

  Future<Map<String, dynamic>> updatePage(
      {required String pageId,
      required Map<String, dynamic> properties}) async {
    try {
      var response = await client.sendRequest(
          endpoint: 'pages/$pageId', method: 'PATCH', body: properties);

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
