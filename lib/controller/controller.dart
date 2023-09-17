import 'package:flutter/material.dart';

class Controller extends StatefulWidget{
  const Controller({super.key});

  @override 
  State<Controller> createState()=> _ControllerState();
}


class _ControllerState extends State<Controller>{

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