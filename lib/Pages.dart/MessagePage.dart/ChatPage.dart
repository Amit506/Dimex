import 'package:flutter/material.dart';

class Chatpage extends StatefulWidget {
  @override
  _ChatpageState createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DIMAX'),
      ),

    body: Container(
      height:MediaQuery.of(context).size.height,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:[
          Expanded(
         flex: 9,
                        child: Container(
              color:Colors.redAccent,
            ),
          ),
          Expanded(
          flex: 1,
                        child: Container(
                          color:Colors.green,
                          child: Row(
              children: [

 
                Expanded(child: TextField(


                )),
                TextButton(onPressed: null, child: Text('send'))
                
              ],
            )),
          ),

        ]
      ),
      
    )
      
    );
  }
}