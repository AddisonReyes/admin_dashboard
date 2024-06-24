import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:flutter/material.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthProvider extends ChangeNotifier {
  AuthStatus authStatus = AuthStatus.checking;
  String? _token;

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
    isAuthenticated();

    NavigationService.replaceTo(Flurorouter.dashboardRoute);
  }

  register() {}
}

// JWT: Json Web Token