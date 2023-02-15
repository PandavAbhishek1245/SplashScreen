// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var EmailController = TextEditingController();
  var passwordController = TextEditingController();
  bool ishiddenpassword = false;
  final _formkey =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: Text("FIRE_BASE"),
        ),

        body:Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                SizedBox(height: 10,),
                TextFormField(
                  controller: EmailController,
                  validator: (a){
                    if(a!.isEmpty){
                      return "Enter email ";
                    }
                    else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(a)){
                      return "Enter valid email";
                    }
                  },
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Enter email address",
                      hintStyle: TextStyle(fontWeight: FontWeight.bold),
                      labelText: "Email address",
                      labelStyle: TextStyle(fontSize:20, fontWeight: FontWeight.bold),
                      border:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                  ),
                ),

                SizedBox(height: 10,),

                TextFormField(
                  obscureText: ishiddenpassword,
                  controller: passwordController,
                  validator: (a){
                    if(a!.isEmpty){
                      return "Enter Password ";
                    }
                    else if(a.length<=5){
                      return "Enter valid Password";
                    }
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Enter password",
                    hintStyle: TextStyle(fontWeight: FontWeight.bold),
                    labelText: "Password",
                    labelStyle: TextStyle(fontSize:20, fontWeight: FontWeight.bold),
                    border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    suffixIcon:IconButton(onPressed: (){
                      ishiddenpassword=!ishiddenpassword;
                      setState(() {

                      });
                    }, icon: Icon(ishiddenpassword==true?Icons.security:Icons.remove_red_eye),),
                  ),
                ),

                SizedBox(height: 10,),


                GestureDetector(
                  onTap: (){
                    if(_formkey.currentState!.validate()){
                      // print("done");
                      // singupWithFirebase();
                    }
                  },
                  child: Container(
                    height: 30,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(child: Text("Sing in ")),
                  ),
                ),

                SizedBox(height: 10,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: (){
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage()));
                      },
                      child: Text("Sing up"),
                    ),
                  ],
                ),
                SizedBox(height: 10,),

                Container(
                  height: 50,
                  width: 180,
                  // color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 35,
                          width: 40,
                          child: Image(image: NetworkImage("https://cdn-icons-png.flaticon.com/512/2991/2991148.png",),height: 30,width: 30,)
                      ),
                      SizedBox(width: 15,),
                      Container(
                          height: 50,
                          width: 50,
                          child: Icon(Icons.facebook,size: 40,)),
                      SizedBox(width: 15,),
                      Container(
                          height: 60,
                          width: 50,
                          child: Icon(Icons.apple,size: 40,)),
                    ],
                  ),
                )
              ],
            ),
          ),
        )

    );
  }

  // singupWithFirebase() async {
  //   try {
  //     final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: EmailController.text,
  //       password: passwordController.text,
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       print('No user found for that email.');
  //     } else if (e.code == 'wrong-password') {
  //       print('Wrong password provided for that user.');
  //     }
  //   }
  // }


}
