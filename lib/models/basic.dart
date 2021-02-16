class Basic {
  bool status;
  String message;

  Basic(this.status, this.message);

  Basic.fromJson(Map<String, dynamic> json)
      : status = json["status"],
        message = json["message"];

  Basic.withError(String errorValue)
      : status = false,
        message = errorValue;
}