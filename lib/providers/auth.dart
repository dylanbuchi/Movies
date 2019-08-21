import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:movies/classes/http_exception.dart';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;

  bool get isAuthData {
    return token != null;
  }

  String get token {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
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
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(
            responseData['expiresIn'],
          ),
        ),
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
}
