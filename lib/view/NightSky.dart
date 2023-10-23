import 'package:flutter/material.dart';
import 'package:prod_poem_app/model/SkyObject.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

class NightSkyAppState extends ChangeNotifier{
  var clock = Stream.periodic(const Duration(seconds: 3));
  var clockBroadcast = BehaviorSubject();
  List<StarObject> stars = List.empty(growable: true);

  NightSkyAppState(){
    clockBroadcast.listen((value) {
      //do something
      //randomStarFadeIn();
      traverseRight();
      //randomStarFadeOut();
      notifyListeners();
    });
    clock.listen(   (event)=>clockBroadcast.add(0)  );
    stars = StarObject.returnStarsList(10);

  }

  void randomStarFadeOut(){
    for(int i=0; i<stars.length;i++)
    {
      if(stars[i].isVisible)
      {
        stars[i].isVisible = false;
        debugPrint("made star $i false");

        return;
      }
    }
  }

  void randomStarFadeIn(){
    for(int i=0; i<stars.length;i++)
    {
      if(!stars[i].isVisible)
      {
        stars[i].isVisible = true;
        debugPrint("made star $i true");

        return;
      }
    }

  }

  void setMaxXY(double x, double y) {

    for(final star in stars)
    {
      star.setScreenLimits(x, y);
    }
    
  }

  void randomSpawn()
  {
    for(final star in stars)
    {
      star.randomPositionSpawn();
    }
  }

  void traverseRight(){
     for(int i=0; i<stars.length;i++)
    {
      stars[i].x += 100;
    }
  }
}



class NightSky extends StatefulWidget{
  const NightSky({super.key} );
  
  @override
  State<StatefulWidget> createState() => _NightSkyState();
  
}

class _NightSkyState extends State<NightSky>
{
  bool calledOnce = false;
  List<StarObject>?stars;
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<NightSkyAppState>();
    appState.setMaxXY(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);

    //initialize stars
    //stars ??= StarObject.returnStarsList(5);
    if(calledOnce == false)
    {
      stars = StarObject.returnStarsList(5);
      appState.randomSpawn();
      calledOnce = true;
    }

    return Stack(
      children: [
        StarWidget(star: stars?[0] as StarObject),
        //StarWidget(star: stars?[1] as StarObject),
        //StarWidget(star: stars?[2] as StarObject),
        //StarWidget(star: stars?[3] as StarObject),
        //StarWidget(star: stars?[4] as StarObject),
      ],
    );

  }

}



class StarWidget extends StatelessWidget{
  const StarWidget({
    super.key,
    required this.star
  });

  final StarObject star;

  @override
  Widget build(BuildContext context) {
    debugPrint("${star.y} ${star.x}");
    return AnimatedPositioned(
      height: 50,
      width: 50,
      top: star.y,
      left: star.x,
      duration: const Duration(seconds: 2),
      child: AnimatedOpacity(
        opacity: star.isVisible?1.0:0.0,
        duration: const Duration(milliseconds: 500),
        //child: const Icon(Icons.star),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/cloud.png"),
            ),
          ),
        ),
      ),
    );
  }

}