import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app_1/butn/BtmBtn.dart';
class BtmTbs extends StatefulWidget {
  final int slcTab;
  final Function(int) tabPrsd; 
  BtmTbs({required this.slcTab,required this.tabPrsd});
  //
  //const BtmTbs({ Key? key }) : super(key: key);
  @override
  _BtmTbsState createState() => _BtmTbsState();
}

class _BtmTbsState extends State<BtmTbs> {
int _slcTab=0;
@override
  

  @override
  Widget build(BuildContext context) {
_slcTab = widget.slcTab;
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.blueAccent.withOpacity(0.1),
            spreadRadius: 2.0,
            blurRadius: 31.0, )
        ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      BtmBtn(
                        ImgPth: 'assets/images/home.png',
                         selected: _slcTab==0?true:false,
                        onPressed:() {
                          widget.tabPrsd(0);
                          
                        } ),
                      BtmBtn(
                        ImgPth: 'assests/images/free-search-icon-free-vector.jpg',
                        selected: _slcTab==1?true:false,
                        onPressed:(){
                          widget.tabPrsd(1);
                        }),
                      BtmBtn(
                        ImgPth: 'assets/images/saved.png',
                        selected: _slcTab==2?true:false,
                        onPressed:(){
                          widget.tabPrsd(2);
                        }),
                      BtmBtn(
                        ImgPth: 'assets/images/logout.png',
                        selected: _slcTab==3?true:false,
                        onPressed:(){
                          FirebaseAuth.instance.signOut();
                        })
                    ],
                  )
                );
  }
}
