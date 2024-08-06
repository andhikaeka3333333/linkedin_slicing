import 'package:flutter/material.dart';
import 'package:linkedin_slicing/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _showPasswordField = false;
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Image.asset(
            "images/linkedin.png",
            width: 100,
          )),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15.0),
        child: Container(
          margin: EdgeInsets.only(top: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Bergabung dengan LinkedIn",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Login()));
                  },
                  style: ButtonStyle(
                    padding:
                        WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "atau ",
                        style: TextStyle(
                          color: Color.fromARGB(255, 135, 135, 135),
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "Login",
                        style: TextStyle(
                            color: Color.fromARGB(255, 10, 102, 194),
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )),
              Container(
                margin: EdgeInsets.only(top: 12),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    labelText: "Email atau Telepon*",
                    labelStyle:
                        TextStyle(color: Color.fromARGB(255, 152, 152, 152)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 140, 140, 140)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 102, 102, 102), width: 2),
                    ),
                  ),
                ),
              ),
              if (_showPasswordField)
                Container(
                  margin: EdgeInsets.only(top: 24),
                  child: TextField(
                    obscureText: _isObscure,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      labelText: "Kata Sandi",
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 152, 152, 152)),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 140, 140, 140)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 102, 102, 102),
                          width: 2,
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              Container(
                margin: EdgeInsets.only(top: 40),
                child: RichText(
                  text: TextSpan(
                    text:
                        'Dengan mengeklik Setuju & Bergabung atau Lanjutkan, Anda menyetujui ',
                    style: TextStyle(
                      color: Color.fromARGB(255, 67, 67, 67),
                      fontSize: 12,
                    ),
                    children: [
                      TextSpan(
                        text: 'Perjanjian Pengguna',
                        style: TextStyle(
                          color: Color.fromARGB(255, 10, 102, 194),
                          fontSize: 12,
                        ),
                      ),
                      TextSpan(
                        text: ', ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 67, 67, 67),
                          fontSize: 12,
                        ),
                      ),
                      TextSpan(
                        text: 'Kebijakan Privasi',
                        style: TextStyle(
                          color: Color.fromARGB(255, 10, 102, 194),
                          fontSize: 12,
                        ),
                      ),
                      TextSpan(
                        text: ', dan ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 67, 67, 67),
                          fontSize: 12,
                        ),
                      ),
                      TextSpan(
                        text: 'Kebijakan Cookie ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 10, 102, 194),
                          fontSize: 12,
                        ),
                      ),
                      TextSpan(
                        text:
                            'LinkedIn. Untuk pendaftaran dengan nomor telepon, kode verifikasi akan dikirimkan lewat \nSMS.',
                        style: TextStyle(
                          color: Color.fromARGB(255, 67, 67, 67),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 12),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 10, 102, 194),
                      padding: EdgeInsets.all(8),
                    ),
                    onPressed: () {
                      setState(() {
                        _showPasswordField = true;
                      });
                    },
                    child: Text(
                      "Setuju & Bergabung",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )),
              ),
              if (!_showPasswordField)
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Color.fromARGB(255, 240, 240, 240),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          "atau",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Color.fromARGB(255, 240, 240, 240),
                        ),
                      ),
                    ],
                  ),
                ),
              if (!_showPasswordField)
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Color.fromARGB(255, 169, 164, 164),
                    padding: EdgeInsets.all(8),
                  ),
                  onPressed: () {},
                  label: Text(
                    "Login dengan Google",
                    style: TextStyle(
                      color: Color.fromARGB(255, 81, 81, 81),
                      fontSize: 20,
                    ),
                  ),
                  icon: Image.asset('images/google.png',
                      height: 26, fit: BoxFit.cover),
                ),
              if (!_showPasswordField)
                Container(
                  margin: EdgeInsets.only(top: 8),
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.all(8),
                      foregroundColor: Color.fromARGB(255, 169, 164, 164),
                    ),
                    onPressed: () {},
                    label: Text(
                      "Login dengan Facebook",
                      style: TextStyle(
                        color: Color.fromARGB(255, 81, 81, 81),
                        fontSize: 20,
                      ),
                    ),
                    icon: Image.asset('images/facebook.png',
                        height: 19, fit: BoxFit.cover),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
