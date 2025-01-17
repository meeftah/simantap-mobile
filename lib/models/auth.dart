// To parse this JSON data, do
//
//     final auth = authFromJson(jsonString);

import 'dart:convert';

Auth authFromJson(String str) => Auth.fromJson(json.decode(str));

String authToJson(Auth data) => json.encode(data.toJson());

class Auth {
    Auth({
        this.status,
        this.message,
        this.data,
    });

    bool status;
    String message;
    DataAuth data;

    factory Auth.fromJson(Map<String, dynamic> json) => Auth(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : DataAuth.fromJson(json["data"]),
    );

    Auth.withError(String errorValue)
      : status = false,
        message = errorValue;

    Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null ? null : data.toJson(),
    };
}

class DataAuth {
    DataAuth({
        this.name,
        this.email,
        this.apiToken,
    });

    String name;
    String email;
    String apiToken;

    factory DataAuth.fromJson(Map<String, dynamic> json) => DataAuth(
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        apiToken: json["api_token"] == null ? null : json["api_token"],
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "api_token": apiToken == null ? null : apiToken,
    };
}
