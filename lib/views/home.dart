import 'package:flutter/material.dart';
import 'package:recipelist_app/models/recipe.dart';
import 'package:recipelist_app/models/recipe.api.dart';
import 'package:recipelist_app/views/widgets/recipe_card.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // creating a recipe List
  List<Recipe> _recipe;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipe = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.restaurant_menu),
              SizedBox(
                width: 20,
              ),
              Text("Food Recipe")
            ],
          ),
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _recipe.length,
                itemBuilder: (context, index) {
                  return RecipeCard(
                      title: _recipe[index].name,
                      rating: _recipe[index].rating.toString(),
                      cookTime: _recipe[index].totalTime,
                      thumbnailUrl: _recipe[index].images);
                }));
  }
}
