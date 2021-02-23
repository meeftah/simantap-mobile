import 'dart:math';

import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

class RandomHexColor {
  static Color colorPastel1 = "#FFCCB5".toColor();
  static Color colorPastel2 = "#D4D7FF".toColor();
  static Color colorPastel3 = "#FFEED6".toColor();
  static Color colorPastel4 = "#FBE4E6".toColor();
  static Color colorPastel5 = "#FFCCB5".toColor();
  static Color colorPastel6 = "#D4D7FF".toColor();
  static Color colorPastel7 = "#FFEED6".toColor();
  static Color colorPastel8 = "#FBE4E6".toColor();
  static Color colorPastel9 = "#FFCCB5".toColor();
  static Color colorPastel10 = "#D4D7FF".toColor();
  static Color colorPastel11 = "#FFEED6".toColor();
  static Color colorPastel12 = "#FBE4E6".toColor();
  static Color colorPastel13 = "#FFCCB5".toColor();
  static Color colorPastel14 = "#D4D7FF".toColor();
  static Color colorPastel15 = "#FFEED6".toColor();
  static Color colorPastel16 = "#FBE4E6".toColor();
  static Color colorPastel17 = "#FFCCB5".toColor();
  static Color colorPastel18 = "#D4D7FF".toColor();
  static Color colorPastel19 = "#FFEED6".toColor();
  static Color colorPastel20 = "#FBE4E6".toColor();

  static Color colorMaterial1 = "#f9ed69".toColor();
  static Color colorMaterial2 = "#f08a5d".toColor();
  static Color colorMaterial3 = "#b83b5e".toColor();
  static Color colorMaterial4 = "#6a2c70".toColor();
  static Color colorMaterial5 = "#f9ed69".toColor();
  static Color colorMaterial6 = "#f08a5d".toColor();
  static Color colorMaterial7 = "#b83b5e".toColor();
  static Color colorMaterial8 = "#6a2c70".toColor();
  static Color colorMaterial9 = "#f9ed69".toColor();
  static Color colorMaterial10 = "#f08a5d".toColor();
  static Color colorMaterial11 = "#b83b5e".toColor();
  static Color colorMaterial12 = "#6a2c70".toColor();
  static Color colorMaterial13 = "#f9ed69".toColor();
  static Color colorMaterial14 = "#f08a5d".toColor();
  static Color colorMaterial15 = "#b83b5e".toColor();
  static Color colorMaterial16 = "#6a2c70".toColor();
  static Color colorMaterial17 = "#f9ed69".toColor();
  static Color colorMaterial18 = "#f08a5d".toColor();
  static Color colorMaterial19 = "#b83b5e".toColor();
  static Color colorMaterial20 = "#6a2c70".toColor();

  List<Color> hexPastelColor = [
    colorPastel1,
    colorPastel2,
    colorPastel3,
    colorPastel4,
    colorPastel5,
    colorPastel6,
    colorPastel7,
    colorPastel8,
    colorPastel9,
    colorPastel10,
    colorPastel11,
    colorPastel12,
    colorPastel13,
    colorPastel14,
    colorPastel15,
    colorPastel16,
    colorPastel17,
    colorPastel18,
    colorPastel19,
    colorPastel20
  ];

  List<Color> hexMaterialColor = [
    colorMaterial1,
    colorMaterial2,
    colorMaterial3,
    colorMaterial4,
    colorMaterial5,
    colorMaterial6,
    colorMaterial7,
    colorMaterial8,
    colorMaterial9,
    colorMaterial10,
    colorMaterial11,
    colorMaterial12,
    colorMaterial13,
    colorMaterial14,
    colorMaterial15,
    colorMaterial16,
    colorMaterial17,
    colorMaterial18,
    colorMaterial19,
    colorMaterial20
  ];

  static final _random = Random();

  Color colorPastelRandom() {
    return hexPastelColor[_random.nextInt(3)];
  }

  Color colorPastelIndex(int index) {
    return hexPastelColor[index];
  }

  Color colorMaterialRandom() {
    return hexMaterialColor[_random.nextInt(3)];
  }

  Color colorMaterialIndex(int index) {
    return hexMaterialColor[index];
  }
}
