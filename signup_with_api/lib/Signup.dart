import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String email , password) async{
    try {
      Response response = await post(
        Uri.parse('https://reqres.in/api/register'),
        body:{
          'email':email,
          'password':password,
        } 
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);
        print("account created successfully");
      }else{
        print("failed");
      }
    } catch (e) {
      print(e.toString());
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade200,
        title: Text("Sign Up API"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email'
              ),
            ),
        
            SizedBox(height: 20,),
        
             TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'Password'
              ),
            ),
             SizedBox(height: 40,),
             GestureDetector(
              onTap: () {
                login(emailController.text.toString(),passwordController.text.toString());
              },
               child: Container(
                 height: 50,
                 decoration: BoxDecoration(
                  color: Colors.blueGrey.shade300,
                  
                  borderRadius: BorderRadius.circular(10),
                ),
                 child: Text('SignUp'),
               ),
             )
          ],
        ),
      ),
    );
  }
}