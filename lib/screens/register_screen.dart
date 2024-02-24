import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hg_task/model/user_information.dart';
import 'package:hg_task/screens/home_screen.dart';
import 'package:hg_task/screens/login_screen.dart';
import 'package:hg_task/utils/strings.dart';
import 'package:hg_task/view_model/register_view_model.dart';

import '../components/custom_elevated_button.dart';
import '../components/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final RegisterViewModel _viewModel = RegisterViewModel();
  final TextEditingController _nameSurnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  DateTime dateTime = DateTime.now();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null) {
      setState(() {
        dateTime = picked;
        _dateController.text = dateTime.toString();
      });
    }
  }

  Future<void> handleButton() async {
    UserInformation info = UserInformation(
        "",
        _nameSurnameController.text,
        _emailController.text,
        Timestamp.fromDate(dateTime),
        _bioController.text, []);
    bool isSuccess = await _viewModel.register(info, _passwordController.text);
    if (isSuccess && mounted) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                  textEditingController: _nameSurnameController,
                  hint: Strings.nameSurname),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                  textEditingController: _bioController, hint: Strings.bio),
              const SizedBox(
                height: 10,
              ),
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
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                        textEditingController: _dateController,
                        hint: Strings.date),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: () => selectDate(context),
                    icon: const Icon(Icons.date_range_outlined),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              CustomElevatedButton(
                  onClick: () => handleButton(), text: Strings.register)
            ],
          ),
        ),
      ),
    );
  }
}
