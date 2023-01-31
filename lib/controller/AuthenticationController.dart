import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AuthController extends GetxController {
  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  AuthController();
}
