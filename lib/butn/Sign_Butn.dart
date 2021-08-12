import 'package:flutter/material.dart';


class Sign_Butn extends StatelessWidget {
  
  final String text;
  final Function onPressed;
  final bool Butn;
  bool isLoading;
  
  Sign_Butn( {required this.text,required this.onPressed, required this.Butn, required this.isLoading});

 // const Sign_Butn({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _Butn= Butn;
    return GestureDetector(
      onTap: onPressed(),
      child: Container(
      height: 70.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color:_Butn?Colors.pink[50]:Colors.purple[400],
        border: Border.all(
          color: Colors.pink.shade50,
         width: 2.0,
        ),
        borderRadius: BorderRadius.circular(12.0), 
      ),
      margin: EdgeInsets.all(20.0),
      child: Text(
        text??'New Account',
        style: TextStyle(
          fontSize: 15.0,
          color: Colors.brown[400],
          fontWeight: FontWeight.w700,
          
        ),
       ),
        ),
    );
  }
}