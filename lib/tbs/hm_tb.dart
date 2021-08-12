
import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app_1/ActnBr.dart';
import 'package:shopping_app_1/Prod_Card.dart';
import 'package:shopping_app_1/loading.dart';
import 'package:shopping_app_1/Screens/PrdctPg.dart';
import '../Texter.dart';

class hm_tb extends StatefulWidget {
  //const hm_tb({ Key? key }) : super(key: key);
  @override
  _hm_tbState createState() => _hm_tbState();
}

class _hm_tbState extends State<hm_tb> {
final CollectionReference _prdtRf = FirebaseFirestore.instance.collection('Products');

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      FutureBuilder<QuerySnapshot>(
        future: _prdtRf.get()
        ,
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
          if(snapshot.connectionState == ConnectionState.done){
            return ListView(
              padding: EdgeInsets.only(
                top: 108.0,
                bottom: 12.0,
              ),
              children: snapshot.data!.docs.map((document){
                 return Prod_Card(
                   title: document.data()['name'],
                   imgUrl: document.data()['Image'],
                   price: '\$${document.data()['Price']}',
                   onPressed: (){
                     Navigator.push(context, 
                     MaterialPageRoute(builder: (context) => PrdctPg(PrdctId: document.id,),
                     )
                     );
                   }, prdctId: '',
                 );
              },
            ).toList(),

            );
          }
          return Scaffold(
            body: Center(
              child: loading(),
            ),
          );
        } 
        ),
         Center(
          child: Text('Home Tab'),
        ),
        ActnBr(title: 'Home',
        hasAr: false,
        hasTtl: true,),
    ],
      );
  }
}
