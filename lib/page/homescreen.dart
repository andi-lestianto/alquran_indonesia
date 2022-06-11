import 'package:alquran_indonesia/page/list_surat.dart';
import 'package:alquran_indonesia/theme/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            color: Colors.amber,
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          'No. ${imgList.indexOf(item)} image',
                          style: stylePoppins2.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(top: 50),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Color.fromARGB(255, 16, 154, 126),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      height: 150,
                      width: MediaQuery.of(context).size.width * 0.60,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Selamat Datang",
                            style: stylePoppins1.copyWith(color: Colors.white),
                          ),
                          Text(
                            "Lorem ipsum dolor si amet ipsum dolr sit amet Lorem ipsum dolor sit amet",
                            maxLines: 4,
                            style: stylePoppins2.copyWith(
                                color: Colors.white.withOpacity(0.75)),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 245, 245, 245)),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment(0, 1),
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                        child: CarouselSlider(
                          options: CarouselOptions(
                            autoPlay: true,
                            aspectRatio: 2.0,
                            enlargeCenterPage: true,
                          ),
                          items: imageSliders,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, top: 10),
                        child: Container(
                            width: MediaQuery.of(context).size.width * 1,
                            child: Text(
                              "Silahkan Pilih Menu",
                              style: stylePoppins2.copyWith(
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 30, right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => list_surat()));
                              },
                              child: Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 245, 245, 245)),
                                child: Icon(Icons.book),
                              ),
                            ),
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 245, 245, 245)),
                            ),
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 245, 245, 245)),
                            ),
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 245, 245, 245)),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
