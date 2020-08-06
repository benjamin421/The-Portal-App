
import 'package:fiber/Models/access_data.dart';

class Tokens {
  static final Tokens _singleton = new Tokens._internal();
  Tokens._internal();
  static Tokens get instance => _singleton;
  AccessData accessData;
}
