import 'dart:math';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:prod_poem_app/model/SkyObject.dart';
import 'package:provider/provider.dart';

// State Provider
class SkyAppState extends ChangeNotifier {
  final _random = Random();
  int next(int min, int max) => min + _random.nextInt(max - min);
  var clock = Stream.periodic(const Duration(seconds: 1));
  var clockBroadcast = BehaviorSubject();

  SkyObject cloud0 = SkyObject("assets/images/cloud.png");
  SkyObject cloud1 = SkyObject("assets/images/cloud.png");
  SkyObject cloud2 = SkyObject("assets/images/cloud.png");

  bool isVisible = true;
  void setMaxXY(double x, double y) {
    cloud0.setScreenLimits(x, y);
    cloud1.setScreenLimits(x, y);
    cloud2.setScreenLimits(x, y);
  }

  void traverseRight(double distance) {
    cloud0.traverseRight(distance: distance);
    cloud1.traverseRight(distance: distance);
    cloud2.traverseRight(distance: distance);
    cloud0.seeRenderChecksRight();
    cloud1.seeRenderChecksRight();
    cloud2.seeRenderChecksRight();
  }

  //Constructor
  SkyAppState() {
    clockBroadcast.listen((value) {
      traverseRight(5);
      notifyListeners();
    });
    clock.listen((event) => clockBroadcast.add(0));
  }
}



class Clouds extends StatefulWidget {
  const Clouds({
    super.key,
  });

  @override
  State<Clouds> createState() => _CloudsState();
}

class _CloudsState extends State<Clouds> {
  bool calledOnce = false;
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<SkyAppState>();
    appState.setMaxXY(
        MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);

    //initialise cloud
    var mycloud = appState.cloud0;
    var mycloud1 = appState.cloud1;
    var mycloud2 = appState.cloud2;
    if (calledOnce == false) {
      mycloud.randomPositionSpawn();
      mycloud1.randomPositionSpawn();
      mycloud2.randomPositionSpawn();
      calledOnce = true;
    }

    return Stack(
      children: [
        SkyObjectWidget(mycloud: mycloud),
        SkyObjectWidget(mycloud: mycloud1),
        SkyObjectWidget(mycloud: mycloud2),
      ],
    );
  }
}

class SkyObjectWidget extends StatelessWidget {
  const SkyObjectWidget({
    super.key,
    required this.mycloud,
  });

  final SkyObject mycloud;

  @override
  Widget build(BuildContext context) {
    if (mycloud.isVisible) {
      return AnimatedPositioned(
        duration: const Duration(seconds: 2),
        width: mycloud.width,
        height: mycloud.width,
        top: mycloud.y,
        left: mycloud.x,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(mycloud.image_url),
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
