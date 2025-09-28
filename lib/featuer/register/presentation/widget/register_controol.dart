import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qr/core/utlis/router.dart';

class RegisterController {
  final formKey = GlobalKey<FormState>();
  final userName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  void dispose() {
    userName.dispose();
    email.dispose();
    password.dispose();
  }

  Future<void> register(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text.trim(),
          password: password.text.trim(),
        ).then((value){
          FirebaseFirestore.instance
              .collection('users')
              .doc(value.user!.uid);
  context.go(AppRouter.kScanqr);

        });
        
      
      } on FirebaseAuthException catch (e) {
        String message = "Something went wrong";
        if (e.code == 'weak-password') {
          message = "The password is too weak";
        } else if (e.code == 'email-already-in-use') {
          message = "This email is already in use";
        }
        _showError(context, message);
      } catch (e) {
        _showError(context, e.toString());
      }
    }
  }

  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }
}
