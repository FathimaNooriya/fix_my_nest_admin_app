import 'package:flutter/material.dart';

import 'admin_signup_screen.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AdminSignUpScreen()));
          },
          splashColor: const Color.fromARGB(255, 2, 88, 47),
          radius: 200,
          child: const CircleAvatar(
            radius: 150,
            backgroundColor: Colors.greenAccent,
            child: FittedBox(
                fit: BoxFit.fill,
                child: Image(image: AssetImage("images/fixmynest_logo.png"))),
          ),
        ),
      ),
    );
  }
}
