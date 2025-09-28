import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qr/core/helper/custom_button.dart';
import 'package:qr/core/helper/custom_text_field.dart';
import 'package:qr/core/utlis/router.dart';
import 'package:qr/core/utlis/style.dart';
import 'package:qr/core/utlis/validoter.dart';
import 'package:qr/featuer/login/presentation/widget/heder_login_widget.dart';

import 'package:qr/featuer/register/presentation/widget/register_controol.dart';

class RegisterHome extends StatefulWidget {
  const RegisterHome({super.key});

  @override
  State<RegisterHome> createState() => _RegisterHomeState();
}

class _RegisterHomeState extends State<RegisterHome> {
  final controller = RegisterController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              const HederScrenWidget(text: 'Register'),
              const SizedBox(height: 100),

              CustomTextField(
                controller: controller.userName,
                hint: 'Enter your User Name',
                labelText: 'User Name',
                validator: Validators.userName,
              ),
              const SizedBox(height: 20),

              CustomTextField(
                controller: controller.email,
                hint: 'Enter your Email',
                labelText: 'Email',
                validator: Validators.email,
              ),
              const SizedBox(height: 20),

              CustomTextField(
                controller: controller.password,
                hint: 'Enter your Password',
                labelText: 'Password',
                isPassword: true,
                validator: Validators.password,
              ),

              const SizedBox(height: 30),

              CustomButton(
                text: "Register",
                onPressed: () => controller.register(context),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Have an account? ', style: Styles.textStyle14),
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kLoginView);
                    },
                    child: Text(
                      'Login',
                      style: Styles.textStyle14.copyWith(
                        color: Styles.kPrimaryColor,
                        fontWeight: FontWeight.bold,
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
