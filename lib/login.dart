import 'package:flutter/material.dart';
import 'package:linkedin_slicing/register.dart';
import 'package:linkedin_slicing/widgets/button_login.dart';
import 'package:linkedin_slicing/widgets/colors.dart';
import 'package:linkedin_slicing/widgets/continue_button.dart';
import 'package:linkedin_slicing/widgets/custom_input.dart';
import 'package:linkedin_slicing/widgets/my_checkbox.dart';
import 'package:linkedin_slicing/widgets/navigate_button.dart';
import 'package:linkedin_slicing/widgets/or_with_lines.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isObscure = true;
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Image.asset(
            "images/linkedin.png",
            width: 100,
          )),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Text(
                "Login",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                ),
              ),
            ),
            NavigateButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Register()));
                },
                firstText: "atau ",
                secondText: "Bergabung dengan LinkedIn",
                firstTextColor: secondaryColor,
                secondTextColor: primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 14),
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
            ButtonLogin(
                padding: 8,
                foregroundColor: foregroundColorButtonLogin,
                fontSize: 20,
                textButton: "Login dengan Apple",
                images: "images/applelogo.png",
                height: 20,
                textButtonColor: textColorButtonLogin),
            SizedBox(
              height: 8,
            ),
            ButtonLogin(
                padding: 8,
                foregroundColor: foregroundColorButtonLogin,
                fontSize: 20,
                textButton: "Login dengan Facebook",
                images: "images/facebook.png",
                height: 19,
                textButtonColor: textColorButtonLogin),
            OrWithLines(
                fontWeight: FontWeight.w500,
                marginVertical: 16,
                thicknessLine: 1,
                lineColor: lineColor,
                textOr: "atau",
                fontSize: 14,
                textPadding: 20),
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
            CustomInput(
                labelText: "Kata Sandi",
                keyboardType: TextInputType.text,
                obscureText: true,
                isPassword: true,
                cursorColor: Colors.black,
                labelColor: labelColor,
                enabledBorderColor: enabledBorderColor,
                focusedBorderColor: focusedBorderColor),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                MyCheckbox(
                    height: 24,
                    width: 24,
                    marginLeft: 5,
                    fontSize: 16,
                    text: "Ingat saya.",
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked = !_isChecked;
                      });
                    },
                    checkBoxColor: checkBoxColor,
                    value: _isChecked ? true : false),
                Container(
                  margin: EdgeInsets.only(left: 5),
                  child: TextButton(
                    style: ButtonStyle(
                      padding:
                          WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Pelajari lebih lanjut',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 17, 106, 196),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                TextButton(
                    style: ButtonStyle(
                      padding:
                          WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Lupa kata sandi?",
                      style:
                          TextStyle(color: Color.fromARGB(255, 17, 106, 196)),
                    )),
              ],
            ),
            ContinueButton(
              textButton: "Lanjutkan",
              backgroundColor: primaryColor,
              padding: 8,
              fontSize: 20,
              textColor: Colors.white,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
