class MusicModel {
  final String id;
  final String title;
  final String artist;
  final String imageUrl;

  MusicModel({
    required this.id,
    required this.title,
    required this.artist,
    required this.imageUrl,
  });

  factory MusicModel.fromJson(Map<String, dynamic> json) {
    return MusicModel(
      id: json['id'] ?? '',
      title: json['name'] ?? '',
      artist: (json['artists'] != null && json['artists'].isNotEmpty)
          ? json['artists'][0]['name']
          : '',
      imageUrl:
          (json['album'] != null &&
              json['album']['images'] != null &&
              json['album']['images'].isNotEmpty)
          ? json['album']['images'][0]['url']
          : '',
    );
  }

  Map<String, dynamic> toMap() {
    return {"id": id, "title": title, "artist": artist, "imageUrl": imageUrl};
  }

  factory MusicModel.fromMap(Map<String, dynamic> map) {
    return MusicModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      artist: map['artist'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
    );
  }
}
