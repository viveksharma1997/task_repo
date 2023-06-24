import 'package:flutter/material.dart';

dialogLoader(BuildContext context){
  showDialog(
    context: context,
    builder: (context) {
      return const Center(child: CircularProgressIndicator());
    },
  );
}