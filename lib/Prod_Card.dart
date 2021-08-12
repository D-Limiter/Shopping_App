import 'package:flutter/material.dart';
import 'package:shopping_app_1/Screens/PrdctPg.dart';
import 'package:shopping_app_1/Texter.dart';



class Prod_Card extends StatelessWidget {
  //const Prod_Card({ Key? key }) : super(key: key); 
  final String prdctId;
  final Function onPressed;
  final String imgUrl;
  final String title;
  final String price;
  Prod_Card({required this.onPressed, required this.imgUrl,required this.title,required this.price, required this.prdctId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
                  onTap: (){
                    
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => PrdctPg(PrdctId: prdctId,),),);
                      
                  },
                  child:Container( 
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0)),
                    height: 350.0,
                    margin: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                    child: Stack(
                      children: [
                        Container(
                          height: 350.0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.network(
                              '$imgUrl',
                           fit: BoxFit.cover,),
                  ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(22.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '$title',
                                  style: Texter.headTexter,
                                  ),
                                Text(
                                  '\$$price',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Theme.of(context).accentColor,
                                    fontWeight: FontWeight.w700,
                                  ),),
                                  onPressed(),
                              ],
                            ),
                          ),
                          )
                      ],
                    )
                    ),
            );
      
   
  }
}