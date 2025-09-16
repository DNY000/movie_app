import 'dart:convert';
import 'package:loadmore/core/network/api_client.dart';
import 'package:loadmore/data/models/model_detail_model.dart';
import 'package:loadmore/data/models/movies_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MoviesModel>> getPopularMovies();
  Future<List<MoviesModel>> getTopRatedMovies();
  Future<List<MoviesModel>> getUpcomingMovies();
  Future<MovieDetailModel> getMovieDetail(int movieId);
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

  @override
  Future<MovieDetailModel> getMovieDetail(int movieId) async {
    final response = await apiClient.fetchApi(
      method: HttpMethod.get,
      url: '$baseUrl/movie/$movieId?api_key=$apiKey&language=en-US&append_to_response=videos,credits,recommendations',
    );

    return MovieDetailModel.fromJson(jsonDecode(response.body));
  }
}
