import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class loading extends StatelessWidget {
  //const loading({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child:Center(
        child: SpinKitPouringHourglass(
          color: Colors.purple,
          size: 60.0,
          )
      )
    );
  }
}