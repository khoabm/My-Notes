// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/constant/routes.dart';
import 'package:mynotes/helpers/show_error_dialog.dart';
import 'package:mynotes/services/auth/auth_services.dart';
import 'package:mynotes/services/auth_exceptions.dart';
import 'dart:developer' as devtools show log;

import '../helpers/toast.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                controller: _email,
                enableSuggestions: false,
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(
                  hintText: 'Enter your email here',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                controller: _password,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: const InputDecoration(
                  hintText: 'Enter your password here',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              child: const Text('Register'),
              onPressed: () async {
                try {
                  final email = _email.text;
                  final password = _password.text;
                  await AuthService.firebase().createUser(
                    email: email,
                    password: password,
                  );

                  await AuthService.firebase().sendEmailVerification();
                  // devtools.log(userCredential.toString());
                  Navigator.of(context).pushNamed(verifyEmailRoutes);
                } on WeakPasswordAuthException {
                  showError(
                    'Weak password',
                    context,
                  );
                } on InvalidEmailAuthException {
                  showError(
                    'Invalid Email',
                    context,
                  );
                } on EmailAlreadyInUseAuthException {
                  showError(
                    'Email already in use',
                    context,
                  );
                } on GenericAuthException {
                  showErrorDialog(
                    context,
                    'Failed to register',
                  );
                }
              },
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  loginRoute,
                  (route) => false,
                );
              },
              child: const Text('Already registered? Login here'),
            ),
          ],
        ),
      ),
    );
  }
}
