import 'package:flutter/material.dart';

Future<void> dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Sorry !'),
        content: const Text('This feature requires a registered account'),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('sign up!'),
            onPressed: () {

             Navigator.pushNamed(context, '/register');
            },
          ),

        ],
      );
    },
  );
}