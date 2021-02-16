import 'package:flutter/material.dart';
import 'package:get/get.dart';

void dialogLoadingShow() {
  Get.defaultDialog(
    content: CircularProgressIndicator(),
    barrierDismissible: false,
  );
}

void dialogLoadingDismiss(){
  Get.back();
}
