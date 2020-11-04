import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:wookie/data/core/api_client.dart';
import 'package:wookie/data/data_source/movie_remote_data_source.dart';
import 'package:wookie/data/data_source/movie_remote_data_source_impl.dart';
import 'package:wookie/data/repository/movie_repository.dart';
import 'package:wookie/data/repository/movie_repository_impl.dart';

final getInstance = GetIt.I;

Future init() async {
  getInstance.registerLazySingleton<Client>(() => Client());
  getInstance.registerLazySingleton<ApiClient>(() => ApiClient(getInstance()));
  getInstance.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(getInstance()));
      getInstance.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(getInstance()));
}
