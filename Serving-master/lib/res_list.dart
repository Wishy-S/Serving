
import 'dart:ui';

import 'package:flutter/material.dart';

class Menu{
  String DishName;
 // Picture pic;
//Create a pic type object for storing Dish Picture
Menu({this.DishName});

}

class resList{
  String name;
  String OwnersName;
  List <Menu> dishes;
  String codeForVegOrNonVeg;
  double rating;
  String location;
  TimeOfDay openingTime,closingTime;
  resList({this.OwnersName,this.name,this.dishes,this.codeForVegOrNonVeg,this.rating,this.location,this.openingTime,this.closingTime});
  void addRes(resList res){
    res.name = name;
    res.OwnersName = OwnersName;
    res.dishes = dishes;
    res.location = location;
    res.rating = rating;
    res.codeForVegOrNonVeg  = codeForVegOrNonVeg;
    res.openingTime = openingTime;
    res.closingTime = closingTime;
  }
  void addDish(String d){
  dishes.add(Menu(DishName: "Paneer"));
  }

}
