import 'package:despature/provider/deleteprovider.dart';
import 'package:despature/utils/global.dart';
import 'package:despature/utils/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        centerTitle: true,
        title: Text(
          'Favourites',
          style: TextS.title,
        ),
        backgroundColor: const Color(0xff421E06),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<Deleteprovider>(context, listen: false).deleteAll();
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ],
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
            color: Colors.black.withOpacity(0.7),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              bottom: 20,
            ),
            child: Column(
              children: [
                Expanded(
                  child: Consumer<Deleteprovider>(
                    builder: (context, deleteProvider, _) {
                      return ListView.builder(
                        itemCount: deleteProvider.favorites.length,
                        itemBuilder: (context, index) {
                          final item = deleteProvider.favorites[index];

                          return ListTile(
                            title: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  'Verse_page',
                                  arguments: item,
                                );
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 5,
                                ),
                                padding: const EdgeInsets.only(),
                                height: 150,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xffFFAF45)
                                          .withOpacity(0.5)),
                                  color: Colors.black.withOpacity(0.2),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(7)),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            border: Border.symmetric(
                                              vertical: BorderSide(
                                                  color: const Color(0xffFFAF45)
                                                      .withOpacity(0.5)),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "श्लोक :",
                                                style: TextS.title,
                                              ),
                                              Text(
                                                "${item['Sloka']}",
                                                style: TextS.title,
                                              )
                                            ],
                                          ),
                                        )),
                                    Expanded(
                                      flex: 4,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 20,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "${item['name']}",
                                                    style: TextS.title,
                                                    maxLines: 3,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  const SizedBox(
                                                    width: 20,
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      Provider.of<Deleteprovider>(
                                                              context,
                                                              listen: false)
                                                          .deleteItem(item);
                                                    },
                                                    icon: const Icon(
                                                      Icons.favorite,
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text(
                                              "${item['Verse']}",
                                              style: TextS.subtitle,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
