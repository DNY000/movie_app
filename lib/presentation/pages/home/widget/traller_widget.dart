import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:loadmore/core/network/api_client.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';



class TrailerPlayerScreen extends StatefulWidget {
  final String youtubeKey;

  const TrailerPlayerScreen({super.key, required this.youtubeKey});

  @override
  State<TrailerPlayerScreen> createState() => _TrailerPlayerScreenState();
}

class _TrailerPlayerScreenState extends State<TrailerPlayerScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

   _controller = YoutubePlayerController(
  params: const YoutubePlayerParams(
    showControls: true,
    showFullscreenButton: true,
  ),
)..loadVideoById(videoId: widget.youtubeKey); // Chained load
// 👈 load video sau khi init
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerScaffold(
      controller: _controller,
      builder: (context, player) {
        return Scaffold(
          appBar: AppBar(title: const Text('Trailer')),
          backgroundColor: Colors.black,
          body: Center(child: player),
        );
      },
    );
  }
}




Future<void> playTrailer(int movieId, BuildContext context) async {
  const apiKey = '206c2602f5254a596f8060e767cd97dc';

  try {
    final response = await ApiClient.instance.fetchApi(
      method: HttpMethod.get,
      url: 'https://api.themoviedb.org/3/movie/$movieId/videos?api_key=$apiKey&language=vi-VN',
    );

    final data = jsonDecode(response.body);
    final List results = data['results'];

    final trailer = results.firstWhere(
      (video) => video['type'] == 'Trailer' && video['site'] == 'YouTube',
      orElse: () => null,
    );

    if (trailer != null) {
      final key = trailer['key'];
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => TrailerPlayerScreen(youtubeKey: key),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (_) => const AlertDialog(
          title: Text('Không có trailer'),
          content: Text('Không tìm thấy trailer YouTube cho phim này.'),
        ),
      );
    }
  } catch (e) {
    print('❌ Lỗi khi lấy trailer: $e');
  }
}
