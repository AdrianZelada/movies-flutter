
class Actors {
  List<Actor> actors = new List();

  Actors.fromJsonList(List<dynamic> jsonList ) {
    if( jsonList == null) return;

    jsonList.forEach((item) {
      final actor = Actor.fromJsonMap(item);
      actors.add(actor);
    });
  }
}


class Actor {
  int castId;
  String character;
  String creditId;
  int gender;
  int id;
  String name;
  int order;
  String profilePath;

  Actor({
    this.character,
    this.castId,
    this.creditId,
    this.gender,
    this.id,
    this.name,
    this.order,
    this.profilePath,
  });

  Actor.fromJsonMap(Map<String, dynamic> json) {
    character     = json['character'];
    castId        = json['cast_id'];
    creditId      = json['credit_id'];
    gender        = json['gender'];
    id            = json['id'];
    name          = json['name'];
    order         = json['order'];
    profilePath   = json['profile_path'];
  }

  String getPhoto() {
    if(profilePath != null) {
      return 'https://image.tmdb.org/t/p/w500/$profilePath';
    } else {
      return 'https://cdn2.vectorstock.com/i/1000x1000/60/11/vintage-camera-cartoon-vector-23556011.jpg';
    }
  }
}