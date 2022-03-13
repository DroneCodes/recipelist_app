import 'dart:convert';
import 'package:recipelist_app/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  /*
  Using the Yummly API i use dome parameters

  var req = unirest("GET", "https://yummly2.p.rapidapi.com/feeds/list-similarities");

req.query({
	"limit": "18",
	"start": "0",
	"id": "15-Minute-Baked-Salmon-with-Lemon-9029477",
	"apiFeedType": "moreFrom",
	"authorId": "Yummly"
});
 
req.headers({
	"x-rapidapi-host": "yummly2.p.rapidapi.com",
	"x-rapidapi-key": "60a881a73amsh59d74193f12afb6p1a1d07jsn6e73291d50a1",
	"useQueryString": true
});


  */

  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https("yummly2.p.rapidapi.com", "/feeds/list-similarities", {
      "limit": "18",
      "start": "0",
      "id": "15-Minute-Baked-Salmon-with-Lemon-9029477",
      "apiFeedType": "moreFrom",
      "authorId": "Yummly"
    });

    // creating a final response

    final response = await http.get(uri, headers: {
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "x-rapidapi-key": "60a881a73amsh59d74193f12afb6p1a1d07jsn6e73291d50a1",
      "useQueryString": "true"
    });

    // creating a map data
    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data["feed"]) {
      _temp.add(i["content"]["details"]);
    }

    return Recipe.recipesFromSnapshot(_temp);
  }
}
