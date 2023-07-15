import 'package:flutter/material.dart';

class ExampleDestination {
  const ExampleDestination(this.label, this.icon, this.selectedIcon);

  final String label;
  final Widget icon;
  final Widget selectedIcon;
}

const List<ExampleDestination> destinations = <ExampleDestination>[
  ExampleDestination('WhiteNoisePage', Icon(Icons.favorite_outline), Icon(Icons.favorite)),
  ExampleDestination('Home', Icon(Icons.home_outlined), Icon(Icons.home)),
  ExampleDestination('Favorites', Icon(Icons.favorite_outline), Icon(Icons.favorite)),
];
