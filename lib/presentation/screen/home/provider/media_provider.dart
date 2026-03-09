import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:xylophone_music_player/data/model/song_,model.dart';
import 'package:xylophone_music_player/domain/entities/songs.dart';

class MediaProvider extends ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();

  final List <Songs> _playlist = SongModel.getSampleSongs();

  int _currentIndex = 0;
  bool _isPlaying = false;
  Duration _currentPosition = Duration.zero;
  Duration _position = Duration.zero;


  List<Songs> get playlist => _playlist;
  Songs? get currentSong => _playlist.isNotEmpty ? _playlist[_currentIndex] : null;
  bool get isPlaying => _isPlaying;
  Duration get currentPosition => _currentPosition;
  Duration get position => _position;
  int get currentIndex => _currentIndex;


  MediaProvider(){
    _initialAudioPlayer();
  }

  void _initialAudioPlayer(){
    //New Song Load and we know it's length
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _position = newDuration;
      notifyListeners();
    });


  // Position Chnages update
    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentPosition = newPosition;
      notifyListeners();
    });

    //When Song Ends
    _audioPlayer.onPlayerComplete.listen((event) {
      _isPlaying = false;
      _currentPosition = Duration.zero;
      notifyListeners();
    });
    




  }
  
}