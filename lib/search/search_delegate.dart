import 'package:flutter/material.dart';
import 'package:movies_app/models/movie.dart';
import 'package:movies_app/provider/movie_provider.dart';

class DataDelegate extends SearchDelegate {

  List<String> data = [
    'Adrian',
    'Walter',
    'Carmen',
    'Chicho',
    'Pelucha',
    'Pipoca',
    'Botones'
  ];

  String itemSelect;
  final moviesProvider = MoviesProvider();

  @override
  List<Widget> buildActions(BuildContext context) {
    // Controller Buttons appbar Right
    return [
      IconButton(
        icon: Icon( Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Controller Buttons appbar left
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation
      ),
      onPressed: () {
        close(
          context,
          null
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Show result but  hidden sugests
    return Center(
      child: Text(itemSelect) 
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Suggest options 
    print(query);
    if (query.isEmpty) {
      return Container();
    } else {
      return FutureBuilder(
        future: moviesProvider.getSearchMovie(query),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          print('snapshot.hasData');
          print(snapshot.hasData);
          if (snapshot.hasData) {
            print(snapshot.data);
            final results = snapshot.data;
            return ListView(
              children: results.map((item) {
                print(item);
                return ListTile(
                  leading: FadeInImage(
                    image: NetworkImage(item.getPosterImage()),
                    placeholder: AssetImage('assets/img/no-image.jpg'),
                    width: 50.0,
                    fit: BoxFit.contain
                  ),
                  title: Text(item.title),
                  subtitle: Text(item.originalTitle),
                  onTap: () {
                    // close(context, null);
                    item.uniqueId = '';
                    Navigator.pushNamed(context, 'details', arguments: item);
                  },
                );
              }).toList(),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                semanticsLabel: 'No data',
              )
            );
          }
        },
      );
    }
    
  }

  // @override
  // Widget buildSuggestions(BuildContext context) {
  //   // Suggest options 
  //   List<String> dataFilter = (query.isEmpty) ? data
  //   : data.where( (String item) {
  //     return item.toLowerCase().startsWith(query.toLowerCase());
  //   }).toList();
  //   return ListView.builder(
  //     itemCount: dataFilter.length,
  //     itemBuilder: (context, i) {
  //       return ListTile(
  //         leading: Icon(Icons.movie),
  //         title: Text(dataFilter[i]),
  //         onTap: () {
  //           itemSelect = dataFilter[i];
  //           showResults(context);
  //         },
  //       );
  //     },
  //   );
  // }

  
}