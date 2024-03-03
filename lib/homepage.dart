import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';





class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
 final userdata = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent[100],
      appBar: AppBar(
        title: Text("welcome to home"),
        backgroundColor: Colors.amber[400],


      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("we are log in by email id =${userdata.email!}"),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){

            FirebaseAuth.instance.signOut();
          }, child:Text('Logout')),
          SizedBox(height: 20,),


      TextButton(
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('AlertDialog Title'),
            content: const Text('AlertDialog description'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        ),
        child: const Text('Show Dialog'),),
          SizedBox(height: 20,),

    //   TextButton(onPressed:(){
    //
    //     QuickAlert.show(
    //       context: context,
    //       type: QuickAlertType.warning,
    //       text: 'You just broke protocol',
    //     );
    //
    //
    //
    // }, child: Text('qick alert'))
          


        ],
      ),
    );
  }
}


