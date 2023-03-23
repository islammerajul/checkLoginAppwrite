import 'package:appwrite/appwrite.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:appwrite/models.dart' as models;
import '../main.dart';

class AuthHelper {
  AuthHelper._privateConstructor();
  static final AuthHelper _instance = AuthHelper._privateConstructor();
  static AuthHelper get instance => _instance;

  static final Future<SharedPreferences> _prefs =
      SharedPreferences.getInstance();

  static final account = Account(client);

  static Future<bool> isLoggedIn() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getBool('isLoggedIn') ?? false;
  }

  static Future<void> setLoggedIn(bool value) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool('isLoggedIn', value);
  }

  Future<bool> loginEmailPassword(String email, String password) async {
    final SharedPreferences prefs = await _prefs;
    print("$email:::$password");
    print(client);

    print("log");

    try {
      Client myclient = Client();

      myclient
              .setEndpoint('http://localhost/v1') // Your Appwrite Endpoint
              .setProject('641bed0c00e0c9af1b66') // Your project ID
              .setSelfSigned() // Use only on dev mode with a self-signed SSL cert
          ;

      Account myAccount = Account(myclient);

      final user = await myAccount.create(
          userId: ID.unique(),
          email: 'me@appwrite.io',
          password: 'password',
          name: 'My Name');

      //final models.Session response =await account.createEmailSession(email: email, password: password);

      // prefs.setString('session', response.clientCode);
      // prefs.setString('email', email);
      // prefs.setString('password', password);
      // setLoggedIn(true);
    } catch (e) {
      print("exception");
      print(e.toString());
    }
    return true;
  }
}
