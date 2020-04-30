import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:movies_app/models/movie.dart';


class CardSwiperWidget extends StatelessWidget {

  final List<Movie> movies;

  CardSwiperWidget({@required this.movies}) {}

  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;    

    return Container(
      padding: EdgeInsets.only(top: 30.0, left: 30.0),
      
      child: Swiper(  
        itemBuilder: (BuildContext context,int index){
          return GestureDetector (
              onTap:(){
                Navigator.pushNamed(context, 'details', arguments: movies[index]);
              },
              child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                image: NetworkImage(movies[index].getPosterImage()),            
                placeholder: AssetImage('assets/img/no-image.jpg'),
                fit: BoxFit.cover,
              )
            ),
          );
        },
        itemWidth: _screenSize.width * 0.7,
        itemHeight: _screenSize.height * 0.5,
        itemCount: movies.length,      
        layout: SwiperLayout.STACK
      ),
    );
  }
}