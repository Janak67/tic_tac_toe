import 'package:shared_preferences/shared_preferences.dart';

class ShareHelper {
  static ShareHelper shareHelper = ShareHelper._();

  ShareHelper._();

  Future<int> getXScore() async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    return shr.getInt('xScore') ?? 0;
  }

  Future<int> getOScore() async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    return shr.getInt('oScore') ?? 0;
  }

  Future<void> saveXScore(int score) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    await shr.setInt('xScore', score);
  }

  Future<void> saveOScore(int score) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    await shr.setInt('oScore', score);
  }
}
