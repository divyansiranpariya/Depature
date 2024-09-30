import 'dart:convert';

import 'package:despature/utils/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EnglishHomePage extends StatefulWidget {
  const EnglishHomePage({super.key});

  @override
  State<EnglishHomePage> createState() => _EnglishHomePageState();
}

class _EnglishHomePageState extends State<EnglishHomePage> {
  int selectIndex = 0;
  Future<String>? jsondata;
  int selectedChapter = 0;

  void loadjson() {
    jsondata = rootBundle.loadString("assets/json/bhagvaddata.json");
  }

  @override
  void initState() {
    super.initState();
    loadjson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Bhagvad Gita',
          style: TextS.title,
        ),
        backgroundColor: Color(0xff421E06),
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('EnglishFavourite_page');
            },
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Color(0xff4e342e)),
              child: Text('Menu', style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              title: Text('Chapter 1'),
              onTap: () {},
            ),
            // Add more items
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/img5.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.4),
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  color: Color(0xff55331A).withOpacity(0.7),
                  child: ListView.builder(
                    padding: EdgeInsets.all(10),
                    itemCount: 17,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedChapter = index;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            color: selectedChapter == index
                                ? Colors.brown.withOpacity(0.7)
                                : Colors.transparent,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(),
                                child: Text(
                                  'A- ${index + 1}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Divider(
                                color: Color(0xffFFAF45).withOpacity(0.5),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
                  child: Container(
                    decoration: BoxDecoration(

                        color: Color(0xff55331A).withOpacity(0.7),
                        border: Border.all(
                            color: Color(0xffFFAF45).withOpacity(0.5)),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: FutureBuilder(
                      future: jsondata,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          String? data = snapshot.data;
                          List<dynamic> alldata =
                              (data == null) ? [] : jsonDecode(data);

                          if (alldata.isEmpty ||
                              selectedChapter >= alldata.length) {
                            return Center(
                              child: Text("No data available for this chapter"),
                            );
                          }

                          var chapterData = alldata[selectedChapter];
                          return Container(
                            height: double.infinity,
                            padding: EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "${chapterData['name']}",
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Verses :",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          "${chapterData['verses_count']}",
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "${chapterData['chapter_summary']}",
                                      style: TextS.subtitle,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Navigator.of(context).pushNamed(
                                                'EnglishDetail_page',
                                                arguments: chapterData);
                                          },
                                          icon: Icon(
                                            Icons.navigate_next,
                                            color: Colors.white,
                                            size: 35,
                                          )),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text("ERROR: ${snapshot.error}"),
                          );
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
