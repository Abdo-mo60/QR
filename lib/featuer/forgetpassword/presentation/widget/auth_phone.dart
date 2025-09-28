import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:qr/core/helper/custom_button.dart';
import 'package:qr/featuer/forgetpassword/presentation/widget/chang_password.dart';

class PhoneAuthPage extends StatefulWidget {
  const PhoneAuthPage({super.key});

  @override
  State<PhoneAuthPage> createState() => _PhoneAuthPageState();
}

class _PhoneAuthPageState extends State<PhoneAuthPage> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  String verificationId = "";
  bool codeSent = false;


  String formatPhoneNumber(String phone) {
    phone = phone.trim();
    if (phone.startsWith("0")) {
  
      return "+2$phone";
    } else if (!phone.startsWith("+")) {
  
      return "+2$phone"; 
    }
    return phone;
  }

  Future<void> _sendCode() async {
    String phone = formatPhoneNumber(phoneController.text);

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? "فشل الإرسال")),
        );
      },
      codeSent: (String verId, int? resendToken) {
        setState(() {
          verificationId = verId;
          codeSent = true;
        });
      },
      codeAutoRetrievalTimeout: (String verId) {
        verificationId = verId;
      },
    );
  }

  Future<void> _verifyCode() async {
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otpController.text.trim(),
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const ChangePasswordPage()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("الكود غير صحيح")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Change Password")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            if (!codeSent) ...[
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: "Enter your phone number",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 20),
              CustomButton(text: 'Send Code', onPressed: _sendCode),
            ] else ...[
              TextField(
                controller: otpController,
                decoration: const InputDecoration(
                  labelText: "Enter the code",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              CustomButton(text: 'Verify Code', onPressed: _verifyCode),
           
            ],
          ],
        ),
      ),
    );
  }
}
