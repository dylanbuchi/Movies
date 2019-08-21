import 'package:movies/classes/http_exception.dart';
import 'package:movies/providers/auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

enum AuthMode { Signup, Login }

class AuthScreen extends StatelessWidget {
  static const page = '/auth';

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    // final transformConfig = Matrix4.rotationZ(-8 * pi / 180);
    // transformConfig.translate(-10.0);
    return Scaffold(
      //resizeToAvoidBottomInset: true,
      body: Center(
        child: Stack(
          overflow: Overflow.clip,
          children: <Widget>[
            Image.asset(
              'assets/images/movies.png',
              width: double.infinity,
              height: 900,
              fit: BoxFit.cover,
            ),
            Container(
              child: Container(
                margin: EdgeInsets.only(top: 90),
                height: deviceSize.height,
                width: deviceSize.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(90),
                          color: Theme.of(context).primaryColor,
                          shape: BoxShape.rectangle,
                        ),
                        // ..translate(-10.0),

                        child: Text(
                          'Cinema Infinity',
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 40,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: deviceSize.width > 600 ? 2 : 1,
                      child: AuthCard(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AuthCard extends StatefulWidget {
  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Size> _heightAnime;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 500,
      ),
    );
    _heightAnime = Tween<Size>(
      begin: Size(
        double.infinity,
        500,
      ),
      end: Size(
        double.infinity,
        500,
      ),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
      ),
    );
    _heightAnime.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'An Error Occurred !',
        ),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.Login;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  var _isLoading = false;
  final _passwordController = TextEditingController();

  Future _submit() async {
    if (!_formKey.currentState.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try {
      if (_authMode == AuthMode.Login) {
        // Log user in
        await Provider.of<Auth>(context)
            .login(_authData['email'], _authData['password']);
      } else {
        // Sign user up
        await Provider.of<Auth>(context, listen: false).signUp(
          _authData['email'],
          _authData['password'],
        );
      }
    } on HttpException catch (e) {
      var errorMessage = 'Wrong Username or Password';

      if (e.toString().contains(
            'EMAIL_EXISTS',
          )) {
        errorMessage = 'This email address is already taken';
      } else if (e.toString().contains(
            'INVALID_EMAIL',
          )) {
        errorMessage = 'Invalid Email address please put a valid one';
      } else if (e.toString().contains(
            'WEAK_PASSWORD',
          )) {
        errorMessage =
            'Password is too weak.. Please make it stronger (6 caracteres minimun) ';
      } else if (e.toString().contains(
            'EMAIL_NOT_FOUND',
          )) {
        errorMessage = 'Sorry this email does not exist in our database';
      } else if (e.toString().contains(
            'INVALID_PASSWORD',
          )) {
        errorMessage = 'Invalid Password';
      }
      _showErrorDialog(errorMessage);
    } catch (e) {
      const errorMessage =
          'Something went wrong..  \n Check your connection status or try again later';
    }
    setState(() {
      _isLoading = false;
    });
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.Signup;
      });
      _controller.forward();
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Card(
      color: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10.0,
        ),
      ),
      elevation: 8.0,
      child: Container(
        //height: _authMode == AuthMode.Signup ? 320 : 260,
        height: _heightAnime.value.height,
        constraints: BoxConstraints(
          //minHeight: _authMode == AuthMode.Signup ? 320 : 260,
          minHeight: _heightAnime.value.height,
        ),
        width: deviceSize.width * 0.75,
        padding: EdgeInsets.all(
          16.0,
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'E-Mail',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value.isEmpty ||
                        !value.contains(
                          '@',
                        )) {
                      return 'Invalid email!';
                    }
                  },
                  onSaved: (value) {
                    _authData['email'] = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                  controller: _passwordController,
                  validator: (value) {
                    if (value.isEmpty || value.length < 5) {
                      return 'Password is too short!';
                    }
                  },
                  onSaved: (value) {
                    _authData['password'] = value;
                  },
                ),
                if (_authMode == AuthMode.Signup)
                  TextFormField(
                    enabled: _authMode == AuthMode.Signup,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                    ),
                    obscureText: true,
                    validator: _authMode == AuthMode.Signup
                        ? (value) {
                            if (value != _passwordController.text) {
                              return 'Passwords do not match!';
                            }
                          }
                        : null,
                  ),
                SizedBox(
                  height: 20,
                ),
                if (_isLoading)
                  CircularProgressIndicator()
                else
                  RaisedButton(
                    child: Text(
                      _authMode == AuthMode.Login ? 'Login' : 'Register',
                    ),
                    textColor: Colors.black,
                    onPressed: _submit,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        30,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 8.0,
                    ),
                    color: Theme.of(context).accentColor,
                  ),
                FlatButton(
                  child: Text(
                    '${_authMode == AuthMode.Login ? 'Register' : 'Login'}',
                  ),
                  onPressed: _switchAuthMode,
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 4,
                  ),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
