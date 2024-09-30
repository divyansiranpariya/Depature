import 'dart:math';

import 'package:despature/utils/textstyle.dart';
import 'package:flutter/material.dart';

class EnglishDetailPage extends StatefulWidget {
  const EnglishDetailPage({super.key});

  @override
  State<EnglishDetailPage> createState() => _EnglishDetailPageState();
}

class _EnglishDetailPageState extends State<EnglishDetailPage> {
  @override
  Widget build(BuildContext context) {

    final dynamic data = ModalRoute.of(context)?.settings.arguments as dynamic;

    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        centerTitle: true,
        title: Text(
          'Bhagvad Gita',
          style: TextS.title,
        ),
        backgroundColor: const Color(0xff421E06),
        actions: [],
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/img5.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.4),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff55331A).withOpacity(0.7),
                border:
                    Border.all(color: const Color(0xffFFAF45).withOpacity(0.5)),
                borderRadius: const BorderRadius.all(Radius.circular(15)),
              ),
              child: ListView.separated(
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('EnglishVerse_page',
                            arguments: data['shlok'][i]);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Text(
                                "${data['shlok'][i]['Verse']}",
                                style: TextS.subtitle,
                                softWrap: true,
                                overflow: TextOverflow.visible,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, i) {
                  return const Divider(
                    color: Colors.white30,
                  );
                },
                itemCount: data['shlok'].length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
