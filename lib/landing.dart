import 'package:alquran_indonesia/model.dart';
import 'package:alquran_indonesia/repository.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => new _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<Blog> listBlog = [];
  Repository repository = Repository();

  getData() async {
    listBlog = await repository.getData();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Al-Quran Indonesia'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return Card(
                child: Text(
                  listBlog[index].nama,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemCount: listBlog.length),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.blueAccent,
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.account_box, size: 30),
          Icon(
            Icons.add,
            size: 30,
          )
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
    );
  }
}
