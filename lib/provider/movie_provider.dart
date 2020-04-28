import 'dart:async';
import 'dart:convert';

import 'package:movies_app/models/actors.dart';
import 'package:movies_app/models/movie.dart';
import 'package:http/http.dart' as http;

class MoviesProvider {
  
  String _apikey    = '6fd213403a75e2aa96145c10e3e10b6b';
  String _url       = 'api.themoviedb.org';
  String _language  = 'es-ES';

  int _page = 0;
  bool _loading = false;

  List<Movie> _populares = new List();
  
  final _popularStreamCtrl = StreamController<List<Movie>>.broadcast();

  Function(List<Movie>)get popularSink => _popularStreamCtrl.sink.add;

  Stream get popularStream => _popularStreamCtrl.stream;

  Future<List<Movie>> _processResponse(Uri url) async{
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final movies = Movies.fromJsonList(decodedData['results']);
    return movies.items;
  }

  Future<List<Actor>> _processResponseActors(Uri url) async{
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final cast = Actors.fromJsonList(decodedData['cast']);
    return cast.actors;
  }


  Future<List<Movie>> getNowPlaying() async{
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key'   : _apikey,
      'language'  : _language
    });
    return await _processResponse(url);
  }

  Future<List<Movie>> getPopular() async{
    if(_loading) { return []; };
    _loading = true;
    _page++;
    final url = Uri.https(_url, '3/movie/popular', {
      'api_key'   : _apikey,
      'language'  : _language,
      'page'      : _page.toString()
    });
    // return await _processResponse(url);
    final resp = await _processResponse(url);

    _populares.addAll(resp);
    popularSink(_populares);
    _loading = false;
    return resp;
  }

  Future<List<Actor>> getActors(String movieId) async{
    final url = Uri.https(_url, '3/movie/$movieId/credits', {
      'api_key'   : _apikey,
      'language'  : _language
    });
    return await _processResponseActors(url);
  }


  @override
  void dispose() {
    _popularStreamCtrl?.close();
  }

  
}
