import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Column(
          children: [
            Image.asset(
              "assets/images/undraw_Mobile_login_re_9ntv.png",
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Welcome",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter username", labelText: "username"),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Enter password", labelText: "password"),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print("logged in");
                    },
                    child: Text('Login'),
                    style: TextButton.styleFrom(),
                  )
                ],
              ),
            )
          ],
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