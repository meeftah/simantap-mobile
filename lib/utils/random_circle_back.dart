import 'dart:math';

class RandomCircleBack {
  static String back1 = "assets/common/images/card_background_1.png";
  static String back2 = "assets/common/images/card_background_2.png";
  static String back3 = "assets/common/images/card_background_3.png";
  static String back4 = "assets/common/images/card_background_4.png";
  static String back5 = "assets/common/images/card_background_5.png";
  static String back6 = "assets/common/images/card_background_1.png";
  static String back7 = "assets/common/images/card_background_2.png";
  static String back8 = "assets/common/images/card_background_3.png";
  static String back9 = "assets/common/images/card_background_4.png";
  static String back10 = "assets/common/images/card_background_5.png";
  static String back11 = "assets/common/images/card_background_1.png";
  static String back12 = "assets/common/images/card_background_2.png";
  static String back13 = "assets/common/images/card_background_3.png";
  static String back14 = "assets/common/images/card_background_4.png";
  static String back15 = "assets/common/images/card_background_5.png";
  static String back16 = "assets/common/images/card_background_1.png";
  static String back17 = "assets/common/images/card_background_2.png";
  static String back18 = "assets/common/images/card_background_3.png";
  static String back19 = "assets/common/images/card_background_4.png";
  static String back20 = "assets/common/images/card_background_5.png";

  List<String> randomCircleBack = [
    back1,
    back2,
    back3,
    back4,
    back5,
    back6,
    back7,
    back8,
    back9,
    back10,
    back11,
    back12,
    back13,
    back14,
    back15,
    back16,
    back17,
    back18,
    back19,
    back20
  ];

  static final _random = Random();

  String circleBackRandom() {
    return randomCircleBack[_random.nextInt(3)];
  }

  String circleBackIndex(int index) {
    return randomCircleBack[index];
  }
}
