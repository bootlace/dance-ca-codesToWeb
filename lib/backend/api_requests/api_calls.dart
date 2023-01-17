import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Auth Group Code

class AuthGroup {
  static String baseUrl = 'https://api.ca.dance/v1/circle/login/';
  static Map<String, String> headers = {
    'Authorization':
        'Bearer 529ddfda54cf1478d1906bf9196069d3d57f602f93c375804d8914cacceb30d8',
  };
  static ValidatePinCall validatePinCall = ValidatePinCall();
  static ValidateEmailCall validateEmailCall = ValidateEmailCall();
}

class ValidatePinCall {
  Future<ApiCallResponse> call({
    int? pin,
    String? login = '',
    String? method = '',
    String? challengeID = '',
    String? circleToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Validate Pin',
      apiUrl: '${AuthGroup.baseUrl}pin/index.php',
      callType: ApiCallType.GET,
      headers: {
        ...AuthGroup.headers,
        'circleToken': '${circleToken}',
      },
      params: {
        'pin': pin,
        'login': login,
        'method': method,
        'cid': challengeID,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic pinIsValid(dynamic response) => getJsonField(
        response,
        r'''$.success''',
      );
  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  dynamic sessionToken(dynamic response) => getJsonField(
        response,
        r'''$.token''',
      );
  dynamic memberID(dynamic response) => getJsonField(
        response,
        r'''$.member_id''',
      );
}

class ValidateEmailCall {
  Future<ApiCallResponse> call({
    String? email = '',
    int? mobile,
    String? circleToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Validate Email',
      apiUrl: '${AuthGroup.baseUrl}validate/index.php',
      callType: ApiCallType.GET,
      headers: {
        ...AuthGroup.headers,
        'circleToken': '${circleToken}',
      },
      params: {
        'email': email,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic isMember(dynamic response) => getJsonField(
        response,
        r'''$.success''',
      );
  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  dynamic memberID(dynamic response) => getJsonField(
        response,
        r'''$.member_id''',
      );
  dynamic firstName(dynamic response) => getJsonField(
        response,
        r'''$.first_name''',
      );
  dynamic challengeID(dynamic response) => getJsonField(
        response,
        r'''$.challenge_id''',
      );
}

/// End Auth Group Code

/// Start Cady Codes Group Code

class CadyCodesGroup {
  static String baseUrl = 'https://api.ca.dance/v1/codes/';
  static Map<String, String> headers = {
    'Authorization':
        'Bearer 529ddfda54cf1478d1906bf9196069d3d57f602f93c375804d8914cacceb30d8',
  };
  static CheckCodeCall checkCodeCall = CheckCodeCall();
  static RegisterCodeCall registerCodeCall = RegisterCodeCall();
}

class CheckCodeCall {
  Future<ApiCallResponse> call({
    String? cadyCode = '',
    String? circleToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Check Code',
      apiUrl: '${CadyCodesGroup.baseUrl}validate/index.php',
      callType: ApiCallType.GET,
      headers: {
        ...CadyCodesGroup.headers,
        'circleToken': '${circleToken}',
      },
      params: {
        'code': cadyCode,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  dynamic codeStatus(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  dynamic isRedeemable(dynamic response) => getJsonField(
        response,
        r'''$.redeemable''',
      );
}

class RegisterCodeCall {
  Future<ApiCallResponse> call({
    String? circleToken = '',
    String? cadyCode = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Register Code',
      apiUrl: '${CadyCodesGroup.baseUrl}register/index.php',
      callType: ApiCallType.GET,
      headers: {
        ...CadyCodesGroup.headers,
        'circleToken': '${circleToken}',
      },
      params: {
        'code': cadyCode,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic codeRegistered(dynamic response) => getJsonField(
        response,
        r'''$.registered''',
      );
  dynamic errorMessage(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  dynamic codeID(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  dynamic rewardType(dynamic response) => getJsonField(
        response,
        r'''$.campaign.reward_type''',
      );
  dynamic celebration(dynamic response) => getJsonField(
        response,
        r'''$.campaign.celebration''',
      );
  dynamic loggedIn(dynamic response) => getJsonField(
        response,
        r'''$.logged_in''',
      );
  dynamic rewardKey(dynamic response) => getJsonField(
        response,
        r'''$.rewardKey''',
      );
  dynamic rewardTitle(dynamic response) => getJsonField(
        response,
        r'''$.title''',
      );
  dynamic rewardRarity(dynamic response) => getJsonField(
        response,
        r'''$.campaign.rarity''',
      );
  dynamic rewardTheme(dynamic response) => getJsonField(
        response,
        r'''$.campaign.theme''',
      );
  dynamic rewardSubTitle(dynamic response) => getJsonField(
        response,
        r'''$.work.sub_title''',
      );
  dynamic rewardHeroUrl(dynamic response) => getJsonField(
        response,
        r'''$.work.hero_image''',
      );
}

/// End Cady Codes Group Code

/// Start Sessions Group Code

class SessionsGroup {
  static String baseUrl = 'https://api.ca.dance/v1/circle/session/';
  static Map<String, String> headers = {
    'Authorization':
        'Bearer 529ddfda54cf1478d1906bf9196069d3d57f602f93c375804d8914cacceb30d8',
    'circleToken': '[circleToken]',
  };
  static ValidateSessionTokenCall validateSessionTokenCall =
      ValidateSessionTokenCall();
}

class ValidateSessionTokenCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? memberID = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Validate Session Token',
      apiUrl: '${SessionsGroup.baseUrl}validate/index.php',
      callType: ApiCallType.GET,
      headers: {
        ...SessionsGroup.headers,
      },
      params: {
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic isTokenValid(dynamic response) => getJsonField(
        response,
        r'''$.success''',
      );
  dynamic errorMessage(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

/// End Sessions Group Code

/// Start Ecologi Group Code

class EcologiGroup {
  static String baseUrl = 'https://public.ecologi.com';
  static Map<String, String> headers = {
    'Authorization': 'Bearer 1009d394-ca67-9686-73b4-c7591d1ece35',
  };
  static BuyTreeCall buyTreeCall = BuyTreeCall();
}

class BuyTreeCall {
  Future<ApiCallResponse> call({
    String? indemptoencyKey = '',
    String? treeName = 'Anonymous',
    bool? test,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Buy Tree',
      apiUrl: '${EcologiGroup.baseUrl}/impact/trees',
      callType: ApiCallType.POST,
      headers: {
        ...EcologiGroup.headers,
        'Idempotency-Key': '${indemptoencyKey}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Ecologi Group Code

/// Start Rewards Group Code

class RewardsGroup {
  static String baseUrl = 'https://api.ca.dance/v1/rewards';
  static Map<String, String> headers = {
    'Authorization':
        'Bearer 529ddfda54cf1478d1906bf9196069d3d57f602f93c375804d8914cacceb30d8',
  };
  static RedeemRewardCall redeemRewardCall = RedeemRewardCall();
}

class RedeemRewardCall {
  Future<ApiCallResponse> call({
    String? circleToken = '',
    String? rewardKey = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Redeem Reward',
      apiUrl: '${RewardsGroup.baseUrl}/redeem/index.php',
      callType: ApiCallType.GET,
      headers: {
        ...RewardsGroup.headers,
        'circleToken': '${circleToken}',
      },
      params: {
        'rewardKey': rewardKey,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic isRedeemed(dynamic response) => getJsonField(
        response,
        r'''$.redeemed''',
      );
  dynamic loggedIn(dynamic response) => getJsonField(
        response,
        r'''$.logged_in''',
      );
  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  dynamic rewardID(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  dynamic rewardType(dynamic response) => getJsonField(
        response,
        r'''$.campaign.reward_type''',
      );
  dynamic celebration(dynamic response) => getJsonField(
        response,
        r'''$.campaign.celebration''',
      );
  dynamic rarity(dynamic response) => getJsonField(
        response,
        r'''$.campaign.rarity''',
      );
  dynamic theme(dynamic response) => getJsonField(
        response,
        r'''$.campaign.theme''',
      );
  dynamic experienceID(dynamic response) => getJsonField(
        response,
        r'''$.experience.id''',
      );
  dynamic experienceType(dynamic response) => getJsonField(
        response,
        r'''$.experience.type''',
      );
  dynamic experienceUrl(dynamic response) => getJsonField(
        response,
        r'''$.experience.url''',
      );
  dynamic isSecret(dynamic response) => getJsonField(
        response,
        r'''$.experience.secret''',
      );
  dynamic expiryHours(dynamic response) => getJsonField(
        response,
        r'''$.experience.expiry_hours''',
      );
  dynamic workID(dynamic response) => getJsonField(
        response,
        r'''$.work.id''',
      );
  dynamic title(dynamic response) => getJsonField(
        response,
        r'''$.work.title''',
      );
  dynamic subTitle(dynamic response) => getJsonField(
        response,
        r'''$.work.sub_title''',
      );
  dynamic authors(dynamic response) => getJsonField(
        response,
        r'''$.work.authors''',
      );
  dynamic heroImageUrl(dynamic response) => getJsonField(
        response,
        r'''$.work.hero_image''',
      );
  dynamic description(dynamic response) => getJsonField(
        response,
        r'''$.work.medium_desc''',
      );
  dynamic releaseDate(dynamic response) => getJsonField(
        response,
        r'''$.work.release_date''',
      );
}

/// End Rewards Group Code

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
