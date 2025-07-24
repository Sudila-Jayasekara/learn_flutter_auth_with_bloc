import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_flutter_auth_with_bloc/core/theme/app_palette.dart';
import 'package:learn_flutter_auth_with_bloc/features/auth/presentation/widgets/auth_field.dart';
import 'package:learn_flutter_auth_with_bloc/features/auth/presentation/widgets/auth_button.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sign In",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),

              AuthField(hintText: 'Email', controller: emailController),
              SizedBox(height: 15),

              AuthField(
                hintText: 'Password',
                controller: passwordController,
                isObscureText: true,
              ),
              SizedBox(height: 20),

              AuthButton(buttonText: "Sign In",),
              SizedBox(height: 15),

              GestureDetector(
                onTap: () {
                  context.go('/signup');
                },
                child: RichText(
                  text: TextSpan(
                    text: 'Don\'t have and account?',
                    style: Theme.of(context).textTheme.titleMedium,
                    children: [
                      TextSpan(
                        text: ' Sign Up',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppPalette.blueColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
