



import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loginbalacodenew/loginpage.dart';


class creatuser extends StatefulWidget {
  creatuser({super.key});




  @override
  State<creatuser> createState() => _creatuserState();
}


final emailcontroller =TextEditingController();
final passwardcontroller =TextEditingController();
final confirmpasswardcontroller =TextEditingController();


//creating the user

Future signup() async {
  if(confirm_passward()){
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email:emailcontroller.text.trim() ,
      password: passwardcontroller.text.trim(),

    );


  }
  else {


  }
}




bool confirm_passward() {

  if(passwardcontroller.text.trim() == confirmpasswardcontroller.text.trim()){
    return true;
  }
  else return false;
}







class _creatuserState extends State<creatuser> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("login_to_app",),
        centerTitle: true,
      ),


      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //icon
              const Icon(
                Icons.app_registration,
                size: 100,
              ),

              SizedBox(
                height: 20,
              ),

              Text(
                "Please register!!!",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.grey[800]),
              ),

              SizedBox(
                height: 20,
              ),

              Text(
                "enter your email and passward",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.grey[600]),
              ),
              SizedBox(
                height: 20,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  controller: emailcontroller,

                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent.shade400),
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText: "enter email",
                      hintStyle: TextStyle(color: Colors.blue[500])),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  obscureText: true,
                  controller: passwardcontroller,


                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent.shade400),


                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText: "passward",
                      hintStyle: TextStyle(color: Colors.grey[500])),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  obscureText: true,
                  controller: confirmpasswardcontroller,


                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent.shade400),
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText:  "confirm passward",
                      hintStyle: TextStyle(color: Colors.grey[500])),
                ),
              ),

              GestureDetector(


                onTap: signup,
                child: Container(



                  padding: EdgeInsets.all( 25),
                  margin: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15),

                  ),

                  child: Text("       sign up        ",style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),),
                ),
              ),





              Row(
                children: [

                  Text( "         alrady  a  user ?"),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder:  (context) => const finallogin()));
                  }, child:  Text(" login ",style: TextStyle(color: Colors.blueAccent),),)

                ],
              ),


              TextButton(onPressed: (){}, child: Text("Forgot passward",style: TextStyle(
                color: Colors.black,
              ),)),


            ],
          ),
        ),
      ),


    );
  }
}
