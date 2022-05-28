// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:recipe_app/view_recipes.dart';

class RecipesListScreen extends StatefulWidget {
  const RecipesListScreen({Key? key}) : super(key: key);

  @override
  State<RecipesListScreen> createState() => _RecipesListScreenState();
}

class _RecipesListScreenState extends State<RecipesListScreen> {
  List foodNames = [
    "Cheesecake",
    "Burger",
    "Cupcake",
    "Berry Cake",
    "Pizza",
    "Meatloaf",
    "Pie",
    "Cookie",
    "Sausage Rolls"
  ];

  Widget _eachRecipe(String foodName) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: ListTile(
        onTap: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ViewRecipeScreen(
                foodName: foodName,
              ),
            ),
          );
        },
        trailing: Container(
          width: 24,
          alignment: Alignment.center,
          child: Icon(
            Icons.keyboard_arrow_right,
            size: 30,
          ),
        ),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 65,
              height: 65,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(44),
                image: DecorationImage(
                  image: NetworkImage("https://picsum.photos/300?random=${DateTime.now().millisecondsSinceEpoch + foodName.toString().length}"),
                ),
              ),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  foodName,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  "Dessert",
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Row(
                  children: [
                    Container(
                      width: 15,
                      height: 15,
                      margin: const EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    Text(
                      "Breakfast",
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  "Your Recipes",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              for (var foodName in foodNames) _eachRecipe(foodName),
            ],
          ),
        ),
      ),
    );
  }
}
