import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:loadmore/core/network/api_client.dart';
import 'package:loadmore/data/datasources/remote/auth_remote_datasource.dart';
import 'package:loadmore/data/datasources/remote/movies_remo_datasource.dart';
import 'package:loadmore/data/repositories/auth_repository_imp.dart';
import 'package:loadmore/data/repositories/movies_repository_imp.dart';
import 'package:loadmore/domain/repositories/auth_repositories.dart';
import 'package:loadmore/domain/repositories/movies_repository.dart';
import 'package:loadmore/domain/usecases/auth_state_changes.dart';
import 'package:loadmore/domain/usecases/get_current_user.dart';
import 'package:loadmore/domain/usecases/get_popular_movies.dart';
import 'package:loadmore/domain/usecases/sign_in_email_password.dart';
import 'package:loadmore/domain/usecases/sign_in_with_google.dart';
import 'package:loadmore/domain/usecases/sign_out.dart';
import 'package:loadmore/domain/usecases/sign_up.dart';
import 'package:loadmore/presentation/blocs/popular_movies_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// khởi tạo cho cả dự án 
final sl = GetIt.instance;

Future<void> init() async {
  // BLoC
  sl.registerFactory(() => PopularMoviesBloc(sl()));

  // Use Cases
  sl.registerLazySingleton(() => GetPopularMovies(sl()));
  sl.registerLazySingleton(() => SignInWithEmailPassword(sl()));
  sl.registerLazySingleton(() => SignInWithGoogle(sl()));
  sl.registerLazySingleton(() => SignUp(sl()));
  sl.registerLazySingleton(() => SignOut(sl()));
  sl.registerLazySingleton(() => GetCurrentUser(sl()));
  sl.registerLazySingleton(() => AuthStateChanges(sl()));

  // Repository
  sl.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(sl()));
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  // Data Source
  sl.registerLazySingleton<MovieRemoteDataSource>(() => MovieRemoteDataSourceImpl(
        apiClient: sl(),
        apiKey: 'YOUR_API_KEY', // <- bạn có thể lấy từ .env hoặc constants
        baseUrl: 'https://api.themoviedb.org/3',
      ));
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(Supabase.instance.client));

  // API Client
  sl.registerLazySingleton(() => ApiClient());

  // HTTP client (nếu cần dùng trực tiếp)
  sl.registerLazySingleton(() => http.Client());
}
