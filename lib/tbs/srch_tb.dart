import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app_1/Prod_Card.dart';
import 'package:shopping_app_1/Screens/PrdctPg.dart';
import 'package:shopping_app_1/Texter.dart';
import 'package:shopping_app_1/butn/Inp.dart';
import 'package:shopping_app_1/fiSrvcs.dart';

class srch_tb extends StatefulWidget {

  //const hm_tb({ Key? key }) : super(key: key);
  @override
  _srch_tbState createState() => _srch_tbState();
}

class _srch_tbState extends State<srch_tb> {
late fiSrvcs fi= fiSrvcs();
  // ignore: non_constant_identifier_names
 String srch = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Stack(
          children: [
         
            FutureBuilder<QuerySnapshot>(
              
               future: fi.prdRef.orderBy('name').startAt(['$srch']).endAt(['$srch\uf8ff']).get(),
        
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
                     ),
                     );
                   },
                 );
              },
            ).toList(),
            );
          }
             Inp(
              hint: 'Search here',
              onSubmit: (value){
                if(value.isNotEmpty){

                }
              }
            );
            //SizedBox(height: 20.0,),
            Text('Results',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black12,
              fontWeight: FontWeight.w800,
            ),
            );
                }),
        
           Padding(
             padding: const EdgeInsets.only(top: 50.0),
             child: Inp(
                hint: 'Search here',
                onSubmit: (value){
                  if(value.isNotEmpty){
setState(() {
  srch = value;
});
                  }
                }
              ),
           ),
            //SizedBox(height: 20.0,),
            Text('Results',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black12,
              fontWeight: FontWeight.w800,
            ),),
          ],
        ),
      ),
      
    );
  }
}