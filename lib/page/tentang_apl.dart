import 'package:alquran_indonesia/theme/theme.dart';
import 'package:flutter/material.dart';

class TentangAplikasi extends StatelessWidget {
  const TentangAplikasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List Nama = [
      "Andi Lestianto",
      "Andika Wisnu Aji",
      "Alfan Rizky Affandy"
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Tentang Aplikasi"),
        backgroundColor: greencolor,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
              child: ListTile(
                  title: Text(Nama[index], style: TextStyle(fontSize: 30)),
                  subtitle: Text('ini subtitle dari ' + Nama[index]),
                  leading: CircleAvatar(
                    backgroundColor: greencolor,
                    child: Text(Nama[index][0], // ambil karakter pertama text
                        style: TextStyle(fontSize: 20)),
                  ),
                  trailing: Icon(
                    Icons.person,
                    size: 30,
                    color: greencolor,
                  )));
        },
        itemCount: Nama.length,
      ),
    );
  }
}
