import 'package:flutter/material.dart';
import 'package:movies_app/pages/home/home_page.dart';
import 'package:movies_app/pages/movies_details/movie_details_page.dart';

Map<String, WidgetBuilder> getRoutes () {
  return {
    '/' : (BuildContext context) => HomePage(),
    'details': (BuildContext context) => MovieDetailsPage()
  };
}