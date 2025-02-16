import 'package:flutter/material.dart';
Widget customIcon(String image,VoidCallback onPressed){
  

  return GestureDetector(
    onTap: (){
      onPressed();
    },
    child: Image.asset(image,height: 30,width: 30,));
}