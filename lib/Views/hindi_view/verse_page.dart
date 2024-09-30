import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:despature/provider/deleteprovider.dart';
import 'package:despature/utils/global.dart';
import 'package:despature/utils/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_extend/share_extend.dart';

class VersePage extends StatefulWidget {
  const VersePage({super.key});

  @override
  State<VersePage> createState() => _VersePageState();
}

class _VersePageState extends State<VersePage> {
  bool istapped = false;
  GlobalKey repainkey = GlobalKey();

  @override
  Future<void> shareImage() async {
    RenderRepaintBoundary renderRepaintBoundary =
        repainkey.currentContext!.findRenderObject() as RenderRepaintBoundary;

    var image = await renderRepaintBoundary.toImage(pixelRatio: 5);

    ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);

    Uint8List fetchImage = byteData!.buffer.asUint8List();

    Directory directory = await getApplicationCacheDirectory();

    String path = directory.path;

    File file = File('$path.png');

    file.writeAsBytes(fetchImage);

    ShareExtend.share(file.path, "Image");
  }

  Widget build(BuildContext context) {
    final Map<String, dynamic> verses =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        centerTitle: true,
        title: Text(
          'श्रीमद् भगवद्गीता',
          style: TextS.title,
        ),
        backgroundColor: const Color(0xff421E06),
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
            padding: const EdgeInsets.all(20),
            child: RepaintBoundary(
              key: repainkey,
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: const Color(0xff55331A).withOpacity(0.7),
                    border: Border.all(
                        color: const Color(0xffFFAF45).withOpacity(0.5)),
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 35, horizontal: 5),
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      NetworkImage("${verses['image_name']}"))),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50, right: 30),
                          child: Column(
                            children: [
                              Text(
                                "${verses['Verse']}",
                                style: TextS.subtitle,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                "${verses['Translation_Hindi']}",
                                style: TextS.subtitle,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 30, bottom: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color(0xffFFAF45)
                                                  .withOpacity(0.5)),
                                          color: const Color(0xff421E06)
                                              .withOpacity(0.7),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(5))),
                                      height: 43,
                                      width: 60,
                                      child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            istapped = !istapped;
                                          });

                                          if (istapped) {
                                            Provider.of<Deleteprovider>(context,
                                                    listen: false)
                                                .addItem(verses);
                                          } else {
                                            Provider.of<Deleteprovider>(context,
                                                    listen: false)
                                                .deleteItem(verses);
                                          }
                                        },
                                        icon: Icon(
                                          istapped
                                              ? Icons.favorite
                                              : Icons.favorite_outline,
                                          color: istapped
                                              ? Colors.red
                                              : Colors.white,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color(0xffFFAF45)
                                                  .withOpacity(0.5)),
                                          color: const Color(0xff421E06)
                                              .withOpacity(0.7),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(5))),
                                      height: 40,
                                      width: 60,
                                      child: IconButton(
                                          onPressed: () {
                                            shareImage();
                                          },
                                          icon: const Icon(
                                            Icons.share,
                                            color: Colors.white,
                                          )),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
