import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:register1/model/profile.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile(email: '', password: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("สร้างบัญชีผู้ใช้"),
        ),
        // ignore: avoid_unnecessary_containers
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "อีเมล",
                        style: TextStyle(fontSize: 20),
                      ),
                      TextFormField(
                        validator:
                            MultiValidator([
                              RequiredValidator(errorText: "กรุณาใส่อีเมลด้วย"),
                              EmailValidator(errorText: "รูปแบบอีเมลไม่ถูกต้อง")
                            ]),
                        keyboardType: TextInputType.emailAddress,
                        onSaved: <String>(email) {
                          profile.email = email;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "รหัสผ่าน",
                        style: TextStyle(fontSize: 20),
                      ),
                      TextFormField(
                        validator:
                            RequiredValidator(errorText: "กรุณาโปรดใส่รหัสผ่าน"),
                        obscureText: true,
                        onSaved: <String>(password) {
                          profile.password = password;
                        },
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            child: const Text("ลงทะเบียน",
                                style: TextStyle(fontSize: 20)),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState?.save();
                                if (kDebugMode) {
                                  print(
                                      "email = ${profile.email} password = ${profile.password}");
                                }
                                formKey.currentState?.reset();
                              }
                            }),
                      ),
                    ],
                  ),
                )),
          ),
        ));
  }
}
