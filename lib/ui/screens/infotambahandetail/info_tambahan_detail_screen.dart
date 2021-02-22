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
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.0, top: 20.0, right: 30.0),
              child: Text(
                "${infoTambahanDatum.judul}",
                maxLines: 3,
                style: GoogleFonts.poppins(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            infoTambahanDatum.deskripsi == null
                ? SizedBox.shrink()
                : Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Html(data: infoTambahanDatum.deskripsi),
                  ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.all(15.0),
                physics: BouncingScrollPhysics(),
                children: List.generate(
                  infoTambahanDatum.infoTambahanDetail.length,
                  (index) {
                    return InfoTambahanDetailItem(index, infoTambahanDatum.infoTambahanDetail[index]);
                  },
                ),
                // itemBuilder: (context, index) {

                // },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
