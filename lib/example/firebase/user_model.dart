import 'package:flutter/material.dart';

class UserModel{

  String name;
  String email;

  UserModel({this.name, this.email});

  factory UserModel.fromMap(Map<String,dynamic>map){

    return new UserModel(
    name: map['name'] as String,
    email: map['email'] as String,
    );
  }


  Map<String ,dynamic>toMap(){
    return{
      'name':this.name,
      'email':this.email,
    };
  }
}