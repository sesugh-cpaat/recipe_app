import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewRecipeScreen extends StatefulWidget {
  String foodName;
  ViewRecipeScreen({Key? key, required this.foodName}) : super(key: key);

  @override
  State<ViewRecipeScreen> createState() => _ViewRecipeScreenState();
}

class _ViewRecipeScreenState extends State<ViewRecipeScreen> {
  Widget _tipCard(Color color, Widget icon, Widget title) {
    return Expanded(
      flex: 3,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: color,
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 90,
          width: 90,
          child: Column(
            children: [
              icon,
              SizedBox(height: 10),
              title,
            ],
          ),
        ),
      ),
    );
  }

  Widget _ingredients(String quantity, String name) {
    return Expanded(
      flex: 5,
      child: SizedBox(
        height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              quantity,
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    color: Colors.grey,
                  ),
            ),
            Text(
              name,
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    color: Colors.grey,
                  ),
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
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            Container(
              height: 150,
              width: 150,
              margin: const EdgeInsets.only(bottom: 30),
              child: CircleAvatar(
                backgroundImage: NetworkImage("https://picsum.photos/600/600?random=${DateTime.now().millisecondsSinceEpoch}"),
              ),
            ),
            Text(
              "BREAKFAST",
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    color: Colors.lightGreen,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              "Homemade \n${widget.foodName}",
              style: Theme.of(context).textTheme.headline5?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Row(
              children: [
                _tipCard(
                  Colors.lightBlue,
                  Icon(CupertinoIcons.clock),
                  Text("30 mins"),
                ),
                SizedBox(width: 10),
                _tipCard(
                  Colors.purple.withOpacity(.3),
                  Icon(CupertinoIcons.at_circle),
                  Text("Serving"),
                ),
                SizedBox(width: 10),
                _tipCard(
                  Colors.tealAccent,
                  Icon(CupertinoIcons.news),
                  Text("Beginner"),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              "Ingredients",
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _ingredients("2 cups", "all purpose flour"),
                _ingredients("1-1/2 cups", "whole milk"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _ingredients("3 tablespoons", "Sugar"),
                _ingredients("1 cup", "water"),
              ],
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey.withOpacity(.2),
            ),
          ),
        ),
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(
            Icons.video_camera_back_outlined,
            color: Colors.white,
          ),
          label: Text(
            "Watch Tutorial",
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
