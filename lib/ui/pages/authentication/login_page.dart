import 'package:diptrac_user/data/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../../data/user_dao.dart';
import '../../../data/location_model.dart';
class LoginPage extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: DiptracPages.loginPath,
      key: ValueKey(DiptracPages.loginPath),
      child: const LoginPage(),
    );
  }

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userDao = Provider.of<UserDao>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diptrac'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(height: 80),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: 'Email Address',
                      ),
                      autofocus: false,
                      keyboardType: TextInputType.emailAddress,
                      textCapitalization: TextCapitalization.none,
                      autocorrect: false,
                      controller: _emailController,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Email Required';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(height: 20),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: 'Password',
                      ),
                      autofocus: false,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      textCapitalization: TextCapitalization.none,
                      autocorrect: false,
                      controller: _passwordController,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Password Required';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  const SizedBox(height: 20),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        userDao.login(_emailController.text.trim(),
                            _passwordController.text.trim());
                      },
                      child: const Text('Login'),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(height: 20),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        userDao.signup(
                          _emailController.text.trim(),
                          _passwordController.text.trim(),
                        );
                      },
                      child: const Text('Sign Up'),
                    ),
                  ),
                  const SizedBox(height: 60),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
