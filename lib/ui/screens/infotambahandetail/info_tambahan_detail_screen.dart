part of 'package:simantap/ui/screens/screens.dart';

class InfoTambahanDetailScreen extends StatefulWidget {
  @override
  _InfoTambahanDetailScreenState createState() => _InfoTambahanDetailScreenState();
}

class _InfoTambahanDetailScreenState extends State<InfoTambahanDetailScreen> {
  final InfoTambahanController infoTambahanController = Get.put(InfoTambahanController());
  final int infoTambahanIndex = Get.arguments[0];

  ScrollController controller = ScrollController();

  double topContainer = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      double value = controller.offset / 119;

      setState(() {
        topContainer = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        extendBodyBehindAppBar: true,
        body: Column(
          children: [
            Container(
              height: 250.0,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(30),
                      ),
                      child: Image.network(
                        infoTambahanController.infoTambahan[infoTambahanIndex].ikon,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(30),
                      ),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            accentColor.withOpacity(0.9),
                            Colors.blueAccent.withOpacity(0.6),
                          ]),
                      // color: Colors.blue.withOpacity(0.7),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Text(
                          "${infoTambahanController.infoTambahan[infoTambahanIndex].judul}",
                          maxLines: 3,
                          style: Theme.of(context).textTheme.headline5.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                controller: controller,
                itemCount: infoTambahanController
                    .infoTambahan[infoTambahanIndex].infoTambahanDetail.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  double scale = 1.0;
                  if (topContainer > 1) {
                    scale = index + 1 - topContainer;
                    if (scale < 0) {
                      scale = 0;
                    } else if (scale > 1) {
                      scale = 1;
                    }
                  }

                  return Opacity(
                    opacity: scale,
                    child: Transform(
                      transform: Matrix4.identity()..scale(scale, scale),
                      alignment: Alignment.bottomCenter,
                      child: Align(
                        heightFactor: 0.7,
                        alignment: Alignment.topCenter,
                        child: InkWell(
                          onTap: () {
                            Get.bottomSheet(
                              SafeArea(
                                child: Container(
                                  margin: EdgeInsets.only(top: 70.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(1),
                                    borderRadius: new BorderRadius.only(
                                      topLeft: const Radius.circular(30.0),
                                      topRight: const Radius.circular(30.0),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withAlpha(100), blurRadius: 10.0),
                                    ],
                                  ),
                                  child: infoTambahanController.infoTambahan[infoTambahanIndex]
                                              .infoTambahanDetail[index].deskripsi ==
                                          null
                                      ? Wrap(
                                          alignment: WrapAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(20.0),
                                              child: Text("Tidak mempunyai detail"),
                                            )
                                          ],
                                        )
                                      : SingleChildScrollView(
                                          padding: EdgeInsets.all(20.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${infoTambahanController.infoTambahan[infoTambahanIndex].infoTambahanDetail[index].judul}",
                                                style: TextStyle(
                                                    fontSize: 23.0, fontWeight: FontWeight.bold),
                                              ),
                                              SizedBox(height: 20.0),
                                              Html(
                                                data: infoTambahanController
                                                    .infoTambahan[infoTambahanIndex]
                                                    .infoTambahanDetail[index]
                                                    .deskripsi,
                                              ),
                                            ],
                                          ),
                                        ),
                                ),
                              ),
                              isScrollControlled: true,
                              ignoreSafeArea: false,
                            );
                          },
                          child: Container(
                            height: 150,
                            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20.0)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                                        child: Text(
                                          "${infoTambahanController.infoTambahan[infoTambahanIndex].infoTambahanDetail[index].judul}",
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Transform.translate(
                                  offset: Offset(20.0, 0.0),
                                  child: Image.network(
                                    infoTambahanController.infoTambahan[infoTambahanIndex]
                                        .infoTambahanDetail[index].ikon,
                                    height: double.infinity,
                                    width: 200.0,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
