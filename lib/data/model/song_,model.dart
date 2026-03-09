import 'package:xylophone_music_player/domain/entities/songs.dart';

class SongModel extends Songs {
  const SongModel({required super.title, required super.artist, required super.url, required super.durationSeconds});


  static List<Songs> getSampleSongs() {
    return const [
      SongModel(
        title: 'Lofi Study',
        artist: 'FASSounds',
        url: 'https://cdn.pixabay.com/download/audio/2022/05/27/audio_1808fbf07a.mp3',
        durationSeconds: 146,
      ),
      SongModel(
        title: 'Good Night',
        artist: 'FASSounds',
        url: 'https://cdn.pixabay.com/download/audio/2022/01/14/audio_99391792cb.mp3',
        durationSeconds: 147,
      ),
      SongModel(
        title: 'Cinematic Time Lapse',
        artist: 'Lexin_Music',
        url: 'https://cdn.pixabay.com/download/audio/2022/08/02/audio_884fe9201.mp3',
        durationSeconds: 135,
      ),
    ];
  }




}

