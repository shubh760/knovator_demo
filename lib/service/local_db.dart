import 'package:shared_preferences/shared_preferences.dart';

class IndexStorage {
  static const String indexKey = 'index_list';

  // Fetch the list of indices from SharedPreferences
  Future<List<int>> getIndices() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? stringList = prefs.getStringList(indexKey);
    return stringList?.map(int.parse).toList() ?? [];
  }

  // Add an index to the list and save it
  Future<void> addIndex(int index) async {
    final prefs = await SharedPreferences.getInstance();
    List<int> indices = await getIndices();

    if (!indices.contains(index)) {
      indices.add(index);
      prefs.setStringList(indexKey, indices.map((e) => e.toString()).toList());
    }
  }

  // Check if an index is present in the list
  Future<bool> isIndexPresent(int index) async {
    List<int> indices = await getIndices();
    return indices.contains(index);
  }
}
