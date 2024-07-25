import 'package:flutter/material.dart';
import 'package:recipes_app/models/recipe.dart';
import 'package:recipes_app/service/data_service.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _mealTypeFilter="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipes Book"),
        centerTitle: true,
      ),

      body:SafeArea(
        child: _BuildUI(),
      ) ,
    );
  }

  Widget _BuildUI(){
    return Padding(
      padding: const EdgeInsets.all(
        10.0,
      ),

      child: Column(
        children: [
          _recipeTypeButtons(),
          _recipesList(),
        ],
      ),
    );
  }

  Widget _recipeTypeButtons(){
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.05,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [

          Padding(
            padding: const EdgeInsets.symmetric(
            horizontal: 5.0,
          ),
            child: FilledButton(
              onPressed: () {
                setState(() {
                  _mealTypeFilter="Snack";
                });
              },
              child: const Text("Snack"),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5.0,
            ),
            child: FilledButton(
              onPressed: () {_mealTypeFilter="Breafood";},
              child: const Text("Breakfood"),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5.0,
            ),
            child: FilledButton(
              onPressed: () {
                _mealTypeFilter="Lunch";
              },
              child: const Text("Lunch"),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5.0,
            ),
            child: FilledButton(
              onPressed: () {
                _mealTypeFilter="Dinner";
              },
              child: const Text("Dinner"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5.0,
            ),
            child: FilledButton(
              onPressed: () {
                _mealTypeFilter="Chicken";
              },
              child: const Text("Chicken"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5.0,
            ),
            child: FilledButton(
              onPressed: () {
                _mealTypeFilter="Food";
              },
              child: const Text("Food"),
            ),
          ),
        ],
      ),
    );
  }

   Widget _recipesList() {
    return Expanded(
      child: FutureBuilder(
        future: DataService().getRecipe(_mealTypeFilter,),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text("Unable to load data"),
            );
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text("No recipes found"),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              Recipe recipe = snapshot.data![index];
              return ListTile(
                contentPadding: const EdgeInsets.only(top: 20.0),
                isThreeLine: true,
                subtitle: Text("${recipe.cuisine}\nDifficulty: ${recipe.difficulty}"),
                leading: Image.network(
                  recipe.image,
                ),
                title: Text(recipe.name),
                trailing: Text("${recipe.rating.toString()}"  ,style:const TextStyle(
                  fontSize: 15,
                ),),
              
              );
            },
          );
        },
      ),
    );
  }
}