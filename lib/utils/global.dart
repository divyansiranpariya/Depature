class Favourite {
  static Set<Map<String, dynamic>> data = {};
  static List<Map<String, dynamic>> alldata = [];

  static void convertData() {
    alldata = data.toList();
  }
}
