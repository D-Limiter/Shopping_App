import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app_1/Screens/LoginPage.dart';
import 'package:shopping_app_1/Texter.dart';
import 'package:shopping_app_1/Screens/home.dart';

class LandingPage extends StatelessWidget {
  // This widget is the root of your application.
 final Future<FirebaseApp> _initialisation = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialisation,
      builder: (context, snapshot){
      if(snapshot.hasError){
        return Scaffold(
          body: Center(
            child: Text(
              'Error: ${snapshot.error}',
                  style: Texter.headTexter,
                )
          ),
        );
      }
       
        if(snapshot.connectionState== ConnectionState.done){
          return StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
             builder: (context, streamSnapshot){
                if(streamSnapshot.hasError){
                    return Scaffold(
                      body: Center(
                        child: Text(
                          'Error: ${streamSnapshot.error}',
                            style: Texter.headTexter,
                          )
                      ),
             );
         }
         if(streamSnapshot.connectionState == ConnectionState.done){
           User? _user1 = streamSnapshot.data as User?;
            if(_user1 == null){
               return LoginPage();
            }
            else{
               return Home();
            }
         }
         return Scaffold(
            body: Center(
             child:Text(
                 'App Initialising....',
                  style: Texter.headTexter,
                )
             ) 
             );
             
             });
      }
      return Scaffold(
        body: Center(
          child:Text(
              'App Initialising....',
                  style: Texter.headTexter,
                )
        )
      );
      }
      );
  }
}
