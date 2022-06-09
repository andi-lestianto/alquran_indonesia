import 'package:alquran_indonesia/model/get_allsurat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';

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
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Anda klik surat ${nama[index]}'),
                          action: SnackBarAction(label: 'OK', onPressed: () {}),
                        ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(width: 1))),
                          child: Row(
                            children: [
                              Text("${nomor[index]}."),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text("${nama[index]}"),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  "${asma[index]}",
                                  style: TextStyle(
                                    fontFamily: "NotoNaskhArabic",
                                    fontWeight: FontWeight.w700,
                                  ),
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
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ),
        ),
      ),
    );
  }
}
