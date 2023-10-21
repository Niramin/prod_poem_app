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
    required this.status
  });

  final Poem poem;
  final String status;

  @override
  Widget build(BuildContext context) {
    Color txtColour = Colors.black;
    if(status == "night")
    {
      txtColour = Colors.amber.shade50;
    }
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
        child: Text(
        
          poem.content,
          style:  TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            fontFamily: "PoppinsLight",
            color: txtColour
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
    required this.status
    
  });

  final Poem poem;
  final String status;
  
  


  @override
  Widget build(BuildContext context) {
    String topborderimg = "assets/images/topBorder.png";
    String bottomborderimg = "assets/images/bottomBorder.png";
    if(status=="night")
    {
      topborderimg = "assets/images/topBorderNight.png";
      bottomborderimg = "assets/images/bottomBorderNight.png";
    }
    return ListView(
      children: [
        const SizedBox(
          height: 40,
        ),
        TitleCard(mypoem: poem),
        const SizedBox( height: 40,),
        Image(
          image: AssetImage(topborderimg),
        ),
        PoemContent(poem: poem,status: status),
        Image(
          image: AssetImage(bottomborderimg),
        ),
        const SizedBox( height: 70,),
      ],
    );
  }
}









