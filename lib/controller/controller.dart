import 'package:flutter/material.dart';

class Controller extends StatefulWidget{
  const Controller({super.key});

  @override 
  State<Controller> createState()=> _ControllerState();
}


class _ControllerState extends State<Controller>{
  //get the day's Poem
  //get the curent sky 
  

 @override
 Widget build(BuildContext context)
 {
  return MaterialApp(
      title: 'Daily Quotes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: Text(
        "Hello",
      ),
    );
 }

}