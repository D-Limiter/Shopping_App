import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app_1/butn/Inp.dart';
import 'package:shopping_app_1/butn/Sign_Butn.dart';
import 'package:shopping_app_1/loading.dart';

class RegPag extends StatefulWidget {
  //const RegPag({ Key? key }) : super(key: key);

  @override
  _RegPagState createState() => _RegPagState();
}

class _RegPagState extends State<RegPag> {
  // ignore: unused_element
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
      _regLoad = true;
    });
    String _AcntFdbk = await createAccount()??'0123';
    if(_AcntFdbk != '0123'){
      _alert(_AcntFdbk);
    }else
    Navigator.pop(context);
    setState(() {
      _regLoad = false;
    });
  }
    String regMl = '';
  String regPwd = '';
  bool _regLoad = false;
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
  Future<String? > createAccount() async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: regMl, password: regPwd);
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

  @override
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
                      'Create your Account',
                      textAlign: TextAlign.center,
                      style: TextStyle( fontSize: 24.0, fontWeight: FontWeight.w700, color: Colors.deepPurple),
                      ),
                  ),
                    ),
                     Column(children: [
                       Inp(
                         hint: 'Email',
                         onChanged:(val){
                           regMl=val;
                         },
                         onSubmit: (val){
                           _pwdFoc.requestFocus(); 
                         },
                         textInputAction: TextInputAction.next,
                         isPwd: false,
                         ),
                       Inp(
                         hint: 'Pwd',
                       onChanged: (val){
                         regPwd = val;
                       },
                       onSubmit: (val){
                         _subFrm();
                       },
                       focusNode: _pwdFoc ,
                       isPwd: true,),
                       Sign_Butn(
                           text: 'Create',
                            
                           onPressed: (){
                             _subFrm();
                           } ,
                           Butn: true,
                           isLoading: _regLoad, 
                          ),
                     
                       
                     ],
                      ),
                      Sign_Butn( 
                         text: 'Create account',
                           onPressed: (){
                             Navigator.pop(context);
                           },
                        
                        Butn: true,
                       ),
                ],
                ),
            ),
          ),
        );
                      
              
  }
}