import 'package:flutter/material.dart';

class Inp extends StatelessWidget {
  //const Inp({ Key? key }) : super(key: key);
String hint;
final Function(String) onChanged;
final Function(String) onSubmit;
final FocusNode focusNode;
final TextInputAction textInputAction;
final isPwd;
Inp({this.hint, this.onChanged, this.onSubmit, this.focusNode, this.textInputAction,this.isPwd});
  @override
  Widget build(BuildContext context) {
    bool _isPwd=isPwd??false;
    return Container(
      margin: EdgeInsets.all(17.0),
      decoration: BoxDecoration(color: Color(0xFFF2F2F2), borderRadius: BorderRadius.circular(10.0)),
      child: TextField(
        obscureText:_isPwd,
        focusNode: focusNode,
        onChanged: onChanged,
        onSubmitted: onSubmit,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          contentPadding: EdgeInsets.all(24.0),
        ),
        style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400, color: Colors.brown[800]
        ),
      ),
      
    );
  }
}