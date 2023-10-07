import 'package:flutter/material.dart';

import '../home/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginCtl = TextEditingController();
  final passCtl = TextEditingController();

  static const userEmail = 'it_app@gmail.com';
  static const userPassword = 'it2023.bishkek';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: const Key('Login-AppBar'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            const SizedBox(height: 40),
            TextFormField(
              controller: loginCtl,
              key: const Key('login-email-feild'),
              decoration: InputDecoration(
                filled: true,
                hintText: 'app_it@gmail.com',
                fillColor: Theme.of(context).colorScheme.primaryContainer,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: passCtl,
              key: const Key('login-password-feild'),
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                hintText: '****',
                fillColor: Theme.of(context).colorScheme.primaryContainer,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              key: const Key('login-button'),
              onPressed: () {
                if (loginCtl.text == userEmail && passCtl.text == userPassword) {
                  Navigator.pushAndRemoveUntil<void>(
                    context,
                    MaterialPageRoute<void>(builder: (context) => const HomePage()),
                    (route) => false,
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        key: const Key('account-incorrect-dialog'),
                        title: const Text('Error!'),
                        content: const Text('Your login or password is incorrect'),
                        actions: [
                          TextButton(
                            key: const Key('login-again-bitton'),
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Again'),
                          )
                        ],
                      );
                    },
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(double.maxFinite, 50),
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Login'),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
