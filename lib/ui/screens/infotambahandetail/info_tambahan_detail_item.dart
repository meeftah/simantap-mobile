part of 'package:simantap/ui/screens/screens.dart';

class InfoTambahanDetailItem extends StatelessWidget {
  final InfoTambahanDetailDatum infoTambahanDetailDatum;
  final int index;
  InfoTambahanDetailItem(this.index, this.infoTambahanDetailDatum);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        margin: EdgeInsets.all(10.0),
        color: RandomHexColor().colorMaterialIndex(index),
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Container(
          padding: EdgeInsets.all(20.0),
          alignment: Alignment.bottomLeft,
          child: Text(
            "${infoTambahanDetailDatum.judul}",
            maxLines: 3,
            style: TextStyle(
              color: Colors.white,
              fontSize: 17.0,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
      onTap: () => Get.bottomSheet(
        SafeArea(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(1),
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(30.0),
                topRight: const Radius.circular(30.0),
              ),
              boxShadow: [
                BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
              ],
            ),
            child: infoTambahanDetailDatum.deskripsi == null
                ? Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text("Tidak mempunyai detail"),
                      )
                    ],
                  )
                : Column(
                    children: [
                      Container(
                        height: 300.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: RandomHexColor().colorMaterialIndex(index),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                            bottomLeft: Radius.circular(60.0),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Image.network(
                              infoTambahanDetailDatum.ikon,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              top: 50.0,
                              left: 20.0,
                              child: IconButton(
                                onPressed: () => Get.back(),
                                icon: Icon(
                                  Icons.arrow_back,
                                  size: 30.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(25.0),
                                child: Text(
                                  "${infoTambahanDetailDatum.judul}",
                                  style: GoogleFonts.poppins(
                                    fontSize: 26.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Html(
                                data: infoTambahanDetailDatum.deskripsi,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
        isScrollControlled: true,
      ),
    );
  }
}
