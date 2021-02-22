part of 'package:simantap/ui/screens/screens.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final InfoTambahanController infoTambahanController = Get.put(InfoTambahanController());
  final AuthController authController = Get.put(AuthController());
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: infoTambahanController.refresh,
          child: Container(
            width: double.infinity,
            height: size.height,
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  width: size.width,
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Selamat Datang",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  "${box.read(boxName)}",
                                  style: GoogleFonts.poppins(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //     IconButton(
                          //       icon: Icon(Icons.view_list_rounded),
                          //       onPressed: () => infoTambahanController.setCardView(1),
                          //     ),
                          //     IconButton(
                          //       icon: Icon(Icons.grid_view),
                          //       onPressed: () => infoTambahanController.setCardView(2),
                          //     ),
                          IconButton(
                            icon: Icon(Icons.logout),
                            color: Colors.red,
                            onPressed: () {
                              Get.defaultDialog(
                                title: "KELUAR",
                                middleText: "Apakah Anda yakin ingin keluar?",
                                textConfirm: "Yakin, Keluar",
                                confirmTextColor: Colors.white,
                                textCancel: "Batal",
                                radius: 15.0,
                                onConfirm: () => authController.doLogout(),
                                onCancel: () => Get.back(),
                              );
                            },
                          ),
                        ],
                      ),
                      getSearchBarUI(),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(18.0, 0.0, 18.0, 18.0),
                    child: getInfoTambahanList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getSearchBarUI() {
    return Padding(
      padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 0.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 76,
        child: Padding(
          padding: EdgeInsets.only(top: 8, bottom: 8),
          child: Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(13.0),
                bottomLeft: Radius.circular(13.0),
                topLeft: Radius.circular(13.0),
                topRight: Radius.circular(13.0),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 16),
                    child: TextFormField(
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Cari...',
                        border: InputBorder.none,
                        helperStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                        contentPadding: EdgeInsets.all(5.0),
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          letterSpacing: 0.2,
                          color: Colors.white,
                        ),
                      ),
                      onChanged: (text) {
                        // infoTambahanController.filterList(text);
                      },
                      onFieldSubmitted: (value) {
                        Get.back();
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: 60,
                  height: 60,
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getInfoTambahanList() {
    return Obx(() {
      if (infoTambahanController.isLoading.value)
        return Center(child: CircularProgressIndicator());
      else
        return StaggeredGridView.countBuilder(
          crossAxisCount: infoTambahanController.crossAxisCount.value,
          itemCount: infoTambahanController.infoTambahan.length ?? 0,
          crossAxisSpacing: 0.0,
          mainAxisSpacing: 10.0,
          padding: EdgeInsets.only(top: 20.0),
          itemBuilder: (context, index) {
            return InfoTambahanItem(index, infoTambahanController.infoTambahan[index]);
          },
          staggeredTileBuilder: (index) => StaggeredTile.fit(1),
        );
    });
  }
}
