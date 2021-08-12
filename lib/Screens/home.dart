import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app_1/Screens/BtmTbs.dart';
import 'package:shopping_app_1/tbs/hm_tb.dart';
import 'package:shopping_app_1/tbs/srch_tb.dart';
import 'package:shopping_app_1/tbs/svd_tb.dart';
import '../Texter.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PageController _tbsPgCntrl;
  int slcTab = 0;
  @override
  void initState() {
    _tbsPgCntrl = PageController();
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    _tbsPgCntrl.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: Column(

             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: PageView(
                    controller: _tbsPgCntrl,
                    onPageChanged: (num){
                      setState(() {
                        slcTab=num;
                      });
                    },
                    children: [
                      Container(
                      child: hm_tb(),
                      ),
                      Container(
                        child: srch_tb(),
                      ),
                      Container(
                        child: svd_tb(),
                      ),
                    ],
                  ),),
                BtmTbs( 
                  slcTab: slcTab,
                  tabPrsd: (num){
                    _tbsPgCntrl.animateToPage(num, duration:Duration(milliseconds: 600), curve: Curves.easeOutCubic);
                    },
                ),
                  
              ],
            )
          
        );
    
  }
}