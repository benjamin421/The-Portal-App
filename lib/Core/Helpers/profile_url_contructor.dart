import '../../Shared/app_constants.dart' as env;

class Functions {
  urlConstructor(String userId, String avatarId) {
    return "${env.discord_cdn}/avatars/$userId/$avatarId.png";
  }
}
