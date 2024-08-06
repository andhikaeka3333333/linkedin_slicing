import 'package:flutter/material.dart';
import 'package:linkedin_slicing/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  bool _isObscure = true;
  bool _isChecked = false;
  bool _hasInteractedWithEmail = false;
  bool _hasInteractedWithPassword = false;
  String? _emailError;
  String? _passwordError;

  @override
  void initState() {
    super.initState();

    _emailController.addListener(() {
      _validateEmail();
    });

    _passwordController.addListener(() {
      _validatePassword();
    });

    _emailFocusNode.addListener(() {
      if (!_emailFocusNode.hasFocus) {
        setState(() {
          _hasInteractedWithEmail = true;
        });
        _validateEmail();
      }
    });

    _passwordFocusNode.addListener(() {
      if (!_passwordFocusNode.hasFocus) {
        setState(() {
          _hasInteractedWithPassword = true;
        });
        _validatePassword();
      }
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _validateEmail() {
    setState(() {
      if (_hasInteractedWithEmail) {
        final input = _emailController.text;
        final isValidEmail = RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(input);
        final isValidPhone = RegExp(r'^\+?0[0-9]{9,15}$').hasMatch(input); // Sesuaikan dengan format nomor telepon yang diinginkan

        if (input.isEmpty) {
          _emailError = 'Masukkan alamat email atau nomor ponsel Anda';
        } else if (!isValidEmail && !isValidPhone) {
          _emailError = 'Alamat Email atau nomor ponsel tidak valid';
        } else {
          _emailError = null;
        }
      }
    });
  }


  void _validatePassword() {
    setState(() {
      if (_hasInteractedWithPassword) {
        if (_passwordController.text.isEmpty) {
          _passwordError = 'Masukkan kata sandi';
        } else if (_passwordController.text.length < 6) {
          _passwordError = 'Masukkan kata sandi yang terdiri dari sedikitnya 6 karakter.';
        } else {
          _passwordError = null;
        }
      }
    });
  }


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
        child: Form(
          key: _formKey,
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
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Register()));
                  },
                  style: ButtonStyle(
                    padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
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
                        "Bergabung dengan LinkedIn",
                        style: TextStyle(
                            color: Color.fromARGB(255, 10, 102, 194),
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.all(8),
                  foregroundColor: Color.fromARGB(255, 169, 164, 164),
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
              Container(
                margin: EdgeInsets.only(top: 8),
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.all(8),
                    foregroundColor: Color.fromARGB(255, 169, 164, 164),
                  ),
                  onPressed: () {},
                  label: Text(
                    "Login dengan Apple",
                    style: TextStyle(
                      color: Color.fromARGB(255, 81, 81, 81),
                      fontSize: 20,
                    ),
                  ),
                  icon: Icon(
                    Icons.apple,
                    color: Colors.black,
                  ),
                ),
              ),
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
              Container(
                margin: EdgeInsets.only(top: 16),
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
              Container(
                margin: EdgeInsets.only(top: 12),
                child: TextFormField(
                  validator: (value) {
                    if (_hasInteractedWithEmail) {
                      if (value == null || value.isEmpty) {
                        return 'Masukkan alamat email atau nomor ponsel Anda';
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value) && !RegExp(r'^\+?0[0-9]{9,15}$').hasMatch(value)) {
                        return 'Alamat Email atau nomor ponsel tidak valid';
                      }
                    }
                    return null;
                  },
                  controller: _emailController,
                  focusNode: _emailFocusNode,
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    labelText: "Email atau Telepon",
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
                    errorText: _emailError,
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2),
                    ),
                  ),
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (_hasInteractedWithPassword) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan kata sandi';
                    } else if (value.length < 6) {
                      return 'Masukkan kata sandi yang terdiri dari sedikitnya 6 karakter.';
                    }
                  }
                  return null;
                },
                controller: _passwordController,
                focusNode: _passwordFocusNode,
                obscureText: _isObscure,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  labelText: "Kata Sandi",
                  labelStyle:
                  TextStyle(color: Color.fromARGB(255, 152, 152, 152)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                    BorderSide(color: Color.fromARGB(255, 140, 140, 140)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 102, 102, 102),
                      width: 2,
                    ),
                  ),
                  errorText: _passwordError,
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
                  focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      color: Colors.black,
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
              Container(
                margin: EdgeInsets.only(top: 8),
                child: Row(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 24.0,
                          width: 24.0,
                          child: Checkbox(
                            value: _isChecked,
                            activeColor: Color.fromARGB(255, 4, 118, 81),
                            onChanged: (bool? value) {
                              setState(() {
                                _isChecked = value ?? false;
                              });
                            },
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text(
                              'Ingat saya.',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            )),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      child: TextButton(
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all<EdgeInsets>(
                              EdgeInsets.zero),
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
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 10, 102, 194),
                      padding: EdgeInsets.all(8),
                      foregroundColor: Color.fromARGB(255, 0, 65, 130)),
                  onPressed: () {
                    setState(() {
                      _hasInteractedWithEmail = true;
                      _hasInteractedWithPassword = true;
                    });
                    if (_formKey.currentState!.validate()) {
                      // Proceed with login
                      // For example:
                      // Navigator.pushNamed(context, '/home');
                    }
                  },
                  child: Text(
                    "Lanjutkan",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}









// import 'package:flutter/material.dart';
// import 'package:linkedin_slicing/register.dart';
//
// class Login extends StatefulWidget {
//   const Login({super.key});
//
//   @override
//   State<Login> createState() => _LoginState();
// }
//
// class _LoginState extends State<Login> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final FocusNode _emailFocusNode = FocusNode();
//   final FocusNode _passwordFocusNode = FocusNode();
//   bool _isObscure = true;
//   bool _isChecked = false;
//   bool _force = false;
//   bool _emailInteracted = false;
//   bool _passInteracted = false;
//   String? _emailError;
//   String? _passwordError;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _emailController.addListener(() {
//       setState(() {
//         //_emailInteracted = true;
//       });
//     });
//
//     _passwordController.addListener(() {
//       setState(() {
//         _passInteracted = true;
//       });
//     });
//
//     _emailFocusNode.addListener(() {
//       // if (!_emailFocusNode.hasFocus) {
//       //   setState(() {
//       //     _hasClickedNext = true;
//       //   });
//       //   _validateEmail();
//       // }
//       if (_emailInteracted || _force) {
//         throw Error();
//         _validateEmail();
//       }
//     });
//
//     _passwordFocusNode.addListener(() {
//       if (_passInteracted || _force) {
//         _validatePassword();
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     _emailFocusNode.dispose();
//     _passwordFocusNode.dispose();
//     super.dispose();
//   }
//
//   void _validateEmail() {
//     setState(() {
//       if (_force) {
//         if (_emailController.text.isEmpty) {
//           _emailError = 'Masukkan alamat email atau nomor ponsel Anda';
//         } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
//             .hasMatch(_emailController.text)) {
//           _emailError = 'Alamat Email atau nomor ponsel tidak valid';
//         } else {
//           _emailError = null;
//         }
//       }
//     });
//   }
//
//   void _validatePassword() {
//     setState(() {
//       if (_force) {
//         if (_passwordController.text.isEmpty) {
//           _passwordError = 'Masukkan kata sandi';
//         } else {
//           _passwordError = null;
//         }
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//           surfaceTintColor: Colors.transparent,
//           automaticallyImplyLeading: false,
//           backgroundColor: Colors.white,
//           title: Image.asset(
//             "images/linkedin.png",
//             width: 100,
//           )),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(15.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Container(
//                 margin: EdgeInsets.only(top: 16),
//                 child: Text(
//                   "Login",
//                   style: TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 30,
//                   ),
//                 ),
//               ),
//               TextButton(
//                   onPressed: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const Register()));
//                   },
//                   style: ButtonStyle(
//                     padding:
//                         WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
//                   ),
//                   child: Row(
//                     children: [
//                       Text(
//                         "atau ",
//                         style: TextStyle(
//                           color: Color.fromARGB(255, 135, 135, 135),
//                           fontSize: 14,
//                         ),
//                       ),
//                       Text(
//                         "Bergabung dengan LinkedIn",
//                         style: TextStyle(
//                             color: Color.fromARGB(255, 10, 102, 194),
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold),
//                       )
//                     ],
//                   )),
//               OutlinedButton.icon(
//                 style: OutlinedButton.styleFrom(
//                   padding: EdgeInsets.all(8),
//                   foregroundColor: Color.fromARGB(255, 169, 164, 164),
//                 ),
//                 onPressed: () {},
//                 label: Text(
//                   "Login dengan Google",
//                   style: TextStyle(
//                     color: Color.fromARGB(255, 81, 81, 81),
//                     fontSize: 20,
//                   ),
//                 ),
//                 icon: Image.asset('images/google.png',
//                     height: 26, fit: BoxFit.cover),
//               ),
//               Container(
//                 margin: EdgeInsets.only(top: 8),
//                 child: OutlinedButton.icon(
//                   style: OutlinedButton.styleFrom(
//                     padding: EdgeInsets.all(8),
//                     foregroundColor: Color.fromARGB(255, 169, 164, 164),
//                   ),
//                   onPressed: () {},
//                   label: Text(
//                     "Login dengan Apple",
//                     style: TextStyle(
//                       color: Color.fromARGB(255, 81, 81, 81),
//                       fontSize: 20,
//                     ),
//                   ),
//                   icon: Icon(
//                     Icons.apple,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(top: 8),
//                 child: OutlinedButton.icon(
//                   style: OutlinedButton.styleFrom(
//                     padding: EdgeInsets.all(8),
//                     foregroundColor: Color.fromARGB(255, 169, 164, 164),
//                   ),
//                   onPressed: () {},
//                   label: Text(
//                     "Login dengan Facebook",
//                     style: TextStyle(
//                       color: Color.fromARGB(255, 81, 81, 81),
//                       fontSize: 20,
//                     ),
//                   ),
//                   icon: Image.asset('images/facebook.png',
//                       height: 19, fit: BoxFit.cover),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(top: 16),
//                 child: Row(
//                   children: <Widget>[
//                     Expanded(
//                       child: Divider(
//                         thickness: 1,
//                         color: Color.fromARGB(255, 240, 240, 240),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                       child: Text(
//                         "atau",
//                         style: TextStyle(
//                           fontSize: 14,
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: Divider(
//                         thickness: 1,
//                         color: Color.fromARGB(255, 240, 240, 240),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(top: 12),
//                 child: TextFormField(
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Masukkan alamat email atau nomor ponsel Anda';
//                     }
//                     return null;
//                   },
//                   controller: _emailController,
//                   focusNode: _emailFocusNode,
//                   keyboardType: TextInputType.emailAddress,
//                   cursorColor: Colors.black,
//                   decoration: InputDecoration(
//                     labelText: "Email atau Telepon",
//                     labelStyle:
//                         TextStyle(color: Color.fromARGB(255, 152, 152, 152)),
//                     enabledBorder: UnderlineInputBorder(
//                       borderSide:
//                           BorderSide(color: Color.fromARGB(255, 140, 140, 140)),
//                     ),
//                     focusedBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(
//                           color: Color.fromARGB(255, 102, 102, 102), width: 2),
//                     ),
//                     errorText: _emailError,
//                     errorBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Colors.red, width: 2),
//                     ),
//                     focusedErrorBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Colors.red, width: 2),
//                     ),
//                   ),
//                 ),
//               ),
//               TextFormField(
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Masukkan kata sandi';
//                   }
//                   return null;
//                 },
//                 controller: _passwordController,
//                 focusNode: _passwordFocusNode,
//                 obscureText: _isObscure,
//                 cursorColor: Colors.black,
//                 decoration: InputDecoration(
//                   labelText: "Kata Sandi",
//                   labelStyle:
//                       TextStyle(color: Color.fromARGB(255, 152, 152, 152)),
//                   enabledBorder: UnderlineInputBorder(
//                     borderSide:
//                         BorderSide(color: Color.fromARGB(255, 140, 140, 140)),
//                   ),
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Color.fromARGB(255, 102, 102, 102),
//                       width: 2,
//                     ),
//                   ),
//                   errorText: _passwordError,
//                   errorBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Colors.red, width: 2),
//                   ),
//                   focusedErrorBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Colors.red, width: 2),
//                   ),
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       color: Colors.black,
//                       _isObscure ? Icons.visibility : Icons.visibility_off,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _isObscure = !_isObscure;
//                       });
//                     },
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(top: 8),
//                 child: Row(
//                   children: [
//                     Row(
//                       children: [
//                         SizedBox(
//                           height: 24.0,
//                           width: 24.0,
//                           child: Checkbox(
//                             value: _isChecked,
//                             activeColor: Color.fromARGB(255, 4, 118, 81),
//                             onChanged: (bool? value) {
//                               setState(() {
//                                 _isChecked = value ?? false;
//                               });
//                             },
//                           ),
//                         ),
//                         Container(
//                             margin: EdgeInsets.only(left: 5),
//                             child: Text(
//                               'Ingat saya.',
//                               style: TextStyle(
//                                 fontSize: 16,
//                               ),
//                             )),
//                       ],
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(left: 5),
//                       child: TextButton(
//                         style: ButtonStyle(
//                           padding: WidgetStateProperty.all<EdgeInsets>(
//                               EdgeInsets.zero),
//                         ),
//                         onPressed: () {},
//                         child: Text(
//                           'Pelajari lebih lanjut',
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: Color.fromARGB(255, 17, 106, 196),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Row(
//                 children: [
//                   TextButton(
//                       style: ButtonStyle(
//                         padding: WidgetStateProperty.all<EdgeInsets>(
//                             EdgeInsets.zero),
//                       ),
//                       onPressed: () {},
//                       child: Text(
//                         "Lupa kata sandi?",
//                         style:
//                             TextStyle(color: Color.fromARGB(255, 17, 106, 196)),
//                       )),
//                 ],
//               ),
//               ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                       backgroundColor: Color.fromARGB(255, 10, 102, 194),
//                       padding: EdgeInsets.all(8),
//                       foregroundColor: Color.fromARGB(255, 0, 65, 130)),
//                   onPressed: () {
//                     setState(() {
//                       _force = true;
//                     });
//                     _validateEmail();
//                     _validatePassword();
//                     if (_formKey.currentState!.validate()) {}
//                   },
//                   child: Text(
//                     "Lanjutkan",
//                     style: TextStyle(fontSize: 20, color: Colors.white),
//                   ))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:linkedin_slicing/register.dart';
//
// class Login extends StatefulWidget {
//   const Login({super.key});
//
//   @override
//   State<Login> createState() => _LoginState();
// }
//
// class _LoginState extends State<Login> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final FocusNode _emailFocusNode = FocusNode();
//   final FocusNode _passwordFocusNode = FocusNode();
//   bool _isObscure = true;
//   bool _isChecked = false;
//   bool _force = false;
//   bool _emailInteracted = false;
//   bool _passInteracted = false;
//   String? _emailError;
//   String? _passwordError;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _emailController.addListener(() {
//       setState(() {
//         if (!_emailInteracted && _emailController.text.isNotEmpty) _emailInteracted = true;
//       });
//       if (_force) _validateEmail();
//     });
//
//     _passwordController.addListener(() {
//       setState(() {
//         if (!_passInteracted && _passwordController.text.isNotEmpty) _passInteracted = true;
//       });
//       if (_force) _validatePassword();
//     });
//
//     _emailFocusNode.addListener(() {
//       // if (!_emailFocusNode.hasFocus) {
//       //   setState(() {
//       //     _hasClickedNext = true;
//       //   });
//       //   _validateEmail();
//       // }
//       if (_emailInteracted || _force) {
//         // throw Error();
//         _validateEmail();
//       }
//     });
//
//     _passwordFocusNode.addListener(() {
//       if (_passInteracted || _force) {
//         _validatePassword();
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     _emailFocusNode.dispose();
//     _passwordFocusNode.dispose();
//     super.dispose();
//   }
//
//   void _validateEmail() {
//     setState(() {
//       if (_emailController.text.isEmpty) {
//         _emailError = 'Masukkan alamat email atau nomor ponsel Anda';
//       } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
//           .hasMatch(_emailController.text)) {
//         _emailError = 'Alamat Email atau nomor ponsel tidak valid';
//       } else {
//         _emailError = null;
//       }
//     });
//   }
//
//   void _validatePassword() {
//     setState(() {
//       if (_passwordController.text.isEmpty) {
//         _passwordError = 'Masukkan kata sandi';
//       } else {
//         _passwordError = null;
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//           surfaceTintColor: Colors.transparent,
//           automaticallyImplyLeading: false,
//           backgroundColor: Colors.white,
//           title: Image.asset(
//             "images/linkedin.png",
//             width: 100,
//           )),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(15.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Container(
//                 margin: EdgeInsets.only(top: 16),
//                 child: Text(
//                   "Login",
//                   style: TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 30,
//                   ),
//                 ),
//               ),
//               TextButton(
//                   onPressed: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const Register()));
//                   },
//                   style: ButtonStyle(
//                     padding:
//                     WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
//                   ),
//                   child: Row(
//                     children: [
//                       Text(
//                         "atau ",
//                         style: TextStyle(
//                           color: Color.fromARGB(255, 135, 135, 135),
//                           fontSize: 14,
//                         ),
//                       ),
//                       Text(
//                         "Bergabung dengan LinkedIn",
//                         style: TextStyle(
//                             color: Color.fromARGB(255, 10, 102, 194),
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold),
//                       )
//                     ],
//                   )),
//               OutlinedButton.icon(
//                 style: OutlinedButton.styleFrom(
//                   padding: EdgeInsets.all(8),
//                   foregroundColor: Color.fromARGB(255, 169, 164, 164),
//                 ),
//                 onPressed: () {},
//                 label: Text(
//                   "Login dengan Google",
//                   style: TextStyle(
//                     color: Color.fromARGB(255, 81, 81, 81),
//                     fontSize: 20,
//                   ),
//                 ),
//                 icon: Image.asset('images/google.png',
//                     height: 26, fit: BoxFit.cover),
//               ),
//               Container(
//                 margin: EdgeInsets.only(top: 8),
//                 child: OutlinedButton.icon(
//                   style: OutlinedButton.styleFrom(
//                     padding: EdgeInsets.all(8),
//                     foregroundColor: Color.fromARGB(255, 169, 164, 164),
//                   ),
//                   onPressed: () {},
//                   label: Text(
//                     "Login dengan Apple",
//                     style: TextStyle(
//                       color: Color.fromARGB(255, 81, 81, 81),
//                       fontSize: 20,
//                     ),
//                   ),
//                   icon: Icon(
//                     Icons.apple,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(top: 8),
//                 child: OutlinedButton.icon(
//                   style: OutlinedButton.styleFrom(
//                     padding: EdgeInsets.all(8),
//                     foregroundColor: Color.fromARGB(255, 169, 164, 164),
//                   ),
//                   onPressed: () {},
//                   label: Text(
//                     "Login dengan Facebook",
//                     style: TextStyle(
//                       color: Color.fromARGB(255, 81, 81, 81),
//                       fontSize: 20,
//                     ),
//                   ),
//                   icon: Image.asset('images/facebook.png',
//                       height: 19, fit: BoxFit.cover),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(top: 16),
//                 child: Row(
//                   children: <Widget>[
//                     Expanded(
//                       child: Divider(
//                         thickness: 1,
//                         color: Color.fromARGB(255, 240, 240, 240),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                       child: Text(
//                         "atau",
//                         style: TextStyle(
//                           fontSize: 14,
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: Divider(
//                         thickness: 1,
//                         color: Color.fromARGB(255, 240, 240, 240),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(top: 12),
//                 child: TextFormField(
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Masukkan alamat email atau nomor ponsel Anda';
//                     }
//                     return null;
//                   },
//                   controller: _emailController,
//                   focusNode: _emailFocusNode,
//                   keyboardType: TextInputType.emailAddress,
//                   cursorColor: Colors.black,
//                   decoration: InputDecoration(
//                     labelText: "Email atau Telepon",
//                     labelStyle:
//                     TextStyle(color: Color.fromARGB(255, 152, 152, 152)),
//                     enabledBorder: UnderlineInputBorder(
//                       borderSide:
//                       BorderSide(color: Color.fromARGB(255, 140, 140, 140)),
//                     ),
//                     focusedBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(
//                           color: Color.fromARGB(255, 102, 102, 102), width: 2),
//                     ),
//                     errorText: _emailError,
//                     errorBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Colors.red, width: 2),
//                     ),
//                     focusedErrorBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Colors.red, width: 2),
//                     ),
//                   ),
//                 ),
//               ),
//               TextFormField(
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Masukkan kata sandi';
//                   }
//                   return null;
//                 },
//                 controller: _passwordController,
//                 focusNode: _passwordFocusNode,
//                 obscureText: _isObscure,
//                 cursorColor: Colors.black,
//                 decoration: InputDecoration(
//                   labelText: "Kata Sandi",
//                   labelStyle:
//                   TextStyle(color: Color.fromARGB(255, 152, 152, 152)),
//                   enabledBorder: UnderlineInputBorder(
//                     borderSide:
//                     BorderSide(color: Color.fromARGB(255, 140, 140, 140)),
//                   ),
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Color.fromARGB(255, 102, 102, 102),
//                       width: 2,
//                     ),
//                   ),
//                   errorText: _passwordError,
//                   errorBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Colors.red, width: 2),
//                   ),
//                   focusedErrorBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Colors.red, width: 2),
//                   ),
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       color: Colors.black,
//                       _isObscure ? Icons.visibility : Icons.visibility_off,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _isObscure = !_isObscure;
//                       });
//                     },
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(top: 8),
//                 child: Row(
//                   children: [
//                     Row(
//                       children: [
//                         SizedBox(
//                           height: 24.0,
//                           width: 24.0,
//                           child: Checkbox(
//                             value: _isChecked,
//                             activeColor: Color.fromARGB(255, 4, 118, 81),
//                             onChanged: (bool? value) {
//                               setState(() {
//                                 _isChecked = value ?? false;
//                               });
//                             },
//                           ),
//                         ),
//                         Container(
//                             margin: EdgeInsets.only(left: 5),
//                             child: Text(
//                               'Ingat saya.',
//                               style: TextStyle(
//                                 fontSize: 16,
//                               ),
//                             )),
//                       ],
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(left: 5),
//                       child: TextButton(
//                         style: ButtonStyle(
//                           padding: WidgetStateProperty.all<EdgeInsets>(
//                               EdgeInsets.zero),
//                         ),
//                         onPressed: () {},
//                         child: Text(
//                           'Pelajari lebih lanjut',
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: Color.fromARGB(255, 17, 106, 196),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Row(
//                 children: [
//                   TextButton(
//                       style: ButtonStyle(
//                         padding: WidgetStateProperty.all<EdgeInsets>(
//                             EdgeInsets.zero),
//                       ),
//                       onPressed: () {},
//                       child: Text(
//                         "Lupa kata sandi?",
//                         style:
//                         TextStyle(color: Color.fromARGB(255, 17, 106, 196)),
//                       )),
//                 ],
//               ),
//               ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                       backgroundColor: Color.fromARGB(255, 10, 102, 194),
//                       padding: EdgeInsets.all(8),
//                       foregroundColor: Color.fromARGB(255, 0, 65, 130)),
//                   onPressed: () {
//                     setState(() {
//                       _force = true;
//                     });
//                     _validateEmail();
//                     _validatePassword();
//                     if (_formKey.currentState!.validate()) {}
//                   },
//                   child: Text(
//                     "Lanjutkan",
//                     style: TextStyle(fontSize: 20, color: Colors.white),
//                   ))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

