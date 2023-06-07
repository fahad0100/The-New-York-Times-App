class ApiConstants extends ApiBase with ApiPath {}

mixin ApiPath {
  static const String _sharedPathEmailed = "/svc/mostpopular/v2/emailed";
  static const String _sharedPathShared = "/svc/mostpopular/v2/shared";
  static const String _sharedPathViewed = "/svc/mostpopular/v2/viewed";
  static const String _emailedPath1day = "/1.json";
  static const String _emailedPath7days = "/7.json";
  static const String _emailedPath30days = "/30.json";

  String get pathEmailed {
    return _sharedPathEmailed;
  }

  String get pathShared {
    return _sharedPathShared;
  }

  String get pathViewed {
    return _sharedPathViewed;
  }

  String get period1day {
    return _emailedPath1day;
  }

  String get period7days {
    return _emailedPath7days;
  }

  String get period30days {
    return _emailedPath30days;
  }
}

mixin class ApiBase {
  static const String _api = "https://api.nytimes.com";
  static const String _key = "i4AFyxF7hccijAuPbHiJnZcD1Fkpyfjv";
  String get baseURL {
    return _api;
  }

  String get key {
    return _key;
  }
}
