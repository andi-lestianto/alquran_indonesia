import 'dart:convert';
import 'package:alquran_indonesia/model.dart';
import 'package:http/http.dart' as http;

class Repository {
  final _baseUrl = 'https://api.npoint.io/99c279bb173a6e28359c/data';

  Future getData() async {
    try {
      final Response = await http.get(Uri.parse(_baseUrl));

      if (Response.statusCode == 200) {
        print(Response.body);
        Iterable it = jsonDecode(Response.body);
        List<Blog> blog = it.map((e) => Blog.fromJson(e)).toList();
        return blog;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
