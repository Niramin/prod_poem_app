import 'package:flutter/material.dart';
import 'package:prod_poem_app/model/poem.dart';

class TitleCard extends StatelessWidget {
  const TitleCard({
    super.key,
    required this.mypoem,
  });

  final Poem mypoem;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: SizedBox(
          width: 300,
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    const SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        mypoem.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 35,
                          fontFamily: "Satisfy",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 2,),
                    Text(
                      mypoem.author,
                      style: const  TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class PoemContent extends StatelessWidget {
  const PoemContent({
    super.key,
    required this.poem,
  });

  final Poem poem;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
        child: Text(
          
          poem.content,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            fontFamily: "PoppinsLight",
          ),
        ),
      ),
    );
  }
}

class FrontDisplay extends StatelessWidget {
  const FrontDisplay({
    super.key,
    required this.poem,
    
  });

  final Poem poem;
  

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 40,
        ),
        TitleCard(mypoem: poem),
        const SizedBox( height: 40,),
        const Image(
          image: AssetImage("assets/images/topBorder.png"),
        ),
        PoemContent(poem: poem),
        const Image(
          image: AssetImage("assets/images/bottomBorder.png"),
        ),
        const SizedBox( height: 70,),
      ],
    );
  }
}









