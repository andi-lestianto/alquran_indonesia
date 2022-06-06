import 'package:http/http.dart' as http;
import 'dart:convert';

class SemuaSurat {
  String nama = "";
  String keterangan = "";

  SemuaSurat({this.nama, this.keterangan});

  factory SemuaSurat.isiSurat(Map<String, dynamic> object) {
    return SemuaSurat(
      nama : object["nama"],
      keterangan: object["keterangan"],
    );
  }

  static Future<List<SemuaSurat>> getSemuaSurat() async {
    String apiURL = "https://api.npoint.io/99c279bb173a6e28359c/data";

    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);

    List<dynamic> listSemuaSurat = jsonObject;
    List<SemuaSurat> surat = [];
    for (int i = 0; i < listSemuaSurat.length; i++) {
      surat.add(SemuaSurat.isiSurat(listSemuaSurat[i]));
    }
    return surat;
  }
}