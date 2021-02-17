import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:simantap/clients/api_client.dart';
import 'package:dio/dio.dart' as dio;
import 'package:simantap/models/auth.dart';
import 'package:simantap/res/constants.dart';
import 'package:simantap/ui/screens/screens.dart';
import 'package:simantap/utils/GeneralUtilsObjectExtension.dart';
import 'package:simantap/widgets/snackbars.dart';
import 'package:ndialog/ndialog.dart';

part 'auth_controller.dart';