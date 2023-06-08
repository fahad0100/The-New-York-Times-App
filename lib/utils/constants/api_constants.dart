class ApiConstants extends ApiBase with ApiPath {}

mixin ApiPath {
  static const String _sharedPathEmailed = "/svc/mostpopular/v2/emailed";
  static const String _sharedPathShared = "/svc/mostpopular/v2/shared";
  static const String _sharedPathViewed = "/svc/mostpopular/v2/viewed";
  static const String _period1day = "/1.json";
  static const String _period7days = "/7.json";
  static const String _period30days = "/30.json";

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
    return _period1day;
  }

  String get period7days {
    return _period7days;
  }

  String get period30days {
    return _period30days;
  }
}

mixin class ApiBase {
  static const String _api = "https://api.nytimes.com";
  static const String _key = "5Hf0g0PWcrXNrBGjFCj0ugnR4z8LNGey";
  String get baseURL {
    return _api;
  }

  String get key {
    return _key;
  }
}
