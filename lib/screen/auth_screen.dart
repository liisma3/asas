import 'package:asas/screen/email_pass_screen.dart';
import 'package:asas/widgets/auth_button.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Select Auth Provider",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              AuthButton(
                  iconData: Icons.email,
                  title: "Email/Password",
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const EmailPassScreen()));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
