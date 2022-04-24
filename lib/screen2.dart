import 'package:flutter/material.dart';

class screen2 extends StatelessWidget {
  const screen2({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Screen 2",),centerTitle: true,),
      body: Column(children: [
        ElevatedButton(
          onPressed: (){
            Navigator.pop(context);
        },
         child: Text("Go back to Screen 1",style: TextStyle(fontSize: 32),))
      ]),
    );
  }
}