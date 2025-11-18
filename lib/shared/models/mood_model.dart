class MoodModel {
  final double bpm;
  final double energy;
  final double danceability;
  final double valence;
  final double acousticness;
  final double instrumentalness;

  MoodModel({
    required this.bpm,
    required this.energy,
    required this.danceability,
    required this.valence,
    required this.acousticness,
    required this.instrumentalness,
  });

  factory MoodModel.fromJson(Map<String, dynamic> json) {
    return MoodModel(
      bpm: (json['tempo'] ?? 0).toDouble(),
      energy: (json['energy'] ?? 0).toDouble(),
      danceability: (json['danceability'] ?? 0).toDouble(),
      valence: (json['valence'] ?? 0).toDouble(),
      acousticness: (json['acousticness'] ?? 0).toDouble(),
      instrumentalness: (json['instrumentalness'] ?? 0).toDouble(),
    );
  }
}
