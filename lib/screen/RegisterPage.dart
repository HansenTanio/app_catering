import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'LoginPage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  int? _radioValue = 0;
  bool visibilityPass = false;
  TextEditingController _dateController = TextEditingController();
  DateFormat _dateFormat = DateFormat('dd-MM-yyyy');

  String? _username;
  String? _password;
  String? _phone;

  void _handleRadioValueChange(int? value) {
    setState(() {
      _radioValue = value;
    });
  }

  void _setDatePicker() async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
    );

    if (selectedDate != null) {
      String formattedDate = _dateFormat.format(selectedDate);
      _dateController.text = formattedDate;
    }
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  void _handleUsernameChange(String value) {
    setState(() {
      _username = value;
    });
  }

  void _handlePasswordChange(String value) {
    setState(() {
      _password = value;
    });
  }

  void _handlePhoneChange(String value) {
    setState(() {
      _phone = value;
    });
  }

  void _showPasswordErrorDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Password Invalid'),
          content: Text('Password harus memiliki minimal 10 karakter.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showPhoneErrorDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Nomor Telepon Invalid'),
          content: Text(
              'Nomor telepon harus hanya berisi angka dan maksimal 15 angka.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showEmptyFieldErrorDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Kolom Kosong'),
          content: Text('Masih ada kolom yang kosong ya, tolong diisi semua.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
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
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: Center(
                  child: Text(
                "Daftar",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              )),
            ),
            SizedBox(height: 15),
            TextField(
              onChanged: _handleUsernameChange,
              decoration: InputDecoration(
                labelText: "Nama akun",
                icon: Icon(
                  Icons.people,
                  color: Theme.of(context).iconTheme.color,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 15),
            TextFormField(
              readOnly: true,
              controller: _dateController,
              onTap: _setDatePicker,
              decoration: InputDecoration(
                labelText: "Tanggal Lahir",
                icon: Icon(
                  Icons.date_range,
                  color: Theme.of(context).iconTheme.color,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              decoration: InputDecoration(
                labelText: "Email",
                icon: Icon(
                  Icons.email,
                  color: Theme.of(context).iconTheme.color,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              obscureText: !visibilityPass,
              onChanged: _handlePasswordChange,
              decoration: InputDecoration(
                labelText: "Kata Sandi",
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
            ),
            SizedBox(height: 15),
            TextField(
              keyboardType: TextInputType.phone,
              onChanged: _handlePhoneChange,
              decoration: InputDecoration(
                labelText: "No.Telp",
                icon: Icon(
                  Icons.phone,
                  color: Theme.of(context).iconTheme.color,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 33.0),
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 20)),
                  Row(
                    children: [
                      Radio<int>(
                        value: 0,
                        groupValue: _radioValue,
                        onChanged: _handleRadioValueChange,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Laki-Laki',
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText2!.color,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Radio<int>(
                        value: 1,
                        groupValue: _radioValue,
                        onChanged: _handleRadioValueChange,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Perempuan',
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText2!.color,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(300, 50.0),
                      maximumSize: Size(MediaQuery.of(context).size.width, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    onPressed: () {
                      if (_username == null ||
                          _username!.isEmpty ||
                          _dateController.text.isEmpty) {
                        _showEmptyFieldErrorDialog();
                      } else if (_password != null && _password!.length >= 10) {
                        if (_phone != null &&
                            _phone!.length <= 15 &&
                            RegExp(r'^[0-9]+$').hasMatch(_phone!)) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return LoginPage();
                            }),
                          );
                        } else {
                          _showPhoneErrorDialog();
                        }
                      } else {
                        _showPasswordErrorDialog();
                      }
                    },
                    child: Text('Daftar'),
                  ),
                  SizedBox(height: 40),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Sudah memiliki akun ? ",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        TextSpan(
                          text: 'Masuk',
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyText1!.color,
                            fontSize: 16,
                            decoration: TextDecoration.none,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return LoginPage();
                              }));
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
