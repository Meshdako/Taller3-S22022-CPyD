import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:cpyd_app_g1/service/voter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Image(
            image: AssetImage('lib/assets/images/App_Flutter.png'),
            fit: BoxFit.cover,
            height: 1200,
          ),
          Expanded(
              child: Center(
            child: TextButton(
              onPressed: () => VoterService.login(context),
              child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Color(0xff4285f4), width: 1, ),
                boxShadow: const [
              BoxShadow(
                color: Color(0xff4285f4),
                blurRadius: 0,
                offset: Offset(0, 4),
              ),
                ],
                    color: Colors.white,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14, ),
                child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:[
                        SizedBox(
                            width: 20,
                            height: 20,
                            child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children:[
                                    Container(
                                        width: 19.60,
                                        height: 20,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: const Image(
                                          image: AssetImage('lib/assets/Icons/google.png'),
                                        ),
                                    ),
                                ],
                            ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                            "Ingresar con Correo UTEM",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: "Helvetica Neue",
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.50,
                            ),
                        ),
                    ],
                ),
            ),
            ),
          ),
          ),
        ],
      ),
    );
  }
}
