import 'package:flutter/material.dart';
import 'package:kinoshka/settings/app_icon_style.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieTrailerScreen extends StatefulWidget {
  final String youtubeKey;

  const MovieTrailerScreen({super.key, required this.youtubeKey});

  @override
  State<MovieTrailerScreen> createState() => _MovieTrailerScreenState();
}

class _MovieTrailerScreenState extends State<MovieTrailerScreen> {
  late final YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
        initialVideoId: widget.youtubeKey,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          //mute: true,
        ));
  }

  @override
  Widget build(BuildContext context) {
    final player = YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
    );
    return YoutubePlayerBuilder(
        player: player,
        builder: (context, player) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Трейлер'),
            ),
            backgroundColor: Colors.black,
            body: Center(
              child: player,
            ),
          );
        },
    );
  }
}
