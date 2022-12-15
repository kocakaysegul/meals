import 'package:flutter/material.dart';
import 'package:meals/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const rootName = "/meal-detail";


  Widget buildSectionTitle(BuildContext context, String text ){
    return Container(
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }

  Widget buildContainer(Widget child){
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, border: Border.all(color: Colors.grey)),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(title: Text('${selectedMeal.title}')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Theme.of(context).primaryColorLight,
                    child: Padding(
                        child: Text(selectedMeal.ingredients[index]),
                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10)),
                  );
                },
                itemCount: selectedMeal.ingredients.length)),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
              ListView.builder(itemBuilder: (ctx, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${(index+1)}'),
                    ),
                    title: Text(selectedMeal.steps[index]),
                  ),
                  Divider(),
                ],

              ), itemCount: selectedMeal.steps.length,)
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColorLight,
        child: Icon(Icons.delete, color: Colors.black87,),
        onPressed: () {
          Navigator.of(context).pop(mealId);
        },
      ),
    );
  }
}
