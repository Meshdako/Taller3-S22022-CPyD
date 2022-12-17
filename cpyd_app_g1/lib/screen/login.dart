import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:cpyd_app_g1/service/voter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Stack(
            children: [
              const Image(
                image: AssetImage('lib/assets/images/App_Flutter.png'),
                fit: BoxFit.cover,
                height: 1200,
              ),
              Expanded(
                  child: Center(
                child: SizedBox(
                  height: 50,
                  child: SignInButton(
                    Buttons.Google,
                    elevation: 5,
                    text: 'Login UTEM',
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () => VoterService.login(context),
                  ),
                ),
              ))
            ],
          ),
        )
      ],
    );
  }
}
