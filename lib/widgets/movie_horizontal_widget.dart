import 'package:flutter/material.dart';
import 'package:movies_app/models/movie.dart';


class MovieHorizontal extends StatelessWidget {

  final List<Movie> movies;
  final Function nextPage;

  final _pageCtrl = PageController(
    initialPage: 1,
    viewportFraction: 0.26
  );

  MovieHorizontal({@required this.movies, @required this.nextPage});

  @override
  Widget build(BuildContext context) {

    _pageCtrl.addListener(() {
      if(_pageCtrl.position.pixels >= _pageCtrl.position.maxScrollExtent - 50) {
        nextPage();
      }
    });

    final double _screenSize = MediaQuery.of(context).size.height;
    return Container(
      height : _screenSize * 0.2,
      child: PageView.builder (
        controller: _pageCtrl,
        pageSnapping: false,
        itemCount: movies.length,
        itemBuilder: (context, i) {
          return _createCard(context, movies[i]);
        },
        // children: _cards(context)
      )
      
    );
  }

  Widget _createCard(context, Movie movie) {
    final card = Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
          children: <Widget>[
            Hero(
              tag: movie.id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: FadeInImage(
                  image: NetworkImage(movie.getPosterImage()),
                  placeholder: AssetImage('assets/img/no-image.jpg'),
                  fit: BoxFit.cover,
                  height: 130.0,
                ),
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              movie.title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption,
            )
          ],
        )
      );
    return GestureDetector(
      child: card,
      onTap: () {
        print('id of movie ${movie.id}');
        Navigator.pushNamed(
          context,
          'details',
          arguments: movie
        );
      }
    );
  }

  List<Widget> _cards(context) {
    return movies.map((Movie movie){
      return Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                image: NetworkImage(movie.getPosterImage()),
                placeholder: AssetImage('assets/img/no-image.jpg'),
                fit: BoxFit.cover,
                height: 140.0,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              movie.title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption,
            )
          ],
        )
      );
    }).toList();
  }
}