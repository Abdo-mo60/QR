import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qr/core/helper/custom_button.dart';
import 'package:qr/core/utlis/router.dart';
import 'package:qr/core/utlis/style.dart';
import 'package:qr/featuer/forgetpassword/presentation/widget/text_forget_password.dart';

import 'package:qr/featuer/login/presentation/components/login_form_component.dart';

import 'package:qr/featuer/login/presentation/widget/heder_login_widget.dart';

class LoginHome extends StatefulWidget {
  const LoginHome({super.key});

  @override
  State<LoginHome> createState() => _LoginHomeState();
}

class _LoginHomeState extends State<LoginHome> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void initState() {
    super.initState();
    _checkLogin();
  }

  void _checkLogin() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      context.go(AppRouter.kScanqr);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,

          child: Column(
            children: [
              HederScrenWidget(text: 'Login'),
              SizedBox(height: 100),
              Login(email: email, password: password),
              SizedBox(height: 24),
              ForgetPassword(),
              SizedBox(height: 32),
              CustomButton(
                text: 'Login',
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      print('Email: ${email.text}, Password: ${password.text}');
                      await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                            email: email.text,
                            password: password.text,
                          )
                          .then((value) {
                            FirebaseFirestore.instance
                                .collection('users')
                                .doc(value.user!.uid);
                            context.go(AppRouter.kScanqr);
                          });
                    } on FirebaseAuthException catch (e) {
                      showDialog(
                        context: context,
                        builder: (c) {
                          return AlertDialog(
                            content: Text(e.message.toString()),
                          );
                        },
                      );
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(e.toString())));
                      if (e.code == 'user-not-found') {
                        print('No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        print('Wrong password provided for that user.');
                      }
                    }
                  }
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Dont\' Have An Acount ? ', style: Styles.textStyle14),
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kRegister);
                    },
                    child: Text(
                      ' Register',
                      style: Styles.textStyle14.copyWith(
                        color: Styles.kPrimaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
