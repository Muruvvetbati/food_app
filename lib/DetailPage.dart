import 'package:flutter/material.dart';

import 'Dishes.dart';

class DetailPage extends StatefulWidget   {
  Dishes food;

  DetailPage({required this.food});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.food.food_name),
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("resimler/${widget.food.food_pic_name}"),
            Text("${widget.food.food_cost}\u{20BA}",style: TextStyle(fontSize: 45,color: Colors.blue),),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary:Colors.orange ),
                child: Text("Order",style: TextStyle(
                  color: Colors.white),),
                onPressed: (){
                  print("${widget.food.food_name}Ordered");
                },
              ),
            )
          ],
        ),

      ),
    );
  }
}
