import 'package:flutter/material.dart';
class BtmBtn extends StatelessWidget {
  //const BtmBtn({ Key? key }) : super(key: key);
final String ImgPth;
final bool slctd;
final Function onPressed;
// ignore: non_constant_identifier_names
BtmBtn({required this.ImgPth, this.selected, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    bool _slctd = slctd?? false;
    return Container(
      padding: EdgeInsets.all(28.0 ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
        color: _slctd ? Theme.of(context).accentColor: Colors.transparent,
        width: 2.0,
          ),
        ),
      ),
      child: Image(
         image: AssetImage(
           ImgPth ?? 'assests/images/cart.png,
         ),
         width: 20.0,
         height: 20.0,
         color: _slctd ? Theme.of(context).accentColor: Colors.blueGrey[200],
        )
        ,
    );
  }
}