import 'package:flutter/material.dart';
import 'package:myapp/utlx/routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/undraw_Mobile_login_re_9ntv.png",
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Enter username", labelText: "username"),
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: "Enter password", labelText: "password"),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, MyRoute.homeRoute);
                      },
                      style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                      child: const Text('Login'),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

// Center(
//         child: const Text(
//           'Login Page',
//           style: TextStyle(
//             fontSize: 20,
//             color: Colors.deepPurple,
//             fontWeight: FontWeight.bold,
//           ),
//           textScaleFactor: 2,
//         ),
//       ),