import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showProgressIndicator(BuildContext context, {bool barrierDismissible = true}){
  showDialog(
    barrierDismissible: barrierDismissible,
    context: context,
    builder: (context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );
}