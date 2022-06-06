import 'package:alquran_indonesia/model/get_allsurat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class list_surat extends StatefulWidget {
  const list_surat({Key key}) : super(key: key);

  @override
  State<list_surat> createState() => _list_suratState();
}

class _list_suratState extends State<list_surat> {
  String datasurat = "No data";
  final List<String> namasurat = <String>[];
  final List<String> keterangan = <String>[''];

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => AmbilDataSurat());
  }

  void AmbilDataSurat() {
    SemuaSurat.getSemuaSurat().then((value) {
      namasurat.clear();
      keterangan.clear();
      for (int i = 0; i < value.length; i++) {
        namasurat.add(value[i].nama);
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
            itemCount: namasurat.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                
                color: Colors.grey,
                child: Column(
                  children: [
                    Text("Entry ${namasurat[index]}"),
                    Html(data: "${keterangan[index]}"),
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
