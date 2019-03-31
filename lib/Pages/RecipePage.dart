
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;

List<Recipe> RecipeFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<Recipe>.from(jsonData.map((x) => Recipe.fromJson(x)));
}

class Recipe {
  int id;
  String title;
  String image;
  int usedIngredientCount;
  int missedIngredientCount;
  int likes;

  Recipe({
    this.id,
    this.title,
    this.image,
    this.usedIngredientCount,
    this.missedIngredientCount,
    this.likes,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => new Recipe(
    id: json["id"],
    title: json["title"],
    image: json["image"],
    usedIngredientCount: json["usedIngredientCount"],
    missedIngredientCount: json["missedIngredientCount"],
    likes: json["likes"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image": image,
    "usedIngredientCount": usedIngredientCount,
    "missedIngredientCount": missedIngredientCount,
    "likes": likes,
  };
}

// Uncomment this to connect the api
/*Future<List<Recipe>> fetchPost() async {
  final response =
  await http.get("https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/findByIngredients?number=5&ranking=1&ingredients=apples%2Cflour%2Csugar", headers: {"X-RapidAPI-Key": "5cdbcc2fb2msha7c9f188f095aa2p14cf70jsn62c2255d3972"});
  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    debugPrint("loading fine");
    debugPrint(response.body);
    final recipe = RecipeFromJson(response.body);
    return recipe;
  } else {
    debugPrint("error loading");
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}*/

// Comment this out when you connect the api
// This uses a local file to get the recipes so we don't go over the request limit
// for the api
Future<List<Recipe>> fetchPost() async {
  final response = await rootBundle.loadString('assets/seacrhByIngredient.json');
  final recipe = RecipeFromJson(response);
  return recipe;
}

//access array and loop through it




class recipePage extends StatelessWidget{
  final Future<List<Recipe>> post;

  recipePage({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<Recipe>>(
          future: fetchPost(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return new ListView.separated(
                separatorBuilder: (context, index) => Divider(
                  color: Colors.black,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return new Card(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        new Text(snapshot.data[index].title,
                            style: new TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            )
                        ),
                        Image.network(snapshot.data[index].image)
                      ],
                    ),
                  );
                },
                itemCount: snapshot.data == null ? 0 : snapshot.data.length,
              );
            } else if (snapshot.hasError) {
              debugPrint('errors');
              return Text("${snapshot.error}");
            }
            // By default, show a loading spinner
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}