import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app_1/Screens/Crt.dart';
import 'package:shopping_app_1/Texter.dart';
import 'package:shopping_app_1/fiSrvcs.dart';
class ActnBr extends StatelessWidget {
  //const ActnBr({ Key? key }) : super(key: key);
  final CollectionReference _usrRef = FirebaseFirestore.instance.collection('Useres');
  User? _user =FirebaseAuth.instance.currentUser;
  fiSrvcs _fi = fiSrvcs();
final String title;
final bool hasAr;
final bool hasTtl;
final bool hasBgrd;
ActnBr({this.title,this.hasAr, this.hasTtl, this.hasBgrd});
  @override
  Widget build(BuildContext context) {
    bool _hasAr = hasAr?? false;
    bool _hasTtl = hasTtl??true;
    bool _hasBgrd= hasBgrd;
    return Container(
      decoration: BoxDecoration(
        gradient: _hasBgrd ?LinearGradient(colors: [Colors.white, Colors.white.withOpacity(1)],
        begin: Alignment(0,0),
        end: Alignment(0,1),): null
      ),
      padding: EdgeInsets.only(
        top: 56.0,
        left: 24.0,
        right: 24.0,
        bottom: 42.0,
      ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if(_hasAr)
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
              
              child: Container(
                width: 40.0,
            height: 40.0,
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.circular(6.0)
            ),
                child: Image(
              
               image: AssetImage('assets/images/Arrow.png'),
               color: Colors.white,
               width: 15.0,
               height: 15.0,
              )
              ),
              ),
              if(_hasTtl)
               Text(
                title??'Action Bar',
                style: Texter.headTexter,
               ),
           GestureDetector(
             onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context) => CrtPg()));
             },
             child: Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(6.0)
              ),
              alignment: Alignment.center,
              child: StreamBuilder(
                stream: _usrRef.doc(_fi.getUid()).collection('Cart').snapshots(), 
                builder:(context,snapshot){
                  int ttlIt = 0;
                  if(snapshot.connectionState == ConnectionState.active){
                    
                    List _docs = snapshot.data!.documents;
                    ttlIt = _docs.length; 
                  }
                  return Text(
                '$ttlIt'??'0',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  
                ),
              );
                } ,)
                     ),
           )
            ],
          ),
        );
      
    
  }
}