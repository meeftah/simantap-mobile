part of 'package:simantap/ui/screens/screens.dart';

class InfoTambahanDetailScreen extends StatefulWidget {
  @override
  _InfoTambahanDetailScreenState createState() => _InfoTambahanDetailScreenState();
}

class _InfoTambahanDetailScreenState extends State<InfoTambahanDetailScreen> {
  final int infoTambahanIndex = Get.arguments[0];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("$infoTambahanIndex"),
    );
  }
}
