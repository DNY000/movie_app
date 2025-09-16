import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loadmore/core/common/card/card_movie.dart';
import 'package:loadmore/core/common/list/custom_list_view.dart';
import 'package:loadmore/core/network/api_client.dart';
import 'package:loadmore/data/models/movies_model.dart';
import 'package:loadmore/presentation/pages/home/widget/traller_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  


  
List<MoviesModel> movieList = [];

Future<void> getApi() async {
  const apiKey = '206c2602f5254a596f8060e767cd97dc';

  try {
    final response = await ApiClient.instance.fetchApi(
      url: 'https://api.themoviedb.org/3/movie/now_playing?api_key=$apiKey&language=vi-VN&page=1',
      method: HttpMethod.get,
    );

    final data = jsonDecode(response.body);
    final List results = data['results'];
     print(data);
    setState(() {
      movieList = results.map((e) => MoviesModel.fromJson(e)).toList();
    });
  } catch (e) {
    print('❌ Error: $e');
  }
}

 
@override
  void initState() {
    getApi();
    super.initState();
  }
  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white,
    body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
         CustomListView<MoviesModel>(
  isVertical: false,
  data: movieList,
  itemBuilder: (context, movie) => SizedBox(
    width: 160.w,
    child: CardMovieVertical(
      nameMoive: movie.title,
      image: 'https://image.tmdb.org/t/p/w500${movie.posterPath}',
      rating: movie.voteAverage,
      action: const ['hanh dong'],
      onTap: ()=>playTrailer(movie.id, context),
    ),
  ),
),

          ]
        ),
      ),
    ),
  );
}

  
}

