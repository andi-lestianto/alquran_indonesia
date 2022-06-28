import 'package:alquran_indonesia/model/get_allayat.dart';
import 'package:alquran_indonesia/model/get_allsurat.dart';
import 'package:alquran_indonesia/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supercharged/supercharged.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class list_ayat extends StatefulWidget {
  final String? nsurat;
  final String? namasurat;
  final String? artisurat;
  const list_ayat({Key? key, this.nsurat, this.namasurat, this.artisurat})
      : super(key: key);

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
                    : ListView.separated(
                        padding: const EdgeInsets.all(8),
                        itemCount: nomor.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Container(
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
                                              " ${nomor[index]}",
                                              style: GoogleFonts.poppins(

                                                  color: Colors.black),

                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 0, 10, 0),
                                            margin:
                                                const EdgeInsets.only(left: 20),
                                            child: Column(
                                              children: [
                                                Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Text(
                                                    "${ar[index]}",
                                                    maxLines: 5,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontFamily:
                                                          "NotoNaskhArabic",
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 25,
                                                    ),
                                                    textAlign: TextAlign.end,
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Html(
                                                    data: "${tr[index]}",
                                                  ),
                                                ),
                                                Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child:
                                                        Text("${id[index]}")),
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
          ],
        ),
      ),
    );
  }
}
