import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_flutter_auth_with_bloc/core/theme/app_palette.dart';
import 'package:learn_flutter_auth_with_bloc/features/auth/presentation/widgets/auth_field.dart';
import 'package:learn_flutter_auth_with_bloc/features/auth/presentation/widgets/auth_button.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final firstNameController = TextEditingController(); //to access 
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() { //all controller must dispose
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sign Up",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
          
              AuthField(hintText: 'First Name', controller: firstNameController,),
              SizedBox(height: 15),
          
              AuthField(hintText: 'Last Name', controller: lastNameController,),
              SizedBox(height: 15),
          
              AuthField(hintText: 'Email', controller: emailController,),
              SizedBox(height: 15),
          
              AuthField(hintText: 'Password', controller: passwordController, isObscureText: true,),
              SizedBox(height: 20),
          
              AuthButton(buttonText: "Sign Up",),
              SizedBox(height: 15),
          
              GestureDetector(
                onTap: () {
                  context.go('/signin');
                },
                child: RichText(
                  text: TextSpan(
                    text: 'Already have and account?',
                    style: Theme.of(context).textTheme.titleMedium,
                    children: [
                      TextSpan(
                        text: ' Sign In',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppPalette.blueColor,
                          fontWeight: FontWeight.bold
                        )
                      )
                    ]
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
