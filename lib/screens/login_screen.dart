import 'package:chips_practice/helpers/auth_helper.dart';
import 'package:chips_practice/models/login_cred_model.dart';
import 'package:chips_practice/screens/signup_screen.dart';
import 'package:chips_practice/widgets/custom_text_from_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final LoginCredModel _loginCredModel = LoginCredModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Column(
                children: [
                  CustomTextFromField(
                    onSaved: (newValue) => _loginCredModel.email = newValue,
                    label: "Email",
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your email";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFromField(
                    label: "Password",
                    validator: (value) {
                      value!.length < 8 ? "Please enter your email" : null;
                    },
                    onSaved: (newValue) => _loginCredModel.password = newValue,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();

                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Logging in')));

                          try {
                            bool result = await AuthHelper.instance
                                .loginEmailPassword(_loginCredModel.email!,
                                    _loginCredModel.password!);

                            if (result) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Logging in')));
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(e.toString())));
                          }
                        }
                      },
                      child: Text("Login")),
                  InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => SignUpScreen()));
                      },
                      child: Text("Don't have an account? Sign Up"))
                ],
              ),
            ),
          )),
    );
  }
}
