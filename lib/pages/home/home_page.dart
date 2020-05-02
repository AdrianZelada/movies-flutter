import 'package:flutter/material.dart';
import 'package:movies_app/provider/movie_provider.dart';
import 'package:movies_app/search/search_delegate.dart';
import 'package:movies_app/widgets/card_swiper_widget.dart';
import 'package:movies_app/widgets/movie_horizontal_widget.dart';
import 'dart:async';
class HomePage extends StatelessWidget {
  final moviesProvider = MoviesProvider();
  @override
  Widget build(BuildContext context) {
    moviesProvider.getPopular();
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.adb),
            onPressed: () {
              showSearch(
                context: context,
                delegate: DataDelegate(),
                // query: 'hola'
              );
            },
          )
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:<Widget>[
            _createSwiper(),
            _createFooter(context)
          ]
        ) 
      ),
    );
  }

  Widget _createSwiper() {
    return FutureBuilder(
      future: moviesProvider.getNowPlaying(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot)  {
        if (snapshot.hasData) {
          return CardSwiperWidget(
            movies: snapshot.data
          );
        } else {
          return Container(
            height: 400.0,
            child: Center(
              child: CircularProgressIndicator() 
            )
          );
        }
      }
    );
  }

  Widget _createFooter(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Text('Popular', style: Theme.of(context).textTheme.subhead)
          ),
          SizedBox(height: 5.0,),
          StreamBuilder(
            stream: moviesProvider.popularStream,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if(snapshot.hasData) {
                return MovieHorizontal(
                  movies: snapshot.data,
                  nextPage: moviesProvider.getPopular
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
              
            },
          )
          // FutureBuilder(
          //   future: moviesProvider.getPopular(),
          //   builder: (BuildContext context, AsyncSnapshot snapshot) {              
          //     if ( snapshot.data) {
          //       snapshot.data.forEach((p) {
          //         print(p);
          //       });
          //     }
          //     return Container();
          //   },
          // )
        ],
      )
    );
  }
  
}