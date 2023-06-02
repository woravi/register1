import 'package:flutter/material.dart';
import 'package:register1/screen/login.dart';
import 'package:register1/screen/register.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Register/login"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.asset("assets/images/profile.jpg"),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.add),
                    label: const Text(
                      "สร้างบัญชีผู้ใช้",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return const RegisterScreen();
                        }),
                      );
                    },
                  )),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.login),
                    label: const Text(
                      "เข้าสู่ระบบ",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return const LoginScreen();
                        }),
                      );
                    },
                  )),
            ],
          ),
        ));
  }
}
