class Default {
  bool status;
  String message;

  Default(this.status, this.message);

  Default.fromJson(Map<String, dynamic> json)
      : status = json["status"],
        message = json["message"];

  Default.withError(String errorValue)
      : status = false,
        message = errorValue;
}