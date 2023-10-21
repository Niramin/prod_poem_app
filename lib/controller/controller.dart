import 'package:flutter/material.dart';
import 'package:prod_poem_app/model/PoemRepository.dart';
import 'package:prod_poem_app/model/poem.dart';
import 'package:intl/intl.dart' as intl;
import 'package:prod_poem_app/view/MorningSky.dart';
import 'package:prod_poem_app/view/NightSky.dart';
import 'package:prod_poem_app/view/PoemDisplay.dart';
import 'package:provider/provider.dart';

class Controller extends StatefulWidget{
  const Controller({super.key});

  @override 
  State<Controller> createState()=> _ControllerState();
}


class _ControllerState extends State<Controller>{

  bool isLike = false;
  //for getting the day's poem
  IPoemRepository poems = Poems();
  Poem todayPoem = Poem();


  //for getting the day's sky



 @override
 void initState() 
 {
    super.initState();
    firstTimeLoad();
 }
 Future<bool> firstTimeLoad() async{
    var tempPoem = await poems.getTodaysPoemAsync();
    setState(() {
      todayPoem = tempPoem;
      isLike = todayPoem.isLiked;
    });
    return true;
 }

 @override
 Widget build(BuildContext context)
 {
    var dayOfWeek = intl.DateFormat('EEEE').format(DateTime.now());
    IconData icon;
    if (isLike) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    ColorContext curContext = ColorContext();
    bool isNight = false;
    var hour = DateTime.now().hour;
    if(hour> 18)
    {
      isNight = true;
    }
    if(isNight)
    {
        curContext.setNight();
    }
    else{
      curContext.setDay();
    }

    curContext.setNight();
  return ChangeNotifierProvider(
    create: (context) => SkyAppState(),
    child: Scaffold(
      backgroundColor: curContext.bgColour,
      appBar: AppBar(
            backgroundColor:curContext.labelColor,
            title: Center(
                child: Text(
              dayOfWeek,
              style:  TextStyle(
                fontFamily: 'MedievalSharp',
                fontWeight: FontWeight.bold,
                color:  curContext.txtColour,
                fontSize: 40,
              ),
            )),
          ),
      body: Stack(
        children: [
          curContext.sky as Widget,
          FrontDisplay(poem: todayPoem,status: curContext.status,),
        ],
      ),
      floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FloatingActionButton(
                onPressed: () => {},
                tooltip: 'Share',
                backgroundColor: curContext.labelColor,
                foregroundColor: curContext.txtColour,
                child: const Icon(Icons.share),
              ),
            ],
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    ),
  );
 }

}

class ColorContext{
  Color bgColour = Colors.blue.shade200;
  Color labelColor = Colors.pink.shade100;
  Color txtColour=Colors.limeAccent ;
  String status = "morning";
  Widget?sky = null;

  setNight()
  {
    
      bgColour = Colors.black;
      labelColor = Colors.pink.shade800;
      //curContext.txtColour = Colors.amber.shade100;
      //curContect.lableColour = 
      status = "night";
      sky = NightSky();
  }
  setDay(){
    sky = Clouds();
  }
}