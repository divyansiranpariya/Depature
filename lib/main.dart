import 'package:despature/Views/english_view/english_detailpage.dart';
import 'package:despature/Views/english_view/english_fave.dart';
import 'package:despature/Views/english_view/english_homepage.dart';
import 'package:despature/Views/english_view/english_verses.dart';
import 'package:despature/Views/hindi_view/detail_page.dart';
import 'package:despature/Views/hindi_view/favourite_page.dart';
import 'package:despature/Views/hindi_view/home_page.dart';
import 'package:despature/Views/hindi_view/verse_page.dart';
import 'package:despature/Views/language_page.dart';
import 'package:despature/Views/splace_screen.dart';
import 'package:despature/provider/deleteprovider.dart';
import 'package:despature/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (context) => Deleteprovider())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: (Provider.of<ThemeProvider>(context).istap)
          ? ThemeMode.dark
          : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      initialRoute: "Space_screen",
      routes: {
        '/': (context) => HomePage(),
        'Detail_page': (context) => DetailPage(),
        'Launguage_page': (context) => LaunguagePage(),
        'Verse_page': (context) => VersePage(),
        'EnglishHome_page': (context) => EnglishHomePage(),
        'EnglishDetail_page': (context) => EnglishDetailPage(),
        'Space_screen': (context) => SplaceScreen(),
        'Favourite_page': (context) => FavouritePage(),
        'EnglishVerse_page': (context) => EnglishVersePage(),
        'EnglishFavourite_page': (context) => EnglishFavPage(),
      },
    );
  }
}
