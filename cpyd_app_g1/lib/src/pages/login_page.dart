import 'package:cpyd_app_g1/src/pages/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

/* Iniciar sesión */
class InicioSesion extends StatelessWidget {
  const InicioSesion({super.key});

  Widget background(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: Column(
          children: [
            Expanded(
                child: Center(
              child: SizedBox(
                height: 50,
                child: SignInButton(
                  Buttons.Google,
                  elevation: 5,
                  text: 'Iniciar sesión',
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () => VoterService.login(context),
                ),
              ),
            )),
          ],
        ));
  }
}
