import 'package:prod_poem_app/model/PoemRepository.dart';

class Poem {
  String title = "";
  String author = "";
  String content = "";
  int id = 0;
  bool isLiked = false;
  late DateTime time;
  IPoemRepository poems = Poems();

  Poem({String? title, String? author, String? content, int? id}) {
    if (title != null) {
      this.title = title;
    }

    if (author != null) {
      this.author = author;
    }

    if (content != null) {
      this.content = content;
    }

    if (id != null) {
      this.id = id;
    }
  }

  void likePoem()
  {
    isLiked = true;
    poems.likePoemAsync(this);
  }

  void dislikePoem()
  {
    isLiked = false;
    poems.dislikePoemAsync(this);
  }


}