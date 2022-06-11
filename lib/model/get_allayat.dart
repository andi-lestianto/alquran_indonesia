import 'package:http/http.dart' as http;
import 'dart:convert';

class SemuaAyat {
  String? ar;
  String? id;
  String? tr;
  String? nomor;

  SemuaAyat({this.ar, this.id, this.tr, this.nomor});

  factory SemuaAyat.createAyat(Map<String, dynamic> object) {
    return SemuaAyat(
        ar: object["ar"],
        id: object["id"],
        tr: object["tr"],
        nomor: object["nomor"]);
  }
  static Future<List<SemuaAyat>> getSemuaAyat(String nomor) async {
    String apiURL = "https://api.npoint.io/99c279bb173a6e28359c/surat/" + nomor;

    var apiResult = await http.get(Uri.parse(apiURL));
    var jsonObject = json.decode(apiResult.body);
    List<dynamic> listayat = jsonObject;

    List<SemuaAyat> ayat = [];
    for (int i = 0; i < listayat.length; i++) {
      ayat.add(SemuaAyat.createAyat(listayat[i]));
    }
    return ayat;
  }
}
