import 'package:flutter/cupertino.dart';

class Events {
  final String id;
  final String title;
  final String imageUrl;
  final String description;

  const Events(
      {
        required this.id,
        required this.title,
        required this.imageUrl,
        required this.description,
      }
        );
}