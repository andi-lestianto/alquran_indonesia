import 'package:alquran_indonesia/model/get_allayat.dart';
import 'package:alquran_indonesia/page/list_surat.dart';
import 'package:alquran_indonesia/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

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
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.menu_book),
                  text: "Arab",
                ),
                Tab(
                  icon: Icon(Icons.library_books),
                  text: "Latin",
                ),
                Tab(
                  icon: Icon(Icons.translate),
                  text: "terjemahan",
                ),
              ],
              isScrollable: true,
              labelPadding: EdgeInsets.only(left: 40, right: 40),
              unselectedLabelColor: Colors.greenAccent,
            ),
            title: Text("Baca Alquran"),
            backgroundColor: greencolor,
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => list_surat()));
                ;
              },
            ),
          ),
          body: TabBarView(
            children: [
              ListView.separated(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 50),
                                  child: Text(
                                    " ${nomor[index]}",
                                  ),
                                ),
                                Expanded(
                                  child: Text("${ar[index]}",
                                      maxLines: 10,
                                      overflow: TextOverflow.fade,
                                      style: TextStyle(
                                        fontFamily: "NotoNaskhArabic",
                                        fontWeight: FontWeight.w700,
                                      ),
                                      textAlign: TextAlign.right),
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
              ListView.separated(
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
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Text(
                                    " ${nomor[index]}",
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Html(
                                        data: "${tr[index]}",
                                      ),
                                    ],
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
              ListView.separated(
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
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Text(
                                    " ${nomor[index]}",
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text("${id[index]}"),
                                    ],
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
            ],
          ),
        ),
      ),
    );
  }
}
