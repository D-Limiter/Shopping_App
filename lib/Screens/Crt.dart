import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app_1/ActnBr.dart';
import 'package:shopping_app_1/Screens/PrdctPg.dart';
import 'package:shopping_app_1/Texter.dart';
import 'package:shopping_app_1/fiSrvcs.dart';
import 'package:shopping_app_1/loading.dart';

class CrtPg extends StatefulWidget {
  //const CrtPg({ Key? key }) : super(key: key);

  @override
  _CrtPgState createState() => _CrtPgState();
}

class _CrtPgState extends State<CrtPg> {
 final CollectionReference _usrRef = FirebaseFirestore.instance.collection('Users');
fiSrvcs _fi=fiSrvcs();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

     body: Stack(children: [
       FutureBuilder<QuerySnapshot>(
        future: _fi.usrRef.doc(_fi.getUid()).collection('Cart').get(),
        
        builder: (context, snapshot)
        {
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
                 return  GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                    builder: (context) => PrdctPg(PrdctId: document.id),
                      ),
                      ),
                      },
                  child: FutureBuilder(
                    future: fiSrvcs.prdRef.doc(document.id).get(),
                    builder: (context,prodSnap){
                     if(prodSnap.hasError){
                       return Container(
                         child: Center(
                           child: Text('${prodSnap.error}'),
                         ),
                       );
                     }
                     if(prodSnap.connectionState == ConnectionState.done){
                       Map _proddMap = prodSnap.data.data();
                       return Padding(
                         padding: const EdgeInsets.symmetric(
                           vertical: 16.0,
                           horizontal: 24.0,
                         ),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             Container(
                               width: 90,
                               height: 90,
                               child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network('${productData['Image']}', fit: BoxFit.cover,), 
                               ),
                             ),
                             Container(
                               padding: EdgeInsetsDirectional.only(left 16.0),
                               child: Column(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text(
                                     '${_prodMap['name']}',
                                     style: TextStyle(
                                       fontSize: 18.0,
                                       color: Colors.black,
                                       fontWeight: FontWeight.w600,
                                       ),

                                     ),
                                     Padding(
                                       padding: const EdgeInsets.symmetric(vertical: 4.0),
                                       child: Text(
                                         '\$${_prodMap['Price']}',
                                         style: TextStyle(
                                           fontSize: 16.0,
                                           color: Theme.of(context).accentColor,
                                           fontWeight: FontWeight.w600),
                                           ),
                                         ),
                                         Text(
                                           'Size-${_proddMap['Size']}',
                                           style: TextStyle(
                                             fontSize: 16.0,
                                             color: Colors.black,
                                             fontWeight: FontWeight.w600),
                                         ),
                                 ];
                                )
                               )
                           ],
                         ),
                       ),
                     }
                    }
                  ),
                 ),
              }
              )
            );
            }
        }
            )
     ]
       )
     );
  }
}