import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;

class TitleID {
  final int id;
  final String title;

  TitleID (this.id, this.title);
}

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

RecipeDetailed recipeDetailedFromJson(String str) {
  final jsonData = json.decode(str);
  return RecipeDetailed.fromJson(jsonData);
}

String recipeDetailedToJson(RecipeDetailed data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class RecipeDetailed {
  bool vegetarian;
  bool vegan;
  bool glutenFree;
  bool dairyFree;
  bool veryHealthy;
  bool cheap;
  bool veryPopular;
  bool sustainable;
  int weightWatcherSmartPoints;
  String gaps;
  bool lowFodmap;
  bool ketogenic;
  bool whole30;
  String sourceUrl;
  String spoonacularSourceUrl;
  int aggregateLikes;
  int spoonacularScore;
  int healthScore;
  String creditText;
  String license;
  String sourceName;
  double pricePerServing;
  List<ExtendedIngredient> extendedIngredients;
  int id;
  String title;
  int readyInMinutes;
  int servings;
  String image;
  String imageType;
  Nutrition nutrition;
  List<dynamic> cuisines;
  List<String> dishTypes;
  List<String> diets;
  List<dynamic> occasions;
  WinePairing winePairing;
  String instructions;
  List<AnalyzedInstruction> analyzedInstructions;
  String creditsText;

  RecipeDetailed({
    this.vegetarian,
    this.vegan,
    this.glutenFree,
    this.dairyFree,
    this.veryHealthy,
    this.cheap,
    this.veryPopular,
    this.sustainable,
    this.weightWatcherSmartPoints,
    this.gaps,
    this.lowFodmap,
    this.ketogenic,
    this.whole30,
    this.sourceUrl,
    this.spoonacularSourceUrl,
    this.aggregateLikes,
    this.spoonacularScore,
    this.healthScore,
    this.creditText,
    this.license,
    this.sourceName,
    this.pricePerServing,
    this.extendedIngredients,
    this.id,
    this.title,
    this.readyInMinutes,
    this.servings,
    this.image,
    this.imageType,
    this.nutrition,
    this.cuisines,
    this.dishTypes,
    this.diets,
    this.occasions,
    this.winePairing,
    this.instructions,
    this.analyzedInstructions,
    this.creditsText,
  });

  factory RecipeDetailed.fromJson(Map<String, dynamic> json) => new RecipeDetailed(
    vegetarian: json["vegetarian"],
    vegan: json["vegan"],
    glutenFree: json["glutenFree"],
    dairyFree: json["dairyFree"],
    veryHealthy: json["veryHealthy"],
    cheap: json["cheap"],
    veryPopular: json["veryPopular"],
    sustainable: json["sustainable"],
    weightWatcherSmartPoints: json["weightWatcherSmartPoints"],
    gaps: json["gaps"],
    lowFodmap: json["lowFodmap"],
    ketogenic: json["ketogenic"],
    whole30: json["whole30"],
    sourceUrl: json["sourceUrl"],
    spoonacularSourceUrl: json["spoonacularSourceUrl"],
    aggregateLikes: json["aggregateLikes"],
    spoonacularScore: json["spoonacularScore"],
    healthScore: json["healthScore"],
    creditText: json["creditText"],
    license: json["license"],
    sourceName: json["sourceName"],
    pricePerServing: json["pricePerServing"].toDouble(),
    extendedIngredients: new List<ExtendedIngredient>.from(json["extendedIngredients"].map((x) => ExtendedIngredient.fromJson(x))),
    id: json["id"],
    title: json["title"],
    readyInMinutes: json["readyInMinutes"],
    servings: json["servings"],
    image: json["image"],
    imageType: json["imageType"],
    nutrition: Nutrition.fromJson(json["nutrition"]),
    cuisines: new List<dynamic>.from(json["cuisines"].map((x) => x)),
    dishTypes: new List<String>.from(json["dishTypes"].map((x) => x)),
    diets: new List<String>.from(json["diets"].map((x) => x)),
    occasions: new List<dynamic>.from(json["occasions"].map((x) => x)),
    winePairing: WinePairing.fromJson(json["winePairing"]),
    instructions: json["instructions"],
    analyzedInstructions: new List<AnalyzedInstruction>.from(json["analyzedInstructions"].map((x) => AnalyzedInstruction.fromJson(x))),
    creditsText: json["creditsText"],
  );

  Map<String, dynamic> toJson() => {
    "vegetarian": vegetarian,
    "vegan": vegan,
    "glutenFree": glutenFree,
    "dairyFree": dairyFree,
    "veryHealthy": veryHealthy,
    "cheap": cheap,
    "veryPopular": veryPopular,
    "sustainable": sustainable,
    "weightWatcherSmartPoints": weightWatcherSmartPoints,
    "gaps": gaps,
    "lowFodmap": lowFodmap,
    "ketogenic": ketogenic,
    "whole30": whole30,
    "sourceUrl": sourceUrl,
    "spoonacularSourceUrl": spoonacularSourceUrl,
    "aggregateLikes": aggregateLikes,
    "spoonacularScore": spoonacularScore,
    "healthScore": healthScore,
    "creditText": creditText,
    "license": license,
    "sourceName": sourceName,
    "pricePerServing": pricePerServing,
    "extendedIngredients": new List<dynamic>.from(extendedIngredients.map((x) => x.toJson())),
    "id": id,
    "title": title,
    "readyInMinutes": readyInMinutes,
    "servings": servings,
    "image": image,
    "imageType": imageType,
    "nutrition": nutrition.toJson(),
    "cuisines": new List<dynamic>.from(cuisines.map((x) => x)),
    "dishTypes": new List<dynamic>.from(dishTypes.map((x) => x)),
    "diets": new List<dynamic>.from(diets.map((x) => x)),
    "occasions": new List<dynamic>.from(occasions.map((x) => x)),
    "winePairing": winePairing.toJson(),
    "instructions": instructions,
    "analyzedInstructions": new List<dynamic>.from(analyzedInstructions.map((x) => x.toJson())),
    "creditsText": creditsText,
  };
}

class AnalyzedInstruction {
  String name;
  List<Step> steps;

  AnalyzedInstruction({
    this.name,
    this.steps,
  });

  factory AnalyzedInstruction.fromJson(Map<String, dynamic> json) => new AnalyzedInstruction(
    name: json["name"],
    steps: new List<Step>.from(json["steps"].map((x) => Step.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "steps": new List<dynamic>.from(steps.map((x) => x.toJson())),
  };
}

class Step {
  int number;
  String step;
  List<Ent> ingredients;
  List<Ent> equipment;
  Length length;

  Step({
    this.number,
    this.step,
    this.ingredients,
    this.equipment,
    this.length,
  });

  factory Step.fromJson(Map<String, dynamic> json) => new Step(
    number: json["number"],
    step: json["step"],
    ingredients: new List<Ent>.from(json["ingredients"].map((x) => Ent.fromJson(x))),
    equipment: new List<Ent>.from(json["equipment"].map((x) => Ent.fromJson(x))),
    length: json["length"] == null ? null : Length.fromJson(json["length"]),
  );

  Map<String, dynamic> toJson() => {
    "number": number,
    "step": step,
    "ingredients": new List<dynamic>.from(ingredients.map((x) => x.toJson())),
    "equipment": new List<dynamic>.from(equipment.map((x) => x.toJson())),
    "length": length == null ? null : length.toJson(),
  };
}

class Ent {
  int id;
  String name;
  String image;

  Ent({
    this.id,
    this.name,
    this.image,
  });

  factory Ent.fromJson(Map<String, dynamic> json) => new Ent(
    id: json["id"],
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
  };
}

class Length {
  int number;
  String unit;

  Length({
    this.number,
    this.unit,
  });

  factory Length.fromJson(Map<String, dynamic> json) => new Length(
    number: json["number"],
    unit: json["unit"],
  );

  Map<String, dynamic> toJson() => {
    "number": number,
    "unit": unit,
  };
}

class ExtendedIngredient {
  int id;
  String aisle;
  String image;
  String consitency;
  String name;
  String original;
  String originalString;
  String originalName;
  double amount;
  Unit unit;
  List<String> meta;
  List<String> metaInformation;
  Measures measures;

  ExtendedIngredient({
    this.id,
    this.aisle,
    this.image,
    this.consitency,
    this.name,
    this.original,
    this.originalString,
    this.originalName,
    this.amount,
    this.unit,
    this.meta,
    this.metaInformation,
    this.measures,
  });

  factory ExtendedIngredient.fromJson(Map<String, dynamic> json) => new ExtendedIngredient(
    id: json["id"],
    aisle: json["aisle"],
    image: json["image"],
    consitency: json["consitency"],
    name: json["name"],
    original: json["original"],
    originalString: json["originalString"],
    originalName: json["originalName"],
    amount: json["amount"].toDouble(),
    unit: unitValues.map[json["unit"]],
    meta: new List<String>.from(json["meta"].map((x) => x)),
    metaInformation: new List<String>.from(json["metaInformation"].map((x) => x)),
    measures: Measures.fromJson(json["measures"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "aisle": aisle,
    "image": image,
    "consitency": consitency,
    "name": name,
    "original": original,
    "originalString": originalString,
    "originalName": originalName,
    "amount": amount,
    "unit": unitValues.reverse[unit],
    "meta": new List<dynamic>.from(meta.map((x) => x)),
    "metaInformation": new List<dynamic>.from(metaInformation.map((x) => x)),
    "measures": measures.toJson(),
  };
}

class Measures {
  Metric us;
  Metric metric;

  Measures({
    this.us,
    this.metric,
  });

  factory Measures.fromJson(Map<String, dynamic> json) => new Measures(
    us: Metric.fromJson(json["us"]),
    metric: Metric.fromJson(json["metric"]),
  );

  Map<String, dynamic> toJson() => {
    "us": us.toJson(),
    "metric": metric.toJson(),
  };
}

class Metric {
  double amount;
  Unit unitShort;
  String unitLong;

  Metric({
    this.amount,
    this.unitShort,
    this.unitLong,
  });

  factory Metric.fromJson(Map<String, dynamic> json) => new Metric(
    amount: json["amount"].toDouble(),
    unitShort: unitValues.map[json["unitShort"]],
    unitLong: json["unitLong"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "unitShort": unitValues.reverse[unitShort],
    "unitLong": unitLong,
  };
}

enum Unit { EMPTY, CUP, STICK, DASH, MG, G, CAL, UNIT_G, IU, CUPS }

final unitValues = new EnumValues({
  "cal": Unit.CAL,
  "cup": Unit.CUP,
  "cups": Unit.CUPS,
  "Dash": Unit.DASH,
  "": Unit.EMPTY,
  "g": Unit.G,
  "IU": Unit.IU,
  "mg": Unit.MG,
  "stick": Unit.STICK,
  "µg": Unit.UNIT_G
});

class Nutrition {
  List<Nutrient> nutrients;
  List<Ient> ingredients;
  CaloricBreakdown caloricBreakdown;

  Nutrition({
    this.nutrients,
    this.ingredients,
    this.caloricBreakdown,
  });

  factory Nutrition.fromJson(Map<String, dynamic> json) => new Nutrition(
    nutrients: new List<Nutrient>.from(json["nutrients"].map((x) => Nutrient.fromJson(x))),
    ingredients: new List<Ient>.from(json["ingredients"].map((x) => Ient.fromJson(x))),
    caloricBreakdown: CaloricBreakdown.fromJson(json["caloricBreakdown"]),
  );

  Map<String, dynamic> toJson() => {
    "nutrients": new List<dynamic>.from(nutrients.map((x) => x.toJson())),
    "ingredients": new List<dynamic>.from(ingredients.map((x) => x.toJson())),
    "caloricBreakdown": caloricBreakdown.toJson(),
  };
}

class CaloricBreakdown {
  double percentProtein;
  double percentFat;
  double percentCarbs;

  CaloricBreakdown({
    this.percentProtein,
    this.percentFat,
    this.percentCarbs,
  });

  factory CaloricBreakdown.fromJson(Map<String, dynamic> json) => new CaloricBreakdown(
    percentProtein: json["percentProtein"].toDouble(),
    percentFat: json["percentFat"].toDouble(),
    percentCarbs: json["percentCarbs"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "percentProtein": percentProtein,
    "percentFat": percentFat,
    "percentCarbs": percentCarbs,
  };
}

class Ient {
  String name;
  double amount;
  Unit unit;
  List<Ient> nutrients;

  Ient({
    this.name,
    this.amount,
    this.unit,
    this.nutrients,
  });

  factory Ient.fromJson(Map<String, dynamic> json) => new Ient(
    name: json["name"],
    amount: json["amount"].toDouble(),
    unit: unitValues.map[json["unit"]],
    nutrients: json["nutrients"] == null ? null : new List<Ient>.from(json["nutrients"].map((x) => Ient.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "amount": amount,
    "unit": unitValues.reverse[unit],
    "nutrients": nutrients == null ? null : new List<dynamic>.from(nutrients.map((x) => x.toJson())),
  };
}

class Nutrient {
  String title;
  double amount;
  Unit unit;
  double percentOfDailyNeeds;

  Nutrient({
    this.title,
    this.amount,
    this.unit,
    this.percentOfDailyNeeds,
  });

  factory Nutrient.fromJson(Map<String, dynamic> json) => new Nutrient(
    title: json["title"],
    amount: json["amount"].toDouble(),
    unit: unitValues.map[json["unit"]],
    percentOfDailyNeeds: json["percentOfDailyNeeds"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "amount": amount,
    "unit": unitValues.reverse[unit],
    "percentOfDailyNeeds": percentOfDailyNeeds,
  };
}

class WinePairing {
  WinePairing();

  factory WinePairing.fromJson(Map<String, dynamic> json) => new WinePairing(
  );

  Map<String, dynamic> toJson() => {
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

Future<RecipeDetailed> fetchPostDetail(int id) async {
  final response = await rootBundle.loadString('assets/$id.json');
  final recipe = recipeDetailedFromJson(response);
  return recipe;
}

class DetailScreen extends StatelessWidget {
  // Declare a field that holds the id and title
  final TitleID titleID;

  // In the constructor, require a titleID
  DetailScreen({Key key, @required this.titleID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleID.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: FutureBuilder<RecipeDetailed> (
          future: fetchPostDetail(titleID.id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return new Text(snapshot.data.instructions);
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

// Uncomment this to connect the api
/*Future<List<Recipe>> fetchPost() async {
  final response =
  await http.get("https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/findByIngredients?number=5&ranking=1&ingredients=apples%2Cflour%2Csugar",
      headers: {"X-RapidAPI-Key": "5cdbcc2fb2msha7c9f188f095aa2p14cf70jsn62c2255d3972"});

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    //debugPrint("loading fine");
    //debugPrint(response.body);

    print("Number of requests left: " + response.headers["x-ratelimit-requests-remaining"]);
    print("Number of results left: " + response.headers["x-ratelimit-results-remaining"]);

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
                      //return new Card(
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                //TitleID temp
                              builder: (context) => DetailScreen(titleID: TitleID(snapshot.data[index].id, snapshot.data[index].title)),
                            ),
                          );
                        },
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