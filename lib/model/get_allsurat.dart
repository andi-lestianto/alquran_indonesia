import 'package:http/http.dart' as http;
import 'dart:convert';

class SemuaSurat {
  String? nama;
  String? keterangan;
  String? asma;
  String? nomor;
  String? arti;
  String? urut;
  String? audio;

  SemuaSurat(
      {this.nama,
      this.keterangan,
      this.asma,
      this.nomor,
      this.arti,
      this.urut,
      this.audio});

  factory SemuaSurat.createSurat(Map<String, dynamic> object) {
    return SemuaSurat(
        nama: object["nama"],
        keterangan: object["keterangan"],
        asma: object["asma"],
        nomor: object["nomor"],
        arti: object["arti"],
        urut: object["urut"],
        audio: object["audio"]);
  }

  static Future<List<SemuaSurat>> getSemuaSurat() async {
    String apiURL = "https://api.npoint.io/99c279bb173a6e28359c/data";

    var apiResult = await http.get(Uri.parse(apiURL));
    var decodeutf = utf8.decode(apiResult.bodyBytes);
    var jsonObject = json.decode(apiResult.body);

    List<dynamic> listSemuaSurat = jsonObject;
    List<SemuaSurat> surat = [];
    for (int i = 0; i < listSemuaSurat.length; i++) {
      surat.add(SemuaSurat.createSurat(listSemuaSurat[i]));
    }
    return surat;
  }
}
