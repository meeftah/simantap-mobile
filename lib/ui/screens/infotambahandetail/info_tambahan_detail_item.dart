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
        color: primaryDarkColor,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Container(
          alignment: Alignment.bottomLeft,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(infoTambahanDetailDatum.ikon),
                fit: BoxFit.fitHeight,
                alignment: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25.0),
                bottomRight: Radius.circular(25.0),
              ),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(1),
                  Colors.black.withOpacity(0.1),
                ],
              ),
            ),
            child: AutoSizeText(
              "${infoTambahanDetailDatum.judul}",
              maxLines: 2,
              minFontSize: 14.0,
              maxFontSize: 17.0,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
              ),
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
                  BoxShadow(
                    color: Colors.black.withAlpha(100),
                    blurRadius: 10.0,
                  ),
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
                  : content(context)),
        ),
        isScrollControlled: true,
      ),
    );
  }

  Widget content(context) {
    return Column(
      children: [
        Container(
          height: 300.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: primaryDarkColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
              bottomLeft: Radius.circular(60.0),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                height: 300.0,
                right: 0.0,
                bottom: 0.0,
                child: Image.network(
                  infoTambahanDetailDatum.ikon,
                  fit: BoxFit.cover,
                ),
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
              Positioned(
                bottom: 0.0,
                child: Container(
                  height: 100.0,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.fromLTRB(40.0, 20.0, 20.0, 20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(60.0),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.5),
                        Colors.black.withOpacity(0.0),
                      ],
                    ),
                  ),
                  child: AutoSizeText(
                    "${infoTambahanDetailDatum.judul}",
                    maxLines: 1,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
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
                Container(
                  padding: EdgeInsets.fromLTRB(0.0, 20.0, 20.0, 20.0),
                  child: HtmlWidget(infoTambahanDetailDatum.deskripsi),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
