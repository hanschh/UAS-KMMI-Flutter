import 'package:flutter/painting.dart';

enum Importance { low, medium, high }

class PlaylistItem {
  final String id;
  final String name;
  final Importance importance;
  final Color color;
  final int quantity;
  final DateTime date;
  final bool isComplete;
  PlaylistItem(
      {this.id,
      this.name,
      this.importance,
      this.color,
      this.quantity,
      this.date,
      this.isComplete = false});
  PlaylistItem copyWith(
      {String id,
      String name,
      Importance importance,
      Color color,
      int quantity,
      DateTime date,
      bool isComplete}) {
    return PlaylistItem(
        id: id ?? this.id,
        name: name ?? this.name,
        importance: importance ?? this.importance,
        color: color ?? this.color,
        quantity: quantity ?? this.quantity,
        date: date ?? this.date,
        isComplete: isComplete ?? this.isComplete);
  }
}
