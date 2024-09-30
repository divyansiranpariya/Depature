// import 'package:despature/utils/global.dart';
// import 'package:flutter/material.dart';
//
// class Deleteprovider extends ChangeNotifier {
//   void deleteAll() {
//     Favourite.data.clear();
//     Favourite.alldata.clear();
//     notifyListeners();
//   }
//
//   void delete(int id) {
//     Favourite.data.remove(Favourite.alldata[id]);
//     Favourite.alldata.removeAt(id);
//     notifyListeners();
//   }
// }
import 'package:flutter/cupertino.dart';

class Deleteprovider with ChangeNotifier {
  List<Map<String, dynamic>> _favorites = [];

  List<Map<String, dynamic>> get favorites => _favorites;

  void deleteItem(Map<String, dynamic> item) {
    _favorites.remove(item);
    notifyListeners();
  }

  void deleteAll() {
    _favorites.clear();
    notifyListeners();
  }

  void addItem(Map<String, dynamic> item) {
    _favorites.add(item);
    notifyListeners();
  }
}
