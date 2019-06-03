import 'package:flutter/material.dart';
import 'package:flutter_api/model/beer.dart';
import 'package:flutter_api/repository/beer_repository.dart';
import 'package:flutter_api/widget/beer_tile.dart';
import 'dart:async';

class Home extends StatefulWidget{

  home_page createState()=> home_page();
}

class home_page extends State<Home>{
List<Beer> _beer =<Beer>[];


@override
void initState() {
  super.initState();
  listenForBeers();
}

@override
  Widget build(BuildContext context) {
  return Scaffold(

    appBar: AppBar(
      centerTitle: true,
      title: Text('Top Beers'),
    ),
    body: ListView.builder(
      itemCount: _beer.length,
      itemBuilder: (context, index) => BeerTile(_beer[index]),
    ),
  );
}
void listenForBeers() async{
final Stream<Beer> stream = await getBeers();
stream.listen((Beer beer)=>setState(()=> _beer.add(beer)));

  }
}
