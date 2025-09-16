import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_popular_movies.dart';
import '../../domain/entities/movies_entity.dart';

// -------------------- EVENT --------------------
abstract class PopularMoviesEvent {}

class FetchPopularMovies extends PopularMoviesEvent {}

// -------------------- STATE --------------------
abstract class PopularMoviesState {}

class PopularMoviesInitial extends PopularMoviesState {}

class PopularMoviesLoading extends PopularMoviesState {}

class PopularMoviesLoaded extends PopularMoviesState {
  final List<MoviesEntity> movies;
  PopularMoviesLoaded(this.movies);
}

class PopularMoviesError extends PopularMoviesState {
  final String message;
  PopularMoviesError(this.message);
}

// -------------------- BLOC --------------------
class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final GetPopularMovies getPopularMovies;

  PopularMoviesBloc(this.getPopularMovies) : super(PopularMoviesInitial()) {
    on<FetchPopularMovies>((event, emit) async {
      emit(PopularMoviesLoading());
      try {
        final movies = await getPopularMovies();
        emit(PopularMoviesLoaded(movies));
      } catch (e) {
        emit(PopularMoviesError(e.toString()));
      }
    });
  }
}
