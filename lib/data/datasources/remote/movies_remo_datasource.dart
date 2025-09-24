import 'dart:convert';
import 'package:loadmore/core/network/api_client.dart';
import 'package:loadmore/data/models/actor_model.dart';
import 'package:loadmore/data/models/cast_model.dart';
import 'package:loadmore/data/models/genre_model.dart';
import 'package:loadmore/data/models/language_model.dart';
import 'package:loadmore/data/models/movie_detail_model.dart';
import 'package:loadmore/data/models/movies_model.dart';
import 'package:loadmore/data/models/video_model.dart';

abstract class MovieRemoteDataSource {
  // Movie listings
  Future<List<MoviesModel>> getPopularMovies();
  Future<List<MoviesModel>> getTopRatedMovies();
  Future<List<MoviesModel>> getUpcomingMovies();
  
  // Movie details
  //Future<MovieDetailModel> getMovieDetail(String movieId);
  Future<List<CastModel>> getCast(String movieId);
  Future<List<VideoModel>> getVideos(String movieId);
  
  // Movie metadata
  Future<List<GenreModel>> getGenres();
  Future<List<LanguageModel>> getLanguages();
  Future<List<ActorModel>> getActors(String movieId);
  
  // Movie search
  Future<List<MoviesModel>> searchMovies(String query);
  Future<List<MoviesModel>> filterMovies({
    List<String>? genreIds,
    List<String>? languageIds,
    DateTime? fromDate,
    DateTime? toDate,
    double? minRating,
  });
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final ApiClient apiClient;
  final String apiKey;
  final String baseUrl;

  MovieRemoteDataSourceImpl({
    required this.apiClient,
    required this.apiKey,
    required this.baseUrl,
  });

  Future<List<MoviesModel>> _getMovieList(String endpoint) async {
    final response = await apiClient.fetchApi(
      method: HttpMethod.get,
      url: '$baseUrl/movie/$endpoint?api_key=$apiKey&language=en-US&page=1',
    );

    final List list = jsonDecode(response.body)['results'];
    return list.map((e) => MoviesModel.fromJson(e)).toList();
  }

  @override
  Future<List<MoviesModel>> getPopularMovies() => _getMovieList('popular');

  @override
  Future<List<MoviesModel>> getTopRatedMovies() => _getMovieList('top_rated');

  @override
  Future<List<MoviesModel>> getUpcomingMovies() => _getMovieList('upcoming');

  // @override
  // Future<MovieDetailModel> getMovieDetail(String movieId) async {
  //   // final response = await apiClient.fetchApi(
  //   //   method: HttpMethod.get,
  //   //   url:
  //   //       '$baseUrl/movie/$movieId?api_key=$apiKey&language=en-US&append_to_response=videos,credits,recommendations',
  //   // );

  //   // return MovieDetailModel.fromJson(jsonDecode(response.body));
  // }

  @override
  Future<List<CastModel>> getCast(String movieId) async {
    final response = await apiClient.fetchApi(
      method: HttpMethod.get,
      url: '$baseUrl/movie/$movieId/credits?api_key=$apiKey&language=en-US',
    );

    final List list = jsonDecode(response.body)['cast'];
    return list.map((e) => CastModel.fromJson(e)).toList();
  }

  @override
  Future<List<VideoModel>> getVideos(String movieId) async {
    final response = await apiClient.fetchApi(
      method: HttpMethod.get,
      url: '$baseUrl/movie/$movieId/videos?api_key=$apiKey&language=en-US',
    );

    final List list = jsonDecode(response.body)['results'];
    return list.map((e) => VideoModel.fromJson(e)).toList();
  }

  @override
  Future<List<GenreModel>> getGenres() async {
    final response = await apiClient.fetchApi(
      method: HttpMethod.get,
      url: '$baseUrl/genre/movie/list?api_key=$apiKey&language=en-US',
    );

    final List list = jsonDecode(response.body)['genres'];
    return list.map((e) => GenreModel.fromJson(e)).toList();
  }

  @override
  Future<List<LanguageModel>> getLanguages() async {
    final response = await apiClient.fetchApi(
      method: HttpMethod.get,
      url: '$baseUrl/configuration/languages?api_key=$apiKey',
    );

    return (jsonDecode(response.body) as List)
        .map((e) => LanguageModel.fromJson(e))
        .toList();
  }

  @override
  Future<List<ActorModel>> getActors(String movieId) async {
    final response = await apiClient.fetchApi(
      method: HttpMethod.get,
      url: '$baseUrl/movie/$movieId/credits?api_key=$apiKey&language=en-US',
    );

    final List list = jsonDecode(response.body)['cast'];
    return list.map((e) => ActorModel.fromJson(e)).toList();
  }

  @override
  Future<List<MoviesModel>> searchMovies(String query) async {
    final response = await apiClient.fetchApi(
      method: HttpMethod.get,
      url: '$baseUrl/search/movie?api_key=$apiKey&language=en-US&query=$query&page=1',
    );

    final List list = jsonDecode(response.body)['results'];
    return list.map((e) => MoviesModel.fromJson(e)).toList();
  }

  @override
  Future<List<MoviesModel>> filterMovies({
    List<String>? genreIds,
    List<String>? languageIds,
    DateTime? fromDate,
    DateTime? toDate,
    double? minRating,
  }) async {
    var url = '$baseUrl/discover/movie?api_key=$apiKey&language=en-US';
    
    if (genreIds != null && genreIds.isNotEmpty) {
      url += '&with_genres=${genreIds.join(',')}';
    }
    
    if (languageIds != null && languageIds.isNotEmpty) {
      url += '&with_original_language=${languageIds.join('|')}';
    }
    
    if (fromDate != null) {
      url += '&primary_release_date.gte=${fromDate.toIso8601String()}';
    }
    
    if (toDate != null) {
      url += '&primary_release_date.lte=${toDate.toIso8601String()}';
    }
    
    if (minRating != null) {
      url += '&vote_average.gte=$minRating';
    }

    final response = await apiClient.fetchApi(
      method: HttpMethod.get,
      url: url,
    );

    final List list = jsonDecode(response.body)['results'];
    return list.map((e) => MoviesModel.fromJson(e)).toList();
  }
}
