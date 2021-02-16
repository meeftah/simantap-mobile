import 'package:flutter/material.dart';
import 'package:get/get.dart';

void snackbarInfo({
  String title = "INFO",
  String message,
}) {
  Get.snackbar(
    "$title",
    "$message",
    margin: EdgeInsets.all(20.0),
    colorText: Colors.white,
    backgroundColor: Colors.blue[400],
  );
}

void snackbarError({
  String title = "TERJADI MASALAH",
  String message,
}) {
  Get.snackbar(
    "$title",
    "$message",
    margin: EdgeInsets.all(20.0),
    colorText: Colors.white,
    backgroundColor: Colors.red[400],
  );
}

void snackbarWarning({
  String title = "PERHATIAN",
  String message,
}) {
  Get.snackbar(
    "$title",
    "$message",
    margin: EdgeInsets.all(20.0),
    colorText: Colors.white,
    backgroundColor: Colors.yellow[700],
  );
}

void snackbarSuccess({
  String title = "INFO",
  String message,
}) {
  Get.snackbar(
    "$title",
    "$message",
    margin: EdgeInsets.all(20.0),
    colorText: Colors.white,
    backgroundColor: Colors.green[400],
  );
}
