part of 'controllers.dart';

class InfoTambahanController extends GetxController {
  final settings = GetStorage("settings");

  var infoTambahan = List<InfoTambahanDatum>().obs;
  var tmpList = List<InfoTambahanDatum>().obs;
  var isLoading = true.obs;
  var crossAxisCount = 2.obs;

  @override
  void onInit() {
    settings.writeIfNull(settingITView, 2);
    print(settings.read(settingITView));
    crossAxisCount(settings.read(settingITView));

    fetchInfoTambahan();
    super.onInit();
  }

  // void filterList(String filteredText) {
  //   print(filteredText);
  //   List<InfoTambahanDatum> filteredList = new List<InfoTambahanDatum>();
  //   print(tmpList);
  //   if (filteredText.isNullOrEmpty) {
  //     infoTambahan = tmpList;
  //   } else {
  //     infoTambahan.clear();
  //     for (int i = 0; i < infoTambahan.length; i++) {
  //       if (infoTambahan[i]
  //           .judul
  //           .toLowerCase()
  //           .contains(filteredText.toLowerCase())) {
  //         filteredList.add(infoTambahan[i]);
  //       }
  //     }
  //     infoTambahan(filteredList);
  //   }
  // }

  Future<void> refresh() async {
    fetchInfoTambahan();
  }

  void setCardView(int count) {
    settings.write(settingITView, count);
    crossAxisCount(count);
  }

  void fetchInfoTambahan() async {
    try {
      isLoading(true);
      InfoTambahan response = await ApiClient().apiInfoTambahan();
      if (response.isNotNull) {
        if (response.status) {
          infoTambahan(response.data);
          // tmpList = infoTambahan;
        } else {
          snackbarWarning(
              title: "Gagal mendapatkan data", message: response.message);
        }
      } else {
        snackbarWarning(title: "Terjadi Kesalahan", message: response.message);
      }
    } finally {
      isLoading(false);
    }
  }
}
