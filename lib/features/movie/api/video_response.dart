class VideoResponse {
  int? id;
  List<Video>? video;

  VideoResponse({this.id, this.video});

  VideoResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['results'] != null) {
      video = <Video>[];
      json['results'].forEach((v) {
        video!.add(Video.fromJson(v));
      });
    }
  }
}

class Video {
  String? name;
  String? key;
  String? id;

  Video({this.name, this.key, this.id});

  Video.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    key = json['key'];
    id = json['id'];
  }
}
