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
      id: json['id'] ?? "",
      title: json['name'] ?? "",
      artist: (json['artists'] != null && json['artists'].isNotEmpty)
          ? json['artists'][0]['name']
          : "",
      imageUrl:
          (json['album']?['images'] != null &&
              json['album']["images"].isNotEmpty)
          ? json['album']['images'][0]['url']
          : "",
    );
  }
}
