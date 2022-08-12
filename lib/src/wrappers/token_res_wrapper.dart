/// status : true
/// code : 200
/// message : "Token has been updated successfully."
/// data : {"token":"Bearer 6df95a8d51014cd24671bd31fb4a8318"}

class TokenResWrapper {
  TokenResWrapper({
    bool? status,
    int? code,
    String? message,
    Data? data,
  }) {
    _status = status;
    _code = code;
    _message = message;
    _data = data;
  }

  TokenResWrapper.fromJson(dynamic json) {
    _status = json['status'];
    _code = json['code'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  bool? _status;
  int? _code;
  String? _message;
  Data? _data;

  bool? get status => _status;

  int? get code => _code;

  String? get message => _message;

  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['code'] = _code;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

/// token : "Bearer 6df95a8d51014cd24671bd31fb4a8318"

class Data {
  Data({
    String? token,
  }) {
    _token = token;
  }

  Data.fromJson(dynamic json) {
    _token = json['token'];
  }

  String? _token;

  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    return map;
  }
}
