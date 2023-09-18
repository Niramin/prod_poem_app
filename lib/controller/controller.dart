import 'package:flutter/material.dart';
import 'package:prod_poem_app/model/PoemRepository.dart';
import 'package:prod_poem_app/model/poem.dart';
import 'package:intl/intl.dart' as intl;
import 'package:prod_poem_app/view/PoemDisplay.dart';

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
  return Scaffold(
    backgroundColor: Colors.blue.shade200,
    appBar: AppBar(
          backgroundColor: Colors.pink.shade100,
          title: Center(
              child: Text(
            dayOfWeek,
            style: const TextStyle(
              fontFamily: 'MedievalSharp',
              fontWeight: FontWeight.bold,
              color: Colors.limeAccent,
              fontSize: 40,
            ),
          )),
        ),
    body: Stack(
      children: [
        FrontDisplay(poem: todayPoem),
      ],
    ),
    floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  isLike = !isLike;
                  if(isLike)
                  {
                    todayPoem.likePoem();
                  }
                  else{
                    todayPoem.dislikePoem();
                  }
                });
              },
              tooltip: 'Like',
              backgroundColor: Colors.pink.shade100,
              foregroundColor: Colors.limeAccent,
              child: Icon(icon),
            ),
            const SizedBox(
              width: 70,
            ),
            FloatingActionButton(
              onPressed: () => {},
              tooltip: 'Shuffle',
              backgroundColor: Colors.pink.shade100,
              foregroundColor: Colors.limeAccent,
              child: const Icon(Icons.shuffle),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
  );
 }

}