import 'package:flutter/material.dart';
import 'package:food_app/DetailPage.dart';
import 'package:food_app/Dishes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
Future<List<Dishes>> dishesImport() async{
  var foodList = <Dishes>[];

  var f1 = Dishes(1, "Manti", "manti.jpg", 64.99);
  var f2= Dishes(2, "Pizza", "pizza.jpg", 55.99);
  var f3 = Dishes(3, "Baklava", "baklava.jpg", 64.50);
  var f4= Dishes(4, "Tomato Soup", "domates.jpg", 25.99);
  var f5 = Dishes(5, "Ayran", "ayran.jpg", 10.99);
  var f6= Dishes(6, "Cola", "kola.jpg", 15.99);

  foodList.add(f1);
  foodList.add(f2);
  foodList.add(f3);
  foodList.add(f4);
  foodList.add(f5);
  foodList.add(f6);

  return foodList;
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dishes"),
      ),

      body: FutureBuilder<List<Dishes>>(
        future: dishesImport(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var foodList = snapshot.data;

            return ListView.builder(
              itemCount:foodList?.length,
              itemBuilder: (context,indeks){
                var food = foodList?[indeks];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(food: food!,)));
                  },
                  child: Card(
                    child: Row(
                      children: [
                        SizedBox(width:150, height: 150,child:Image.asset("resimler/${food?.food_pic_name}"),),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(food!.food_name,style: TextStyle(fontSize: 25),),
                            SizedBox(height:50),
                            Text("${food.food_cost} \u{20BA}",style: TextStyle(fontSize: 20,color: Colors.blue),),
                          ],
                        ),
                      Spacer(),
                      Icon(Icons.keyboard_arrow_right),
                      ],
                    ),

                  ),
                );
              },
            );
          }else{
            return Center();
          }
        }
      ),
          );
  }
}
