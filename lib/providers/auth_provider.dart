import 'package:admin_dashboard/services/local_storage.dart';
import 'package:flutter/material.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;

  AuthProvider() {
    isAuthenticated();
  }

  Future<bool> isAuthenticated() async {
    final tempToken = LocalStorage.prefs.getString('token');

    if (tempToken == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    // TODO: ir al backend y comprobar si el JWT es valido
    await Future.delayed(const Duration(milliseconds: 1000));

    authStatus = AuthStatus.authenticated;
    notifyListeners();
    return true;
  }

  login(String email, String password) {
    // TODO: Peticion HTTP
    _token = 'iuigygtfxdzs.fdxtfcytuviyuijo.pihvgcfxuiokl';
    LocalStorage.prefs.setString('token', _token!);

    authStatus = AuthStatus.authenticated;
    notifyListeners();
  }

  register() {}
}

// JWT: Json Web Token