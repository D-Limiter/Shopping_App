import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app_1/ActnBr.dart';
import 'package:shopping_app_1/Texter.dart';
import 'package:shopping_app_1/fiSrvcs.dart';
import 'package:shopping_app_1/prd_Bt_Btn.dart';

class PrdctPg extends StatefulWidget {
  //const PrdctPg({ Key? key }) : super(key: key);
final String PrdctId;
// ignore: non_constant_identifier_names
PrdctPg({required this.PrdctId});
  @override
  _PrdctPgState createState() => _PrdctPgState();
}

class _PrdctPgState extends State<PrdctPg> {
  @override
  fiSrvcs _fi = fiSrvcs();
  final CollectionReference _prdRef = FirebaseFirestore.instance.collection('Products');
  final CollectionReference _usrRef = FirebaseFirestore.instance.collection('Users');
  User? _user =FirebaseAuth.instance.currentUser;
  String _slctPrdctSz = '0';

  
  Future _addToSaved(){
    return _usrRef.doc(_fi.getUid()).collection('Saved').doc(widget.PrdctId).set({'Size':_slctPrdctSz});
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        FutureBuilder(
          future: _prdRef.doc(widget.PrdctId).get(),
          builder: (context, snapshot){
            if(snapshot.hasError){
              return Scaffold(
                body: Center(
                  child: Text('Error:${snapshot.error}'),
                ),
              );
            }
            if(snapshot.connectionState == ConnectionState.done){
              Map< String, dynamic> documentData = snapshot.data!.data();
              
              return ListView(
                children: [
                  Container(height: 400.0,child: Image.network('${documentData['Image']}', fit: BoxFit.cover,)),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 24.0,
                    ),
                    child: Text(
                      '${documentData['name']}',
                      style: Texter.headTexter,
                      
                      ),
                  ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 24.0,
                    ),
                      child: Text(
                        '\$${documentData['Price']}',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Theme.of(context).accentColor,
                          ),
                        ),
                    ),
                     Padding(
                       padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 24.0,
                    ),
                       child: Text(
                         '${documentData['Desc']}',
                         style: TextStyle(
                           fontSize: 16.0,
                           color: Theme.of(context).accentColor,
                         ),
                       ),
                     ),
                    prd_Bt_Btn(
                      prdSz: documentData['Choices'],
                      onSlctd:(size){
                        _slctPrdctSz = size;
                      },),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () async{
                              await _addToSaved();
                            },
                          child: Container(
                            width: 65.0,
                            height: 65.0,
                            decoration: BoxDecoration(color: Colors.grey[400], borderRadius: BorderRadius.circular(12.0)),
                            alignment: Alignment.center,
                            child: Image(
                              image: AssetImage('path'),
                              height: 22.0, ),
                          ),
                          ),
                           Expanded(
                            child: Container(
                              height: 65.0,
                              decoration: BoxDecoration(
                               color: Colors.purple[200],
                               borderRadius: BorderRadius.circular(12.0),
                              ),
                              alignment: Alignment.center,
                            child: Text(
                              'Add to Cart',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.0,
                                fontWeight: FontWeight.w700,
                              ),),
                            ),
                          )
                          
                        ],
                      ),
                    )
                     



                ],
              );
            }
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
         
        ),
        ActnBr(hasAr: true,hasTtl: false,hasBgrd: false,)
      ],),
      
    );
  }
}