import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/theme_provider.dart';

class LaunguagePage extends StatefulWidget {
  const LaunguagePage({super.key});

  @override
  State<LaunguagePage> createState() => _LaunguagePageState();
}

class _LaunguagePageState extends State<LaunguagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/image/img5.jpg"),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.black.withOpacity(0.6), // Adjust opacity here
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(),
                  // Switch for theme (commented out)
                  // child: Switch(
                  //   value: Provider.of<ThemeProvider>(context).istap,
                  //   onChanged: (val) {
                  //     Provider.of<ThemeProvider>(context, listen: false)
                  //         .changetheme(val);
                  //   }
                  // ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/');
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Text(
                      "Hindi",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('EnglishHome_page');
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.white.withOpacity(0.2),
                    ),
                    child: Text(
                      "English",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
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
