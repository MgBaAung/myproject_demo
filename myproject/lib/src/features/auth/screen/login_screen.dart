import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproject/src/helper/constants/context_extension.dart';

import '../controller/auth_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final authController = Get.find<AuthController>();

  bool _obscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Welcome!'),
              const SizedBox(
                height: 61,
              ),
              TextFormField(
                autofocus: true,
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'Enter Email',
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter email';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                obscureText: _obscured,
                controller: passwordController,
                decoration: InputDecoration(
                  label: const Text('Password'),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscured = !_obscured;
                      });
                    },
                    icon: Icon(
                      _obscured ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                  hintText: 'Enter Password ',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter password';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 79,
              ),
              Obx(
                () {
                  final isloading = authController.isLoading.value;
                  final errorMsg = authController.errorMessage.value;
                  if (mounted && errorMsg.isNotEmpty) {
                    context.showErrorSnackbar(errorMsg);
                  }
                  return MaterialButton(
                    color: Colors.blue,
                    onPressed: isloading
                        ? () {}
                        : () {
                            if (_formKey.currentState!.validate()) {
                              authController.login(
                                name: nameController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                    child: isloading
                        ? const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                          )
                        : const Text('Submit'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
