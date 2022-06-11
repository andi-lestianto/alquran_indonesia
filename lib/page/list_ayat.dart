import 'package:alquran_indonesia/model/get_allayat.dart';
import 'package:alquran_indonesia/model/get_allsurat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';

class list_ayat extends StatefulWidget {
  const list_ayat({Key? key}) : super(key: key);

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
    SemuaAyat.getSemuaAyat("5").then((value) {
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
      home: Scaffold(
        appBar: AppBar(
          title: Text("Api Demo"),
        ),
        body: Center(
          child: ListView.separated(
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
                                builder: (context) => list_ayat()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Container(
                          child: Row(
                            children: [
                              Text(
                                "${nomor[index]}",
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    "${ar[index]}",
                                    maxLines: 5,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontFamily: "NotoNaskhArabic",
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              )
                            ],
                          ),
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
    );
  }
}
