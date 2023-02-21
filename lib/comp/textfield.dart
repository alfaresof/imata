import 'package:flutter/material.dart';
import 'package:imata/comp/colors.dart';

TextFormField CustomTextFormField(String hint , Function(String) fun) => TextFormField(
      onChanged: fun,
      decoration: InputDecoration(
      disabledBorder: InputBorder.none,
      border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(20.0),
      ),
      filled: true,
      hintStyle: TextStyle(color: Colors.grey[800]),
      hintText: "${hint}",
      fillColor: lightyGreen
      ),

);