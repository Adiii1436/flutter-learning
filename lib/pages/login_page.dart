import 'package:flutter/material.dart';
import 'package:myapp/utlx/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = '';
  bool changeButton = false;

  final _formkey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });

      await Future.delayed(const Duration(seconds: 1));
      await context.vxNav.push(Uri.parse(MyRoute.homeRoute));
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: context.canvasColor,
        child: SingleChildScrollView(
            child: Form(
          key: _formkey,
          child: Column(
            children: [
              Image.asset(
                "assets/images/undraw_Mobile_login_re_9ntv.png",
                fit: BoxFit.fitWidth,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                "Welcome $name",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: context.accentColor,
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
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "username cannot be empty";
                        }

                        return null;
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: "Enter password", labelText: "password"),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "password cannot be empty";
                        } else if (value.length < 6) {
                          return "password length must be atleast 6";
                        }

                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    Material(
                      color: Vx.blue400,
                      borderRadius:
                          BorderRadius.circular(changeButton ? 50 : 8),
                      child: InkWell(
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          width: changeButton ? 50 : 150,
                          height: 50,
                          alignment: Alignment.center,
                          child: changeButton
                              ? const Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : const Text(
                                  'login',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )));
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


                    // ElevatedButton(
                    //   onPressed: () {
                    //     Navigator.pushNamed(context, MyRoute.homeRoute);
                    //   },
                    //   style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                    //   child: const Text('Login'),
                    // )