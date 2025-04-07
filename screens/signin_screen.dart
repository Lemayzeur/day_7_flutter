import "package:flutter/material.dart";
import "../service/api.dart";

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen>{

  final formKey = GlobalKey<FormState>();

  TextEditingController emailInput = TextEditingController();
  TextEditingController passwordInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
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
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text("Submit"),
                  onPressed: () {
                    print("Submit");
                    if(formKey.currentState!.validate()) { 
                      print("Here");
                      Map? foundUser = null;

                      for(Map user in data['users']) {
                        if(user['email'] == emailInput.text && user['password'] == passwordInput.text) {
                          print(foundUser);
                          foundUser = user;
                          break;
                        }
                      };

                      if(foundUser != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Welcome ${foundUser['first_name']}!"),
                          )
                        );
                      } else {
                        print("Emaill or password incorrect!");
                      }

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
