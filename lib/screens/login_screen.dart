
import 'package:flutter/material.dart';
import 'package:my_music/screens/home_screen.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  //Creates a controller for an editable text field.
  TextEditingController usernameController= TextEditingController();
  TextEditingController emailController= TextEditingController();
  TextEditingController passwordController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
              colors: [Color.fromARGB(255, 36, 131, 210), Colors.black, Color.fromARGB(255, 95, 153, 200)],
              begin:Alignment.topRight,
              end:Alignment.bottomLeft,
                )
            ),
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/listen.png',
                    width: 200,
                    height: 200,
                  ),
              
                  const SizedBox(height: 10,),
              
                  const Text(
                  'Welcome To My Music',
                  style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                  fontSize: 32,
                ),
                  ),
              
                  const SizedBox(height: 10,),
                  _inputField("Username",usernameController),
              
                  const SizedBox(height: 10,),
              
                  _inputField("Email",emailController),
              
                  const SizedBox(height: 10,),
              
                  _inputField("Password",passwordController, isPassword: true),
        
                  const SizedBox(height: 10,),
        
                  _loginBtn(),
                ],
              ),
            ),
          ),
      )
      );
    
  }

  Widget _inputField(String hintText, TextEditingController controller, {isPassword=false}){
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: const BorderSide(color: Colors.white)
    );

    return TextField(
      style: const TextStyle(
        color: Colors.white),
        controller:controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white),
          enabledBorder: border,
          focusedBorder: border,

        ),
        obscureText: isPassword,
        
      
    );
  }

    Widget _loginBtn(){
    return ElevatedButton(
      onPressed: () {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context)=>HomePage())
        );

      // Show welcome dialog after navigation
      WidgetsBinding.instance.addPostFrameCallback((_) => showWelcomeDialog(context));
    },

        child: const Text(
          'Login',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
          ),

      );
  }


void showWelcomeDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // Build the welcome dialog content
      return AlertDialog(
        title: Text("Welcome ${usernameController.text}"),
        content: const Text('You have successfully logged in.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}

}