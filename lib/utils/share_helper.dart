import 'package:shared_preferences/shared_preferences.dart';

class ShareHelper {
  static ShareHelper shareHelper = ShareHelper._();

  ShareHelper._();

  Future<int> getXScore() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('xScore') ?? 0;
  }

  Future<int> getOScore() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('oScore') ?? 0;
  }

  Future<void> saveXScore(int score) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('xScore', score);
  }

  Future<void> saveOScore(int score) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('oScore', score);
  }
}
