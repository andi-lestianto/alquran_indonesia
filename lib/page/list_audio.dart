import 'package:alquran_indonesia/model/get_allsurat.dart';
import 'package:alquran_indonesia/theme/theme.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  String durasi = '00:00:00';
  AudioPlayer? audioPlayer;

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
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: greencolor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 20),
                      height: 150,
                      width: MediaQuery.of(context).size.width * 0.50,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Dengarkan Murotal",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: "fde084".toColor())),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/muslim.png"))),
                    ),
                  ],
                ),
              ),
            ),
            SafeArea(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                ),
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.2),
                child: Container(
                  padding: EdgeInsets.only(top: 10),
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: nomor.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.11,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 1,
                                              color: "e1e1e1".toColor()))),
                                  child: Row(
                                    children: [
                                      Container(
                                          height: 25,
                                          width: 25,
                                          decoration: BoxDecoration(
                                              color: greencolor,
                                              borderRadius:
                                                  BorderRadius.circular(40)),
                                          child: Center(
                                              child: Text(
                                            "${nomor[index]}",
                                            style: GoogleFonts.poppins(
                                                color: Colors.white),
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
                                                      playSound(
                                                          "${audio[index]}");
                                                    },
                                                    iconSize: 30,
                                                    icon:
                                                        Icon(Icons.play_arrow),
                                                    color: greencolor),
                                                IconButton(
                                                    onPressed: () {
                                                      pauseSound();
                                                    },
                                                    iconSize: 30,
                                                    icon: Icon(Icons.pause),
                                                    color: greencolor),
                                                IconButton(
                                                    onPressed: () {
                                                      stopSound();
                                                    },
                                                    iconSize: 30,
                                                    icon: Icon(Icons.stop),
                                                    color: greencolor),
                                                IconButton(
                                                    onPressed: () {
                                                      resumeSound();
                                                    },
                                                    iconSize: 30,
                                                    icon: Icon(
                                                        Icons.pause_circle),
                                                    color: greencolor),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.024),
                                              child: Text(
                                                durasi,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(child: SizedBox()),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Text(
                                          "${asma[index]}",
                                          style: GoogleFonts.notoNaskhArabic(
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
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
