import 'package:flutter/foundation.dart';
import 'package:prod_poem_app/common/Helper.dart';


abstract class ISkyObject{
  bool isVisible = true;
  double x=0;
  double y=0;
  double default_traverse_distance = 1;
  void setPosition({double? x, double? y});
  void setScreenLimits(double x,double y);
  bool isOffBounds({double margin = 0});
  void randomPositionSpawn();
  void toggleVisibility({bool? value});


}


class SkyObject {
  String name = "random";
  bool isVisible = true;
  String image_url = "";
  double height = 100;
  double width = 100;
  //x coordinate and y coordinate

  double x = 0;
  double y = 0;
  // let max limits
  double screen_x = 50;
  double screen_y = 100;
  double default_traverse_distance = 1;
  SkyObject(String image_urlx) {
    image_url = image_urlx;
    
  }

  void setVisibiliy(bool value) {
    isVisible = value;
  }

  void setSize(double width, double height) {
    height = height;
    width = width;
  }

  void setPosition({double? x, double? y}) {
    //set position on screen
    if (x != null) {
      this.x = x;
    }

    if (y != null) {
      this.y = y;
    }
  }

  void setScreenLimits(double x, double y) {
    screen_x = x;
    screen_y = y;
  }

  bool isOffBounds({double margin = 0}) {
    if (x > screen_x + margin) {
      return true;
    }
    if (y > screen_y + margin) {
      return true;
    }
    return false;
  }

  void randomPositionSpawn() {
    x = helper.nextDouble(-100, screen_x + 100);
    y = helper.nextDouble(0, screen_y - 100);
  }

  void spawnLeft({double? distance}) {
    x = -150;
    if (distance != null) {
      x = -1 * distance;
    }
  }

  void spawnRight({double? distance}) {
    x = screen_y + 100;
    if (distance != null) {
      x = screen_y + distance;
    }
  }

  void traverseRight({double? distance}) {
    if (distance == null) {
      x += default_traverse_distance;
    } else {
      x += distance;
    }
    seeRenderChecksRight();
  }

  void traverseLeft({double? distance}) {
    if (distance == null) {
      x -= default_traverse_distance;
    } else {
      x -= distance;
    }
  }

  void seeRenderChecksRight() {
    if (x < 0) {
      isVisible = true;
    }
    if (x > screen_x) {
      isVisible = false;
    }
    if (x > screen_x + 20) {
      x = -150;
      y = helper.nextDouble(0, screen_y - 100);
    }
  }
}


class StarObject implements ISkyObject{
  @override
  bool isVisible = true;
  // positional coordinates
  @override
  double x =0;
  @override
  double y =0;

  //screen limits
  double screen_x = 50;
  double screen_y = 100;

  @override
  double default_traverse_distance = 1;
  
  @override
  bool isOffBounds({double margin = 0}) {
    if (x > screen_x + margin) {
      return true;
    }
    if (y > screen_y + margin) {
      return true;
    }
    return false;
    
  }
  
  @override
  void randomPositionSpawn() {
    x = helper.nextDouble(0, screen_x );
    y = helper.nextDouble(0, screen_y );
    debugPrint("$x $y");
  }
  
  @override
  void setPosition({double? x, double? y}) {
    //set position on screen
    if (x != null) {
      this.x = x;
    }

    if (y != null) {
      this.y = y;
    }
  }
  
  @override
  void setScreenLimits(double x, double y) {
    screen_x = x;
    screen_y = y;
  }
  
 
  
  @override
  void toggleVisibility({bool? value}) {
    if(value != null)
    {
      isVisible = value;
    }

    else{
      isVisible = !isVisible;
    }
  }

  static List<StarObject> returnStarsList(int noOfStars)
  {
    List<StarObject> stars = List.empty(growable: true);
    for(int i=0;i<noOfStars;i++)
    {
       var newStar = StarObject();
       stars.add(newStar);
    }
    return stars;
  }

}