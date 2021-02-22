part of 'package:simantap/ui/screens/screens.dart';

class InfoTambahanItem extends StatelessWidget {
  final InfoTambahanDatum infoTambahanDatum;
  final int index;
  InfoTambahanItem(this.index, this.infoTambahanDatum);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(InfoTambahanDetailScreen(infoTambahanDatum)),
      child: Card(
        margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
        color: RandomHexColor().colorPastelIndex(index),
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      infoTambahanDatum.judul,
                      maxLines: 3,
                      style: TextStyle(
                        color: Colors.indigo[800],
                        fontSize: 18.0,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Image.network(
                    infoTambahanDatum.ikon,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
