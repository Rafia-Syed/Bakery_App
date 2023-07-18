import 'package:flutter/material.dart';
import 'package:username_validator/username_validator.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:bakery_app/screens/description_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController usernameCtrl = TextEditingController();
    TextEditingController emailCtrl = TextEditingController();
    TextEditingController passCtrl = TextEditingController();
    final Size size = MediaQuery.of(context).size;

    
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.white,
        padding: const EdgeInsets.all(18),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Align(
                  alignment: Alignment.topCenter,
                  child: Image(
                    height: 300,
                    width: 320,
                    fit:BoxFit.fill,
                    image: AssetImage("bakeryimg.png"),
                  )),
              const SizedBox(height: 20),
              const Flexible(
                child: Text(
                  'Login to your Account',
                  style: TextStyle(
                      fontSize: 30,
                      color: Color(0xffF88456),
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 20),
              Flexible(
                child: TextFormField(
                  controller: usernameCtrl,
                  validator: (value) {
                    if (!UValidator.validateThis(
                        pattern: RegPattern.strict, username: value!)) {
                      return 'Invalid username';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Username",
                    prefixIcon: const Icon(
                      Icons.person_2_outlined,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Flexible(
                child: TextFormField(
                  controller: emailCtrl,
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Required*'),
                    EmailValidator(errorText: "Enter a valid email*")
                  ]),
                  decoration: InputDecoration(
                    hintText: 'Email',
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Flexible(
                child: TextFormField(
                  controller: passCtrl,
                  obscureText: _obscureText,
                  validator: LengthRangeValidator(
                      min: 8, max: 20, errorText: "Password length must be 8-20"),
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                        onTap: () {
                          setState() {
                            _obscureText = !_obscureText;
                          }
                        },
                        child: Icon(_obscureText
                            ? Icons.visibility
                            : Icons.visibility_off)),
                    hintText: "Password",
                    prefixIcon: const Icon(
                      Icons.password_outlined,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Flexible(
                child: Center(
                  child: SizedBox(
                    height: 56,
                    width: size.width * 0.9,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffF88456),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25))),
                        onPressed: () {
                          if (formKey.currentState!.validate() == true) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const DescriptionScreen()));
                          }
                        },
                        child: const Text(
                          "Sign in",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )),
                  ),
                ),
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
