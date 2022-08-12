// To parse this JSON data, do
//
//     final androidResponseWrapper =
//     androidResponseWrapperFromJson(jsonString);

import 'dart:convert';

class AndroidResponseWrapper {
  AndroidResponseWrapper({
    required this.notification,
    required this.data,
  });

  final Notification notification;
  final AndroidResponseWrapperData data;

  factory AndroidResponseWrapper.fromRawJson(String str) =>
      AndroidResponseWrapper.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AndroidResponseWrapper.fromJson(Map<String, dynamic> json) =>
      AndroidResponseWrapper(
        notification: Notification.fromJson(json['notification']),
        data: AndroidResponseWrapperData.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
        'notification': notification.toJson(),
        'data': data.toJson(),
      };
}

class AndroidResponseWrapperData {
  AndroidResponseWrapperData({
    required this.msgTitle,
    required this.msg,
    required this.data,
    required this.msgBody,
  });

  final String msgTitle;
  final String msg;
  final DataData data;
  final String msgBody;

  factory AndroidResponseWrapperData.fromRawJson(String str) =>
      AndroidResponseWrapperData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AndroidResponseWrapperData.fromJson(Map<String, dynamic> json) =>
      AndroidResponseWrapperData(
        msgTitle: json['msgTitle'],
        msg: json['msg'],
        data: DataData.fromJson(json['data']),
        msgBody: json['msgBody'],
      );

  Map<String, dynamic> toJson() => {
        'msgTitle': msgTitle,
        'msg': msg,
        'data': data.toJson(),
        'msgBody': msgBody,
      };
}

class DataData {
  DataData({
    required this.module,
    required this.id,
  });

  final String module;
  final int id;

  factory DataData.fromRawJson(String str) =>
      DataData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
        module: json['module'],
        id: json['id'],
      );

  Map<String, dynamic> toJson() => {
        'module': module,
        'id': id,
      };
}

class Notification {
  Notification({
    required this.title,
    required this.body,
  });

  final String title;
  final String body;

  factory Notification.fromRawJson(String str) =>
      Notification.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        title: json['title'],
        body: json['body'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'body': body,
      };
}
