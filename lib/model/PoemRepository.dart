import 'package:flutter/foundation.dart';
import 'package:prod_poem_app/common/Helper.dart';
import 'package:prod_poem_app/model/poem.dart';
import 'package:prod_poem_app/model/repo_helpers/todayPoem.dart';


abstract class IPoemRepository{

  Future<Poem> getTodaysPoemAsync();
  Future<bool> likePoemAsync(Poem poem);
  Future<bool> dislikePoemAsync(Poem poem);
  Future<Poem> getPoemFromLikesAsync();
   Future<Poem> getPoemFromId(String id);

}


class Poems implements IPoemRepository{

  static final Poems _singleton = Poems._internal();
  factory Poems() {
    return _singleton;
  }
  Poems._internal();


  Future<String> loadPoemFileText({String poemid="p0"}) async {
    String fileText = await helper.loadAssetFileText('assets/poems/$poemid');
    return fileText;
    
  }


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
    

    String todayPoemId = await getTodayPoemIdAsync();
    Poem todayPoem = await getPoemFromId(todayPoemId);
    return todayPoem;
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
  
  @override
  Future<Poem> getPoemFromId(String id) async {
    String poemFileText = await loadPoemFileText(poemid:id);
    var poemFileLines = poemFileText.split("\n");
    var poemLines = poemFileLines.sublist(2,poemFileLines.length).join("\n");

    Poem newPoem = Poem(
    title: poemFileLines[0],
    content: poemLines,
    id: int.parse(id.substring(1)),
    author: poemFileLines[1]);

    return newPoem;
  }
}