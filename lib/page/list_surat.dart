import 'package:alquran_indonesia/model/get_allayat.dart';
import 'package:alquran_indonesia/model/get_allsurat.dart';
import 'package:alquran_indonesia/page/list_ayat.dart';
import 'package:alquran_indonesia/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supercharged/supercharged.dart';

class list_surat extends StatefulWidget {
  const list_surat({Key? key}) : super(key: key);

  @override
  State<list_surat> createState() => _list_suratState();
}

class _list_suratState extends State<list_surat> {
  final List<String?> nomor = <String?>[];
  final List<String?> nama = <String?>[];
  final List<String?> asma = <String?>[];
  final List<String?> keterangan = <String?>[];
  final List<String?> arti = <String?>[];
  final List<String?> urut = <String?>[];

  void initState() {
    super.initState();
    AmbilDataSurat();
  }

  void AmbilDataSurat() {
    SemuaSurat.getSemuaSurat().then((value) {
      for (int i = 0; i < value.length; i++) {
        nomor.add(value[i].nomor);
        nama.add(value[i].nama);
        asma.add(value[i].asma);
        keterangan.add(value[i].keterangan);
        arti.add(value[i].arti);
        urut.add(value[i].urut);
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
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Baca Alquran ",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: "fde084".toColor())),
                          Text(
                            "Sudahkan kamu membaca Al Qur'an hari ini?",
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
                    : ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: nomor.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => list_ayat(
                                                  nsurat: nomor[index],
                                                  namasurat: nama[index],
                                                  artisurat: arti[index],
                                                )));
                                  },
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Container(
                                      height: 80,
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  width: 1,
                                                  color: "e1e1e1".toColor()))),
                                      child: Row(
                                        children: [
                                          Container(

                                              height: 35,
                                              width: 35,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/border.png"))),

                                              child: Center(
                                                  child: Text(
                                                "${nomor[index]}",
                                                style: GoogleFonts.poppins(

                                                    color: Colors.black),

                                              ))),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 25),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${nama[index]}",
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.black87,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "${arti[index]} (${urut[index]})",
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.black87,
                                                      fontSize: 10),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(child: SizedBox()),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Text(
                                              "${asma[index]}",
                                              style:
                                                  GoogleFonts.notoNaskhArabic(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 25),
                                              textAlign: TextAlign.right,
                                            ),
                                          ),
                                          // Html(data: "${keterangan[index]}"),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
