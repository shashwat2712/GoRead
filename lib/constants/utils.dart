import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text) {
  if(!context.mounted)return;
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}
