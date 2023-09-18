import 'package:flutter/foundation.dart';
import 'package:prod_poem_app/model/poem.dart';

abstract class IPoemRepository{

  Future<Poem> getTodaysPoemAsync();
  Future<bool> likePoemAsync(Poem poem);
  Future<bool> dislikePoemAsync(Poem poem);
  Future<Poem> getPoemFromLikesAsync();

}


class Poems implements IPoemRepository{

  static final Poems _singleton = Poems._internal();
  factory Poems() {
    return _singleton;
  }
  Poems._internal();


  @override
  Future<bool> dislikePoemAsync(Poem poem) async {
    // TODO: implement dislikePoem
    String pname = poem.title;
    debugPrint("::Disliked Poem '$pname'");
    return true;
    
  }

  @override
  Future<Poem> getPoemFromLikesAsync() async {
    // TODO: implement getPoemFromLikes
    return _getSamplePoem();
    
  }

  @override
  Future<Poem> getTodaysPoemAsync() async {
    // TODO: implement getTodaysPoemAsync
    return _getSamplePoem();
  }

  @override
  Future<bool> likePoemAsync(Poem poem) async {
    // TODO: implement likePoemAsync
    String pname = poem.title;
    debugPrint("::Liked Poem '$pname'");
    return true;
  }

  Poem _getSamplePoem()
  {
    Poem sample_poem = Poem(title: "Invictus",author: "William Ernest Henley",id:20);
    sample_poem.content=
    "Out of the night that covers me,\n"+
    "Black as the Pit from pole to pole,\n"+
    "I thank whatever gods may be\n"+
    "For my unconquerable soul.\n"+
    "In the fell clutch of circumstance\n"+
    "I have not winced nor cried aloud.\n"+
    "Under the bludgeonings of chance\n"+
    "My head is bloody, but unbowed.\n"+
    "Beyond this place of wrath and tears\n"+
    "Looms but the Horror of the shade,\n"+
    "And yet the menace of the years\n"+
    "Finds, and shall find, me unafraid.\n"+
    "It matters not how strait the gate,\n"+
    "How charged with punishments the scroll.\n"+
    "I am the master of my fate:\n"+
    "I am the captain of my soul.\n";

    return sample_poem;
  }
}