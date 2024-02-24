import 'package:flutter/material.dart';
import 'package:hg_task/components/custom_elevated_button.dart';
import 'package:hg_task/components/custom_text_field.dart';
import 'package:hg_task/screens/home_screen.dart';
import 'package:hg_task/screens/register_screen.dart';
import 'package:hg_task/view_model/login_view_model.dart';

import '../utils/strings.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginViewModel _viewModel = LoginViewModel();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> handleButton() async {
    bool isSuccess = await _viewModel.signIn(
        _emailController.text, _passwordController.text);
    if (isSuccess && mounted) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(email: _emailController.text),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
                textEditingController: _emailController, hint: Strings.email),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
                textEditingController: _passwordController,
                hint: Strings.password),
            const SizedBox(
              height: 10,
            ),
            CustomElevatedButton(
                onClick: () => handleButton(), text: Strings.login),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(Strings.dontHaveAccount),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      )),
                  child: const Text(
                    Strings.register,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
