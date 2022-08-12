// To parse this JSON data, do
//
//     final iosResponseWrapper = iosResponseWrapperFromJson(jsonString);

import 'dart:convert';

class IosResponseWrapper {
  IosResponseWrapper({
    required this.from,
    required this.data,
    required this.msgBody,
    required this.msg,
    required this.msgTitle,
  });

  final String from;
  final Data data;
  final String msgBody;
  final String msg;
  final String msgTitle;

  factory IosResponseWrapper.fromRawJson(String str) =>
      IosResponseWrapper.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory IosResponseWrapper.fromJson(Map<String, dynamic> json) =>
      IosResponseWrapper(
        from: json['from'],
        data: Data.fromJson(json['data']),
        msgBody: json['msgBody'],
        msg: json['msg'],
        msgTitle: json['msgTitle'],
      );

  Map<String, dynamic> toJson() => {
        'from': from,
        'data': data.toJson(),
        'msgBody': msgBody,
        'msg': msg,
        'msgTitle': msgTitle,
      };
}

class Data {
  Data({
    required this.module,
    required this.id,
  });

  final String module;
  final String id;

  ///from raw json
  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        module: json['module'],
        id: json['id'],
      );

  Map<String, dynamic> toJson() => {
        'module': module,
        'id': id,
      };
}
