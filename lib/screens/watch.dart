import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubeVids extends StatefulWidget {
  @override
  _YouTubeVidsState createState() => _YouTubeVidsState();
}

class _YouTubeVidsState extends State<YouTubeVids> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  Future future;
  YoutubePlayerController _controller;
  PlayerState _playerState;
  YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;
  @override
  void initState() {
    super.initState();
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    // _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    // _controller.dispose();
    super.dispose();
  }

  void initPlayer(String id) {
    print(id);
    _controller = YoutubePlayerController(
      initialVideoId: id,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                youtubePlayer('inpok4MKVLM'),
                youtubePlayer('fStO0mHD7Wk'),
                youtubePlayer('rkZl2gsLUp4'),
                youtubePlayer('Zxj3P0enJNQ'),
                youtubePlayer('gedoSfZvBgE'),
                youtubePlayer('tavrkdQWJTI'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget youtubePlayer(String id) {
    initPlayer(id);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressColors: ProgressBarColors(
            playedColor: Colors.amber,
            handleColor: Colors.amberAccent,
          ),
          onReady: () {
            _controller.addListener(listener);
          },
        ),
      ),
    );
  }
}
