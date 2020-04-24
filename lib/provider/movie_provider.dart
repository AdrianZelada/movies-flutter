import 'dart:convert';

import 'package:movies_app/models/movie.dart';
import 'package:http/http.dart' as http;

class MoviesProvider {
  
  String _apikey    = '6fd213403a75e2aa96145c10e3e10b6b';
  String _url       = 'api.themoviedb.org';
  String _language  = 'es-ES';

  Future<List<Movie>> _processResponse(Uri url) async{
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final movies = Movies.fromJsonList(decodedData['results']);
    return movies.items;
  }


  Future<List<Movie>> getNowPlaying() async{
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key'   : _apikey,
      'language'  : _language
    });
    return await _processResponse(url);
  }

  Future<List<Movie>> getPopular() async{
    final url = Uri.https(_url, '3/movie/popular', {
      'api_key'   : _apikey,
      'language'  : _language
    });
    return await _processResponse(url);
  }


}