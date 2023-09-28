import 'package:cateringapp/screen/LupaKataSandi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'MyHomePage.dart';
import 'RegisterPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //int? _radioValue = 0;
  bool visibilityPass = false;

  final _passwordController = TextEditingController();
  final _passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  // void _handleRadioValueChange(int? value) {
  //   setState(() {
  //     _radioValue = value;
  //   });
  // }

  bool _validatePassword(String password) {
    if (password.length < 10) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Invalid Password'),
            content: Text('Password must be at least 10 characters long.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      return false;
    }
    return true;
  }

  void _login() {
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      form.save();
      String password = _passwordController.text;

      if (_validatePassword(password)) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const MyHomePage()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back)),
              Align(
                alignment: Alignment.centerLeft,
                child: Image(
                    image: AssetImage('assets/images/logo-darkmode.png'),
                    width: 100),
              ),
            ],
          ),
          backgroundColor: Color.fromARGB(255, 1, 67, 121),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    //decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Center(
                        child: Text(
                      "Masuk",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    )),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email/Nama Pengguna',
                      icon: Icon(
                        Icons.email,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    focusNode: _passwordFocusNode,
                    obscureText: !visibilityPass,
                    decoration: InputDecoration(
                      labelText: 'Kata Sandi',
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            visibilityPass = !visibilityPass;
                          });
                        },
                        icon: visibilityPass
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                      ),
                      icon: Icon(
                        Icons.settings,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Mohon masukkan kata sandi';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 5),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 35),
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return LupaKataSandi();
                                }));
                              },
                              child: Text("Lupa kata sandi")),
                        ),
                      ),

                      // CheckboxListTile(
                      //   title: Text(
                      //     'Remember Me',
                      //     style: TextStyle(
                      //       color: Theme.of(context).textTheme.bodyText2!.color,
                      //     ),
                      //   ),
                      //   controlAffinity: ListTileControlAffinity.leading,
                      //   value: _rememberMe,
                      //   onChanged: (bool? value) {
                      //     setState(() {
                      //       _rememberMe = value ?? false;
                      //     });
                      //   },
                      // ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(300, 50.0),
                          maximumSize:
                              Size(MediaQuery.of(context).size.width, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        onPressed: _login,
                        child: Text('Masuk'),
                      ),

                      SizedBox(height: 40),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Belum memiliki akun ? ",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            TextSpan(
                              text: 'Daftar',
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                                fontSize: 16,
                                decoration: TextDecoration.none,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return RegisterPage();
                                  }));
                                },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
