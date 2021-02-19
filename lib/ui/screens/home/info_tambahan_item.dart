part of 'package:simantap/ui/screens/screens.dart';

class InfoTambahanItem extends StatelessWidget {
  final InfoTambahanDatum infoTambahanDatum;
  final int index;
  InfoTambahanItem(this.index, this.infoTambahanDatum);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(InfoTambahanDetailScreen(), arguments: [index]),
      child: Card(
        margin: EdgeInsets.only(top: 20.0),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              width: double.infinity,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.network(
                infoTambahanDatum.ikon,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 15.0),
              child: Text(
                infoTambahanDatum.judul,
                maxLines: 3,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w800,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
