import 'package:alquran_indonesia/model/get_allsurat.dart';
import 'package:alquran_indonesia/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supercharged/supercharged.dart';

class DeskripsiSurat extends StatefulWidget {
  final String? nsurat;
  final String? namasurat;
  final String? artisurat;
  final String? ketSurat;
  const DeskripsiSurat(
      {Key? key, this.nsurat, this.namasurat, this.artisurat, this.ketSurat})
      : super(key: key);

  @override
  State<DeskripsiSurat> createState() => _DeskripsiSuratState();
}

class _DeskripsiSuratState extends State<DeskripsiSurat> {
  final List<String?> nomor = <String?>[];
  final List<String?> nama = <String?>[];
  final List<String?> arti = <String?>[];
  final List<String?> keterangan = <String?>[];

  void initState() {
    super.initState();
    AmbilDataSurat();
  }

  void AmbilDataSurat() {
    SemuaSurat.getSemuaSurat().then((value) {
      for (int i = 0; i < value.length; i++) {
        nama.add(value[i].nama);
        arti.add(value[i].arti);
        nomor.add(value[i].nomor);
        keterangan.add(value[i].keterangan);
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              color: greencolor,
            ),
            SafeArea(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/bghome.png"),
                        opacity: 0.2,
                        fit: BoxFit.cover)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(widget.namasurat.toString(),
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: "fde084".toColor())),
                          Text(
                            widget.artisurat.toString(),
                            maxLines: 4,
                            style: GoogleFonts.poppins(
                                fontSize: 15, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/muslim.png"),
                              fit: BoxFit.fitWidth)),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
              ),
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.28),
              child: Container(
                  padding: EdgeInsets.only(top: 10),
                  child: (nomor.length == 0)
                      ? Center(
                          child: SpinKitFadingCircle(
                          size: 45,
                          color: Colors.green,
                        ))
                      : Center(
                          child: Html(data: widget.ketSurat.toString()),
                        )),
            ),
          ],
        ),
      ),
    );
  }
}
