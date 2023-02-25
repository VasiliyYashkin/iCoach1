import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Fat secret Group Code

class FatSecretGroup {
  static String baseUrl = 'https://platform.fatsecret.com/rest/server.api';
  static Map<String, String> headers = {
    'oauth_consumer_key': '68b9c03beeda4e6a925e5e6b511c19d4',
    'oauth_signature_method': 'HMAC-SHA1',
  };
  static OauthOneCall oauthOneCall = OauthOneCall();
  static CreateProfileCall createProfileCall = CreateProfileCall();
}

class OauthOneCall {
  Future<ApiCallResponse> call({
    int? oauthTimestamp,
    String? oauthNonce = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'OauthOne',
      apiUrl: '${FatSecretGroup.baseUrl}oauth_version',
      callType: ApiCallType.POST,
      headers: {
        ...FatSecretGroup.headers,
        'oauth_version': '1.0',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CreateProfileCall {
  Future<ApiCallResponse> call({
    int? oauthTimestamp,
    String? oauthNonce = '',
    String? oauthSignature = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'createProfile',
      apiUrl: '${FatSecretGroup.baseUrl}/profile.create',
      callType: ApiCallType.GET,
      headers: {
        ...FatSecretGroup.headers,
      },
      params: {
        'oauth_consumer_key': "68b9c03beeda4e6a925e5e6b511c19d4",
        'oauth_signature_method': "HMAC-SHA1",
        'oauth_timestamp': oauthTimestamp,
        'oauth_nonce': oauthNonce,
        'oauth_version': "1.0",
        'oauth_signature': oauthSignature,
        'method': "profile.create",
        'format': "json",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Fat secret Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
