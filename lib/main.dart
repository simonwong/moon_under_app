import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/moon_under_state.dart';
import 'package:moon_under/pages/white_noise.dart';
import 'package:moon_under/pages/generator_page.dart';
import 'package:moon_under/pages/favorites_page.dart';

import 'dictionary.dart';

void main() {
  runApp(const MoonUnder());
}

class MoonUnder extends StatelessWidget {
  const MoonUnder({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MoonUnderState(),
      child: MaterialApp(
        title: appName,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  var screenIndex = 0;
  late bool showNavigationDrawer;

  void handleScreenChanged(int selectedScreen) {
    setState(() {
      screenIndex = selectedScreen;
    });
    closeDrawer();
  }

  void openDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState!.closeEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (screenIndex) {
      case 0:
        page = WhiteNoisePage();
        break;
      case 1:
        page = GeneratorPage();
        break;
      case 2:
        page = FavoritesPage();
        break;
      default:
        throw UnimplementedError('no widget for $screenIndex');
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          body: page,
          endDrawer: NavigationDrawer(
            onDestinationSelected: handleScreenChanged,
            selectedIndex: screenIndex,
            children: <Widget>[
              NavigationDrawerDestination(
                label: Text('白噪音'),
                icon: Icon(Icons.tsunami_outlined),
                selectedIcon: Icon(Icons.tsunami),
              ),
              const Padding(
                padding: const EdgeInsets.fromLTRB(28, 10, 28, 10),
                child: Divider(),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(28, 10, 28, 16),
                child: Text(
                  'Demo',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              NavigationDrawerDestination(
                label: Text('单词'),
                icon: Icon(Icons.text_fields_outlined),
                selectedIcon: Icon(Icons.text_fields),
              ),
              NavigationDrawerDestination(
                label: Text('单词收藏'),
                icon: Icon(Icons.favorite_outline),
                selectedIcon: Icon(Icons.favorite),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(28, 10, 28, 10),
                child: Divider(),
              ),
            ],
          ),
        );
      },
    );
  }
}
