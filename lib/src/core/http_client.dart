// ignore_for_file: public_member_api_docs

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:squad_maker/src/core/core.dart';
import 'package:http/http.dart';

enum RequestMethod { get, post, put, delete }

class HttpClient {
  HttpClient({Client? client, required String baseUrl})
      : _client = client ?? Client(),
        _baseUrl = baseUrl;

  final Client _client;
  final String _baseUrl;

  Future<List<dynamic>> makeRequest(
    RequestMethod method, {
    required String path,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    log(_parseUrl(path).toString());
    try {
      if (method == RequestMethod.get) {
        return _mapResponse(
          await _client.get(
            _parseUrl(path),
            headers: headers ?? _getHeaders(),
          ),
        );
      } else if (method == RequestMethod.post) {
        return _mapResponse(
          await _client.post(
            _parseUrl(path),
            headers: headers ?? _getHeaders(),
          ),
        );
      } else if (method == RequestMethod.put) {
        return _mapResponse(
          await _client.put(
            _parseUrl(path),
            headers: headers ?? _getHeaders(),
          ),
        );
      } else if (method == RequestMethod.delete) {
        return _mapResponse(
          await _client.delete(
            _parseUrl(path),
            headers: headers ?? _getHeaders(),
          ),
        );
      }
    } on TimeoutException {
      throw TimeOutException();
    } on SocketException {
      throw NoConnectionException();
    } catch (e) {
      rethrow;
    }

    throw HttpException();
  }

  Map<String, String>? _getHeaders() {
    return <String, String>{'Content-Type': 'application/json'};
  }

  List<dynamic> _mapResponse(Response res) {
    if (res.statusCode == 200) {
      try {
        return json.decode(res.body) as List<dynamic>;
      } catch (e) {
        throw ErrorResponseException();
      }
    } else {
      throw ServerException(code: res.statusCode.toString());
    }
  }

  Uri _parseUrl(String url) {
    return Uri.parse(_baseUrl + url);
  }
}
