import 'package:flutter/material.dart';
import 'package:login/Functions/user.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool isLogin = false;
  String email = '';
  String pass = '';
  String uname = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          "Login Page",
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Form(
          key: formkey, // Assign formkey to the key property of Form
          child: Container(
            height: 600,
            width: 400,
            color: const Color.fromARGB(255, 218, 122, 154),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                !isLogin
                    ? TextFormField(
                        key: const ValueKey('name'),
                        decoration: const InputDecoration(
                          hintText: "User Name",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username is required";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          setState(() {
                            uname = value!;
                          });
                        },
                      )
                    : Container(),
                const SizedBox(height: 20),
                TextFormField(
                  key: const ValueKey('email'),
                  decoration: const InputDecoration(
                    hintText: "Email Id",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email is required";
                    } else if (!value.contains('@')) {
                      return "Invalid Email";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      email = value!;
                    });
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  key: const ValueKey('pass'),
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "Pass Word",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password is required";
                    } else if (value.length < 7) {
                      return "Password is Too Small";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      pass = value!;
                    });
                  },
                ),
                const SizedBox(height: 100),
                ElevatedButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      formkey.currentState!.save();
                      isLogin ? signin(email, pass) : signup(email, pass);
                    }
                  },
                  child: isLogin ? const Text("Log in") : const Text("Sign Up"),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      isLogin = !isLogin;
                    });
                  },
                  child: isLogin
                      ? const Text("New User Sign Up")
                      : const Text("Already Signed Up? Click Here"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
