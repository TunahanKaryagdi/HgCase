import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hg_task/components/custom_text_field.dart';
import 'package:hg_task/components/custom_user.card.dart';
import 'package:hg_task/model/user_information.dart';
import 'package:hg_task/screens/login_screen.dart';
import 'package:hg_task/utils/strings.dart';
import 'package:hg_task/view_model/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.email});

  final String email;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeViewModel _viewModel = HomeViewModel();
  final TextEditingController _newHobbyController = TextEditingController();
  UserInformation? userInfos;

  @override
  void initState() {
    super.initState();
    _getUserInfos();
  }

  Future<void> _getUserInfos() async {
    userInfos = await _viewModel.getUserInfos(widget.email);
    setState(() {});
  }

  Future<void> logout() async {
    await _viewModel.logout();
    if (!mounted) return;
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ));
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(Strings.newHobby),
          content: CustomTextField(
              textEditingController: _newHobbyController,
              hint: Strings.newHobby),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(Strings.close),
            ),
            TextButton(
              onPressed: () async {
                await _viewModel.addNewHobby(
                    userInfos!, _newHobbyController.text);
                await _getUserInfos();
                if (mounted) Navigator.of(context).pop();
              },
              child: const Text(Strings.ok),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.home),
        actions: [
          IconButton(
              onPressed: () async => await logout(),
              icon: const Icon(Icons.logout))
        ],
      ),
      body: userInfos == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomUserCard(
                    user: userInfos!,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                        onTap: () => _showDialog(context),
                        child: const Icon(Icons.add_box)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    Strings.hobbies,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ...userInfos!.hobbies.map((e) => Text(e)).toList()
                ],
              ),
            ),
    );
  }
}
