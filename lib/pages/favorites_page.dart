import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:moon_under/models/moon_under_state.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build FavoritesPage');

    var appState = context.watch<MoonUnderState>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have '
              '${appState.favorites.length} favorites:'),
        ),
        ...appState.favorites
            .map((pair) => ListTile(
                  leading: Icon(Icons.favorite),
                  title: Text(pair.asLowerCase),
                ))
            .toList(),
      ],
    );
  }
}
