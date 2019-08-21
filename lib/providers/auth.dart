import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:movies/classes/http_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiredDate;
  String _userId;
  Timer _authTimer;

  bool get isAuthData {
    return token != null;
  }

  String get token {
    if (_expiredDate != null &&
        _expiredDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  Future<void> _authenticate(
    String email,
    String password,
    String urlPart,
  ) async {
    final url =
        'https://www.googleapis.com/identitytoolkit/v3/relyingparty/$urlPart?key=AIzaSyClW843qo1c-vmygl3bMsUbuSMdXQ5fOuQ';

    try {
      final response = await http.post(
        url,
        body: json.encode({
          'email': email,
          'password': password,
          'returnSecureToken': true,
        }),
      );
      final responseData = json.decode(response.body);

      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _expiredDate = DateTime.now().add(
        Duration(
          seconds: int.parse(
            responseData['expiresIn'],
          ),
        ),
      );
      _autoLogout();
      notifyListeners();
      final preferences = await SharedPreferences.getInstance();
      final userLog = json.encode({
        'token': _token,
        'userId': _userId,
        'expiredDate': _expiredDate.toIso8601String(),
      });
      preferences.setString(
        'userLog',
        userLog,
      );
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  Future<void> signUp(
    String email,
    String password,
  ) async {
    return _authenticate(email, password, 'signupNewUser');
  }

  Future<void> login(
    String email,
    String password,
  ) async {
    return _authenticate(email, password, 'verifyPassword');
  }

  Future<bool> tryAutoLogin() async {
    final preferences = await SharedPreferences.getInstance();

    if (preferences.containsKey(
      'userLog',
    )) {
      return false;
    }
    final extractedUserData =
        json.decode(preferences.getString('userLog')) as Map<String, Object>;

    final expiredDate = DateTime.parse(extractedUserData['expiredDate']);

    if (expiredDate.isAfter(
      DateTime.now(),
    )) {
      return false;
    }
    _token = extractedUserData['token'];
    _userId = extractedUserData['userId'];
    _expiredDate = expiredDate;
    notifyListeners();
    _autoLogout();
    return true;
  }

  void _autoLogout() {
    if (_authTimer != null) {
      _authTimer.cancel();
    }
    final timeToExpiry = _expiredDate.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(seconds: timeToExpiry), logout);
  }

  Future<void> logout() async {
    _token = null;
    _userId = null;
    _expiredDate = null;
    if (_authTimer != null) {
      _authTimer.cancel();
      _authTimer = null;
    }
    notifyListeners();
    final preferences = await SharedPreferences.getInstance();
    // prefs.remove('userData');
    preferences.clear();
  }
}
