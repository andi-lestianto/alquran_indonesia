import 'package:alquran_indonesia/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TentangAplikasi extends StatefulWidget {
  const TentangAplikasi({Key? key}) : super(key: key);

  @override
  State<TentangAplikasi> createState() => _TentangAplikasiState();
}

class datapp {
  final String nama;
  final String nim;
  final String githuburl;

  datapp(this.nama, this.nim, this.githuburl);
}

final List<datapp> _dataapp = <datapp>[
  datapp('Andi Lestianto', '190103178', 'https://github.com/andi-lestianto'),
  datapp(
      'Andika Wisnu Aji', '190103179', 'https://github.com/Andikawisnuaji13'),
  datapp('Alfan Rizky Affandi', '190103177',
      'https://github.com/alfanrizkyaffandi'),
];

class _TentangAplikasiState extends State<TentangAplikasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tentang Aplikasi",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        backgroundColor: greencolor,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            height: 50,
            child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Our Team',
                  style: GoogleFonts.poppins(
                      fontSize: 20, fontWeight: FontWeight.bold),
                )),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Card(
                    child: ListTile(
                        title: Text(_dataapp[index].nama,
                            style: GoogleFonts.poppins(fontSize: 20)),
                        subtitle: Text(
                          'NIM ' + _dataapp[index].nim,
                          style: GoogleFonts.poppins(),
                        ),
                        leading: CircleAvatar(
                          backgroundColor: greencolor,
                          child: Text(
                              _dataapp[index]
                                  .nama[0], // ambil karakter pertama text
                              style: TextStyle(fontSize: 20)),
                        ),
                        trailing: GestureDetector(
                          onTap: (() {
                            launchUrlString(_dataapp[index].githuburl);
                          }),
                          child: Image(
                            image: AssetImage('assets/github.png'),
                            height: 40,
                          ),
                        )));
              },
              itemCount: _dataapp.length,
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.25,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: -2,
                offset: Offset(2, 2),
                blurRadius: 6,
              )
            ], color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/github.png',
                  height: 80,
                ),
                SizedBox(
                  width: 40,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "API Source",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'https://github.com/bachors/Al-Quran-ID-API',
                        style: GoogleFonts.poppins(
                            fontStyle: FontStyle.italic, fontSize: 12),
                        maxLines: 2,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: greencolor, elevation: 0),
                              onPressed: () {
                                launchUrlString(
                                    'https://github.com/bachors/Al-Quran-ID-API');
                              },
                              child: Text(
                                'Visit',
                                style: GoogleFonts.poppins(),
                              )))
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
