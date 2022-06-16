import 'package:alquran_indonesia/model/get_allayat.dart';
import 'package:alquran_indonesia/model/get_allsurat.dart';
import 'package:alquran_indonesia/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supercharged/supercharged.dart';

class list_ayat extends StatefulWidget {
  final String? nsurat;
  const list_ayat({Key? key, this.nsurat}) : super(key: key);

  @override
  State<list_ayat> createState() => _list_ayatState();
}

class _list_ayatState extends State<list_ayat> {
  final List<String?> ar = <String?>[];
  final List<String?> id = <String?>[];
  final List<String?> tr = <String?>[];
  final List<String?> nomor = <String?>[];

  void initState() {
    super.initState();
    AmbilDataAyat();
  }

  void AmbilDataAyat() {
    SemuaAyat.getSemuaAyat(widget.nsurat.toString()).then((value) {
      for (int i = 0; i < value.length; i++) {
        ar.add(value[i].ar);
        id.add(value[i].id);
        tr.add(value[i].tr);
        nomor.add(value[i].nomor);
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
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: greencolor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 20),
                      height: 150,
                      width: MediaQuery.of(context).size.width * 0.50,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Baca Alquran",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
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
                      margin: EdgeInsets.only(right: 20),
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/muslim.png"))),
                    ),
                  ],
                ),
              ),
            ),
            SafeArea(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                ),
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.2),
                child: Container(
                  padding: EdgeInsets.only(top: 10),
                  child: ListView.separated(
                    padding: const EdgeInsets.all(8),
                    itemCount: nomor.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Container(
                                child: Row(
                                  children: [
                                    Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                          color: greencolor,
                                          borderRadius:
                                              BorderRadius.circular(40)),
                                      child: Center(
                                        child: Text(
                                          " ${nomor[index]}",
                                          style: GoogleFonts.poppins(
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 0, 10, 0),
                                        margin: const EdgeInsets.only(left: 20),
                                        child: Column(
                                          children: [
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Text(
                                                "${ar[index]}",
                                                maxLines: 5,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontFamily: "NotoNaskhArabic",
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 25,
                                                ),
                                                textAlign: TextAlign.end,
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Html(
                                                data: "${tr[index]}",
                                              ),
                                            ),
                                            Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text("${id[index]}")),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
