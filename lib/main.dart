import 'package:pokedex/model/pokemon.dart';
import 'package:pokedex/pages/pokemonDetailPage.dart';
import 'package:pokedex/scoped_model/moveState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/PokemonList/pokemonListPage.dart';
import 'pages/Types/pokemonMovesPage.dart';
import 'scoped_model/pokemonState.dart';

void main() => runApp(MyApp());

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  Pokemon pokemonModel;
  PokemonState _pokemonState = PokemonState();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<PokemonState>(
              create: (context) => _pokemonState),
          ChangeNotifierProvider<MoveState>(create: (context) => MoveState()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Pokedex',
          home: MyHomePage(),
          routes: {
            '/pokemonList': (BuildContext context) => PokemonListPage(),
            '/detail': (BuildContext context) => PokemonDetailPage()
          },
          onGenerateRoute: (RouteSettings settings) {
            final List<String> pathElements = settings.name.split('/');
            if (pathElements[0] != '') {
              return null;
            }
            if (pathElements[1].contains('detail')) {
              var name = pathElements[2];
              return MaterialPageRoute<bool>(
                  builder: (BuildContext context) => PokemonDetailPage(
                        name: name,
                      ));
            }
            if (pathElements[1].contains('moves')) {
              return MaterialPageRoute<bool>(
                  builder: (BuildContext context) => PokemonMovesPage());
            }
          },
        ));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isViewAll = false;
  double viewAllHeight = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff4f4f4), body: PokemonListPage());
  }
}
