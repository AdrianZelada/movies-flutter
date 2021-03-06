class Movies {
  List<Movie> items = new List();
  Movies();

  Movies.fromJsonList(List<dynamic> jsonList){
    if (jsonList == null ) return ;

    for (var item in jsonList) {
      final movie =  new Movie.fromJsonMap(item);
      items.add(movie);
    }
  }
}



class Movie {
  double popularity;
  int voteCount;
  bool video;
  String posterPath;
  int id;
  bool adult;
  String backdropPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String title;
  double voteAverage;
  String overview;
  String releaseDate;
  String uniqueId;

  Movie({
    this.popularity,
    this.voteCount,
    this.video,
    this.posterPath,
    this.id,
    this.adult,
    this.backdropPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.title,
    this.voteAverage,
    this.overview,
    this.releaseDate,
  });

  Movie.fromJsonMap(Map<String, dynamic> json) {
    popularity        = json['popularity'] / 1;
    voteCount         = json['vote_count'];
    video             = json['video'];
    posterPath        = json['poster_path'];
    id                = json[ 'id'];
    adult             = json['adult'];
    backdropPath      = json['backdrop_path'];
    originalLanguage  = json['original_language'];
    originalTitle     = json['original_title'];
    genreIds          = json['genre_ids'].cast<int>();
    title             = json['title'];
    voteAverage       = json['vote_average'] / 1;
    overview          = json['overview'];
    releaseDate       = json['release_date'];
  }

  String getPosterImage() {
    if(posterPath != null) {
      return 'https://image.tmdb.org/t/p/w500/$posterPath';
    } else {
      return 'https://cdn2.vectorstock.com/i/1000x1000/60/11/vintage-camera-cartoon-vector-23556011.jpg';
    }
  }

  String getBackdropImage() {
    if(posterPath != null) {
      return 'https://image.tmdb.org/t/p/w500/$backdropPath';
    } else {
      return 'https://cdn2.vectorstock.com/i/1000x1000/60/11/vintage-camera-cartoon-vector-23556011.jpg';
    }
  }
}
