import 'package:flutter/material.dart';
import 'package:qr/core/helper/custom_text_field.dart';



class Login extends StatefulWidget {
  final TextEditingController? email;
  final TextEditingController? password;

  const Login({super.key, this.email, this.password});

  @override
  State<Login> createState() => _LoginState();
}

bool obscureText = true;

class _LoginState extends State<Login> {
  



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller:widget.email!,
          hint: 'Enter your Email',
          labelText: 'Enter your Email',
          validator: (value){
            if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
     String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  },
          
        ),
        SizedBox(height: 20),
        CustomTextField(
          controller:widget.password!,
          hint: 'Enter your password',
          labelText: 'Enter your password',
          isPassword: true,
          suffix: Icon(Icons.remove_red_eye),
          validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length <8) {
      return 'Password must be at least 6 characters';
    }
    return null;
          },
        ),
      ],
    );
  }
}
