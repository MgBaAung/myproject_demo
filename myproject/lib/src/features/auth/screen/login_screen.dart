import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:myproject/src/helper/constants/app_color.dart';
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
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.h),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Text(
                      'Welcome!',
                      style: TextStyle(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 61.h,
                  ),
                  Text(
                    "Email",
                    style: TextStyle(
                      color: AppColors.labelTextColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextFormField(
                    autofocus: true,
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: "pranton.work@gmail.com",
                      hintStyle: TextStyle(
                        fontSize: 15.sp,
                        color: AppColors.hintTextColor,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.textFieldBorderColor),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Text(
                    "Password",
                    style: TextStyle(
                      color: AppColors.labelTextColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextFormField(
                    obscureText: _obscured,
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: "・・・・・・・・",
                      hintStyle: TextStyle(
                        fontSize: 15.sp,
                        color: AppColors.hintTextColor,
                      ),
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
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.textFieldBorderColor),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 79.h,
                  ),
                  Obx(
                    () {
                      final isloading = authController.isLoading.value;
                      final errorMsg = authController.errorMessage.value;
                      if (mounted && errorMsg.isNotEmpty) {
                        context.showErrorSnackbar(errorMsg);
                      }
                      return SizedBox(
                        width: double.infinity,
                        child: MaterialButton(
                          height: 41.h,
                          color: AppColors.primaryColor,
                          shape: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(5),
                          ),
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
                              : Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
