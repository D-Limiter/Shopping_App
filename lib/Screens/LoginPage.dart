import 'package:flutter/material.dart';
import 'package:shopping_app_1/butn/Sign_Butn.dart';
import 'package:shopping_app_1/butn/Inp.dart';
import 'package:shopping_app_1/Screens/RegPag.dart';
import 'package:shopping_app_1/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  //const LoadingPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
 //  final AuthService _auth = AuthService();
 Future<void> _alert(String error) async{
    return showDialog(
      context: context,
      barrierDismissible: false,
       builder: (context){
         return AlertDialog(
           title: Text('Error'),
           content: Container(
             child: Text(error),
           ),
           actions: [
             TextButton(
               child: Text('Close'),
               onPressed: (){
                 Navigator.pop(context);
               }, 
               ),
           ],
         );
       },
       );

  }
  void _subFrm() async{
    setState(() {
      _sgLoad = true;
    });
    String _AcntFdbk = await logInAcnt()??'0123';
    if(_AcntFdbk != '0123'){
      _alert(_AcntFdbk);
    }
    setState(() {
      _sgLoad = false;
    });
  }
   String sgMl = '';
  String sgPwd = '';
  bool _sgLoad = false;
  late FocusNode _pwdFoc ;
  @override
  void initState() {
    // TODO: implement initState
    _pwdFoc = FocusNode();
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _pwdFoc.dispose(); 
    super.dispose();
  }
  Future<String? > logInAcnt() async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: sgMl, password: sgPwd);
      return null;
    }on FirebaseAuthException catch(e){
      if(e.code == 'weal-password')
      return 'The password provided is too weak';
    else if(e.code=='email-already-in-use'){
      return 'The account already exists for that email.';
    }
    return e.message.toString();
    }catch(e){
      return e.toString();
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
          body: SafeArea(
            child: Container(
             width: double.infinity,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                      child: Text(
                      'Login to your Account',
                      textAlign: TextAlign.center,
                      style: TextStyle( fontSize: 24.0, fontWeight: FontWeight.w700, color: Colors.deepPurple),
                      ),
                  ),
                    ),
                     Column(children: [
                       Inp(
                         hint: 'Email',
                         onChanged: (val){
                           sgMl = val;
                         },
                          onSubmit: (val){
                           _pwdFoc.requestFocus(); 
                         },
                         textInputAction: TextInputAction.next,
                         isPwd: false, )
                         ,
                       Inp(
                         
                          hint: 'Pwd',
                       onChanged: (val){
                         sgPwd = val;
                       },
                       onSubmit: (val){
                         _subFrm();
                       },
                       focusNode: _pwdFoc ,
                       isPwd: true,),
                       Sign_Butn(
                           text: 'Login',
                           onPressed: () async{
                             _subFrm();
                           },
                          
                       )
                     ],),
                       Sign_Butn( 
                         text: 'Create account button',
                             onPressed: (){
                           Navigator.push(context,
                               MaterialPageRoute(
                                 builder: (context) => RegPag(
                                 ),
                               ),
                           );
                         },
                        ),
                   ],
               ),
            )
          )
        );
      
    
  }
}