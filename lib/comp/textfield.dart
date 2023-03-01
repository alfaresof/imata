import 'package:flutter/material.dart';
import 'package:imata/comp/colors.dart';

TextFormField CustomTextFormField(
        String hint, Function(String) fun, bool hide) =>
    TextFormField(
      onChanged: fun,
      obscureText: hide,
      decoration: InputDecoration(
          disabledBorder: InputBorder.none,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20.0),
          ),
          filled: true,
          hintStyle: TextStyle(color: Colors.grey[800]),
          hintText: "${hint}",
          fillColor: lightyGreen),
    );
TextFormField BigCustomTextFormField(
    String hint, Function(String) fun, bool hide) =>
    TextFormField(

      keyboardType: TextInputType.multiline,
      maxLines: null,
      onChanged: fun,
      obscureText: hide,
      decoration: InputDecoration(
          disabledBorder: InputBorder.none,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20.0),
          ),
          filled: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 100.0, horizontal: 10.0),
          hintStyle: TextStyle(color: Colors.grey[800]),
          hintText: "${hint}",
          fillColor: lightyGreen),
    );