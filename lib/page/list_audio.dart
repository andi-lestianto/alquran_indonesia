import 'package:alquran_indonesia/model/get_allsurat.dart';
import 'package:alquran_indonesia/theme/theme.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:supercharged/supercharged.dart';

class listAudio extends StatefulWidget {
  const listAudio({Key? key}) : super(key: key);

  @override
  State<listAudio> createState() => _listAudioState();
}

class _listAudioState extends State<listAudio> {
  final List<String?> nomor = <String?>[];
  final List<String?> nama = <String?>[];
  final List<String?> asma = <String?>[];
  final List<String?> audio = <String>[];
  List<bool> isplayed = [];
  bool playayat = false;
  String durasi = '00:00:00';
  AudioPlayer? audioPlayer;

  String headersurat = "Dengarkan Murotal";
  String playstatus = "";

  void titleheader(bool played) {
    playayat = played;
  }

  _listAudioState() {
    audioPlayer = AudioPlayer();
    audioPlayer?.onAudioPositionChanged.listen((duration) {
      setState(() {
        durasi = duration.toString();
      });
    });
    audioPlayer?.setReleaseMode(ReleaseMode.STOP);
  }
  void initState() {
    super.initState();
    AmbilDataSurat();
  }

  void playSound(String url) async {
    await audioPlayer!.play(url);
  }

  void pauseSound() async {
    await audioPlayer!.pause();
  }

  void stopSound() async {
    await audioPlayer!.stop();
  }

  void resumeSound() async {
    await audioPlayer!.resume();
  }

  void AmbilDataSurat() {
    SemuaSurat.getSemuaSurat().then((value) {
      for (int i = 0; i < value.length; i++) {
        nomor.add(value[i].nomor);
        nama.add(value[i].nama);
        asma.add(value[i].asma);
        audio.add(value[i].audio);
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              color: greencolor,
            ),
            SafeArea(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/bghome.png"),
                        opacity: 0.2,
                        fit: BoxFit.cover)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          (playayat == true)
                              ? Text(
                                  playstatus,
                                  style:
                                      GoogleFonts.poppins(color: Colors.white),
                                )
                              : SizedBox(),
                          Text(headersurat,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: "fde084".toColor())),
                          (playayat == true)
                              ? Text(
                                  durasi.substring(0, 7),
                                  style:
                                      GoogleFonts.poppins(color: Colors.white),
                                )
                              : SizedBox(),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/alquran.png"),
                              fit: BoxFit.fitWidth)),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
              ),
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.28),
              child: Container(
                padding: EdgeInsets.only(top: 10),
                child: (nomor.length == 0)
                    ? Center(
                        child: SpinKitFadingCircle(
                        size: 45,
                        color: Colors.green,
                      ))
                    : ListView.separated(
                        padding: const EdgeInsets.all(8),
                        itemCount: nomor.length,
                        itemBuilder: (BuildContext context, int index) {
                          isplayed.add(false);
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: (isplayed[index])
                                  ? Colors.grey[200]
                                  : Colors.white,
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.12,
                                    child: Row(
                                      children: [
                                        Container(

                                            height: 35,
                                            width: 35,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/border.png"))),

                                            child: Center(
                                                child: Text(
                                              "${nomor[index]}",
                                              style: GoogleFonts.poppins(

                                                  color: Colors.black),

                                            ))),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${nama[index]}",
                                                style: GoogleFonts.poppins(
                                                    color: Colors.black87,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                              Row(
                                                children: [
                                                  IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          if (isplayed[index] ==
                                                              false) {
                                                            isplayed[index] =
                                                                true;
                                                            titleheader(true);
                                                            headersurat =
                                                                nama[index]
                                                                    .toString();
                                                            playstatus =
                                                                "Sedang diputar";
                                                            playSound(
                                                                "${audio[index]}");
                                                          } else {
                                                            isplayed[index] =
                                                                false;
                                                            playstatus =
                                                                "Sedang dipause";
                                                            pauseSound();
                                                          }
                                                        });
                                                      },
                                                      iconSize: 30,
                                                      icon: (isplayed[index])
                                                          ? Icon(
                                                              Icons.pause,
                                                            )
                                                          : Icon(
                                                              Icons.play_arrow),
                                                      color: greencolor),
                                                  IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          titleheader(false);
                                                          isplayed[index] =
                                                              false;
                                                          headersurat =
                                                              "Dengarkan Murotal";
                                                          stopSound();
                                                        });
                                                      },
                                                      iconSize: 30,
                                                      icon: Icon(Icons.stop),
                                                      color: greencolor),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(child: SizedBox()),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Text(
                                            "${asma[index]}",
                                            style: (isplayed[index])
                                                ? GoogleFonts.notoNaskhArabic(
                                                    color: greencolor,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25)
                                                : GoogleFonts.notoNaskhArabic(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25),
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                        // Html(data: "${keterangan[index]}"),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
