part of 'package:simantap/ui/screens/screens.dart';

class InfoTambahanDetailScreen extends StatelessWidget {
  final InfoTambahanDatum infoTambahanDatum;
  InfoTambahanDetailScreen(this.infoTambahanDatum);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(15.0),
              child: AppBar(
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                leading: ClipOval(
                  child: Material(
                    color: Colors.blue,
                    child: InkWell(
                      splashColor: Colors.red,
                      child: SizedBox(
                        width: 60,
                        height: 60,
                        child: Icon(
                          Icons.arrow_back,
                          size: 30.0,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () => Get.back(),
                    ),
                  ),
                ),
                centerTitle: false,
                title: AutoSizeText(
                  "${infoTambahanDatum.judul}",
                  maxLines: 2,
                  maxFontSize: 25.0,
                  minFontSize: 18.0,
                  style: GoogleFonts.poppins(
                    height: 1.2,
                    color: Colors.indigo[800],
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  infoTambahanDatum.deskripsi == null
                      ? SizedBox.shrink()
                      : Padding(
                          padding: EdgeInsets.only(
                            left: 30.0,
                            top: 20.0,
                            right: 30.0,
                          ),
                          child: HtmlWidget(infoTambahanDatum.deskripsi),
                        ),
                  GridView.count(
                    crossAxisCount: 2,
                    padding: EdgeInsets.all(15.0),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: List.generate(
                      infoTambahanDatum.infoTambahanDetail.length,
                      (index) {
                        return InfoTambahanDetailItem(
                            index, infoTambahanDatum.infoTambahanDetail[index]);
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
