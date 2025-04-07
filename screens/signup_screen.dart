import "package:flutter/material.dart";
import "../service/api.dart";
import "./signin_screen.dart";

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen>{

  final formKey = GlobalKey<FormState>();

  TextEditingController fullnameInput = TextEditingController();
  TextEditingController emailInput = TextEditingController();
  TextEditingController passwordInput = TextEditingController();
  TextEditingController confirmPasswordInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: fullnameInput,
                style: TextStyle(
                  // fontSize: 14.0,
                  //color: Colors.red,
                ),
                decoration: InputDecoration(
                  hintText: "Enter your full name"
                ),
                validator: (value) { 
                  if(value == null || value.isEmpty) {
                    return 'Chan sa obligatwa';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: emailInput,
                style: TextStyle(
                  // fontSize: 14.0,
                  //color: Colors.red,
                ),
                decoration: InputDecoration(
                  hintText: "Enter your email"
                ),
                validator: (value) { 
                  if(value == null || value.isEmpty) {
                    return 'Chan sa obligatwa';
                  }
                  else if (!value.endsWith('esih.edu')) {
                    return "Only esih domain emails allowed";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: passwordInput,
                decoration: InputDecoration(
                  hintText: "Enter your password"
                ),
                obscureText: true,
                validator: (value) { 
                  if(value == null || value.isEmpty) {
                    return 'Chan sa obligatwa';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: confirmPasswordInput,
                decoration: InputDecoration(
                  hintText: "Confirm your password"
                ),
                obscureText: true,
                validator: (value) { 
                  if(value == null || value.isEmpty) {
                    return 'Chan sa obligatwa';
                  }
                  else if (passwordInput.text != value) {
                    return 'Konfimasyon modpas la pa menm';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text("Submit"),
                  onPressed: () {
                    if(formKey.currentState!.validate()) { 
                      String firstName = fullnameInput.text.split(' ')[0];
                      String lastName = fullnameInput.text.split(' ')[1];

                      Map<String, String> user = {
                        "first_name": firstName,
                        "last_name": lastName,
                        "email": emailInput.text,
                        "password": passwordInput.text,
                      };

                      data['users'].add(user);
                      

                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(
                        builder: (ctx) {
                          return SigninScreen();
                        }
                      ));

                    } else {
                      print("Form nan pa valid!!!");

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Form nan pa valid!!!"),
                        )
                      );
                    }
                  },
                ),
              )
            ]
          )
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
