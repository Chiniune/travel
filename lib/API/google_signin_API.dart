import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInAPI {
  static const _clientIDWeb =
      "734292379156-e0hiv8usb60hisna8d2c6og0i5ph4sub.apps.googleusercontent.com";
  static const _clientIAndroid =
      "734292379156-jim8nr4fua1fbi8f84jb5fr05s2isvqt.apps.googleusercontent.com";

  static final _googleSignIn = GoogleSignIn(clientId: _clientIDWeb);

  static Future<GoogleSignInAccount> login() async {
    final account = await _googleSignIn.signIn();
    if (account == null) {
      throw Exception('Failed to sign in with Google.');
    }
    return account;
  }

  static Future logout() => _googleSignIn.disconnect();
}
