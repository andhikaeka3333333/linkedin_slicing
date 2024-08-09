import 'package:flutter/material.dart';
import 'package:linkedin_slicing/login.dart';
import 'package:linkedin_slicing/widgets/button_login.dart';
import 'package:linkedin_slicing/widgets/colors.dart';
import 'package:linkedin_slicing/widgets/continue_button.dart';
import 'package:linkedin_slicing/widgets/custom_input.dart';
import 'package:linkedin_slicing/widgets/navigate_button.dart';
import 'package:linkedin_slicing/widgets/or_with_lines.dart';

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
              NavigateButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Login()));
                  },
                  firstText: "atau ",
                  secondText: "Login",
                  firstTextColor: secondaryColor,
                  secondTextColor: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
              SizedBox(
                height: 12,
              ),
              CustomInput(
                  labelText: "Email atau Telepon",
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  isPassword: false,
                  cursorColor: Colors.black,
                  labelColor: labelColor,
                  enabledBorderColor: enabledBorderColor,
                  focusedBorderColor: focusedBorderColor),
              if (_showPasswordField)
                Container(
                  margin: EdgeInsets.only(top: 24),
                  child: CustomInput(
                      labelText: "Kata Sandi",
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      isPassword: true,
                      cursorColor: Colors.black,
                      labelColor: labelColor,
                      enabledBorderColor: enabledBorderColor,
                      focusedBorderColor: focusedBorderColor),
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
              SizedBox(
                height: 12,
              ),
              ContinueButton(
                textButton: "Setuju & Bergabung",
                backgroundColor: primaryColor,
                padding: 8,
                fontSize: 20,
                textColor: Colors.white,
                onPressed: () {
                  setState(() {
                    _showPasswordField = true;
                  });
                },
              ),
              if (!_showPasswordField)
                OrWithLines(
                    fontWeight: FontWeight.w500,
                    marginVertical: 16,
                    thicknessLine: 1,
                    lineColor: lineColor,
                    textOr: "atau",
                    fontSize: 14,
                    textPadding: 20),
              if (!_showPasswordField)
                ButtonLogin(
                    padding: 8,
                    foregroundColor: foregroundColorButtonLogin,
                    fontSize: 20,
                    textButton: "Login dengan Google",
                    images: "images/google.png",
                    height: 26,
                    textButtonColor: textColorButtonLogin),
              SizedBox(
                height: 8,
              ),
              if (!_showPasswordField)
                ButtonLogin(
                    padding: 8,
                    foregroundColor: foregroundColorButtonLogin,
                    fontSize: 20,
                    textButton: "Login dengan Facebook",
                    images: "images/facebook.png",
                    height: 19,
                    textButtonColor: textColorButtonLogin),
            ],
          ),
        ),
      ),
    );
  }
}
