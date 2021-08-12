import 'package:flutter/material.dart';
class prd_Bt_Btn extends StatefulWidget {
 // const prd_Bt_Btn({ Key? key }) : super(key: key);
final List prdSz;
final Function(String) onSlctd;
prd_Bt_Btn({required this.prdSz, required this.onSlctd});
  @override
  _prd_Bt_BtnState createState() => _prd_Bt_BtnState();
}

class _prd_Bt_BtnState extends State<prd_Bt_Btn> {
  int _slctd = 0;

  get prdSz => null;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
      ),
      child: Row(
        children: [
          for(var i=0;i<widget.prdSz.length;i++)
          GestureDetector(
            onTap: (){
              widget.onSlctd('${prdSz[i]}');
              setState(() {
                _slctd = i;
              });
            },
            child: Container(
              width: 42.0,
              height: 42.0,
              decoration: BoxDecoration(color: _slctd == i? Theme.of(context).accentColor : Colors.grey, borderRadius: BorderRadius.circular(8.0)),
            
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(
              horizontal: 4.0,
            ),
            child: Text(
              '${widget.prdSz[i]}',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: _slctd == i? Colors.white:  Colors.brown[800],
                fontSize: 16.0,
              )
            )
                  ,
          ),
          )
          ],
      ),
    );
      
    
  }
}