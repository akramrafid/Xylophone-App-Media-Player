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

    // play,pause,stopped,complete
    _audioPlayer.onPlayerStateChanged.listen((state) {
      _isPlaying = state == PlayerState.playing;
      notifyListeners();
    });


    // Automatically play the next song when the current one finishes
    _audioPlayer.onPlayerComplete.listen((event) {
      
    }); 
    
    if (playlist.isNotEmpty){}

    Future <void>playNext (){
      _currentIndex = (_currentIndex + 1) % _playlist.length;
    } 

    Future <void>playPrevious (){
    }

    Future <void> seek (Duration position) async {
      await _audioPlayer.seek(position);
    }


  }
  
}