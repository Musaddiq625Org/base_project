import 'package:base_project/components/text_component.dart';
import 'package:base_project/src/constants/string_constants.dart';
import 'package:flutter/material.dart';

class LoginSelectionScreen extends StatefulWidget {
  const LoginSelectionScreen({Key? key}) : super(key: key);

  @override
  State<LoginSelectionScreen> createState() => _LoginSelectionScreenState();
}

class _LoginSelectionScreenState extends State<LoginSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextComponent("Login"),
      ),
      body: const Center(
        child: Text('LoginScreen'),
      ),
    );
  }
}
