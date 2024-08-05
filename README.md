# fitness_tracker2
meals data and activites data, should add in your hand in global method file, onOpen just add this:


           List<MealModel> basicMeals=[
           const MealModel(
             carb: 28.5,
             fat: 0,
             protein: 2.5,
             name: 'boiled rice',
             calories: 130,
           ), // add how much you want.
         ];
         
         basicMeals.forEach((element) {database.insert(
             'basicMeals',element.toJson()); });
         activitiesWithMETS.forEach((key, value) => database.insert(
                   'activities',ActivityModel(MES:value,name: key.$2,title: key.$1).toJson()));
                   


**** the right way is using a backend to upload meals and activities and get it ***

short explain:
I have meals and activities feautures, in this features the user add to details(details is what you burned and waht you ate from calories, food values..)
in details the user has activities and meals did what each one add calories or burn calories this details just stay 7 days I get this details from eating and burning tables.
and there is statistics that calculate your calories and food values each day I get this statistics from dailyCalories table.
dailyCalories table will be updated after each add to details by adding the current values to we have to the table.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
