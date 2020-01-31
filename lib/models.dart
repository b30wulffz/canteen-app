import 'dart:convert';

import 'menuList.dart';

enum FoodType { Vegetarian, NonVegetarian }
enum FoodTime { Breakfast, Lunch, Dinner }
enum Day { Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday }

class User {
  String email, firstName, lastName, username, mobileNo;

  User({this.firstName, this.lastName, this.username, this.email, this.mobileNo});

  factory User.fromJSON(Map<String, dynamic> json) {
    return User(
        firstName: json['first_name'],
        lastName: json['last_name'],
        username: json['username'],
        email: json['email'],
        mobileNo: json['mobile_no']);
  }
}

class Food {
  String name, description;
  bool available;
  FoodType type;

  Food({this.name, this.type, this.description, this.available});

  factory Food.fromJSON(Map<String, dynamic> json) {
    return Food(
        name: json['name'],
        description: json['description'],
        available: json['available'],
        type: (json['meal'] == 'V') ? FoodType.Vegetarian : FoodType.NonVegetarian);
  }
}

class Menu {
  List<Food> foodItems;
  FoodTime type;
  Day day;

  Menu({this.day, this.type, this.foodItems});

  static Map<String, int> t = {"B": 0, "L": 1, "D": 2};

  factory Menu.fromJSON(Map<String, dynamic> json) {
    List<Food> _food;
    for (var i in json['food_items']) {
      _food.add(Food.fromJSON(i));
    }
    return Menu(
        day: Day.values[int.parse(json['day'])],
        type: FoodTime.values[t[json['type']]],
        foodItems: _food);
  }
}

class MealOptOut {
  User user;
  DateTime dateTime;
  FoodTime foodTime;

  MealOptOut({this.user, this.foodTime, this.dateTime});

  static Map<String, int> t = {"B": 0, "L": 1, "D": 2};

  factory MealOptOut.fromJSON(Map<String, dynamic> json) {
    List<int> date = json['date'].toString().split('-').map(int.parse).toList();
    return MealOptOut(
        user: User.fromJSON(json['user']),
        dateTime: DateTime(date[0], date[1], date[2]),
        foodTime: FoodTime.values[t[json['type']]]);
  }
}

class Feedback {
  String description;
  Food food;
  User user;
  DateTime date;

  Feedback({this.user, this.food, this.date, this.description});

  factory Feedback.fromJSON(Map<String, dynamic> json) {
    List<int> date = json['date'].toString().split('-').map(int.parse).toList();

    return Feedback(
        user: User.fromJSON(json['user']),
        description: json['description'],
        date: DateTime(date[0], date[1], date[2]),
        food: Food.fromJSON(json['food']));
  }
}

class MenuFull {
  List<Menu> menus;

  MenuFull({this.menus});

  factory MenuFull.fromJSON(List<dynamic> json) {
    List<Menu> _menus;
    for (var i in json) {
      _menus.add(Menu.fromJSON(i));
    }
    return MenuFull(menus: _menus);
  }
}
