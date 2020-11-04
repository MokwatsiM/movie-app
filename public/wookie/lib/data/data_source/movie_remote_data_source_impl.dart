import 'package:wookie/data/core/api_client.dart';
import 'package:wookie/data/data_source/movie_remote_data_source.dart';
import 'package:wookie/data/models/movie_model.dart';

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final ApiClient _client;

  MovieRemoteDataSourceImpl(this._client);

  @override
  Future<List<Movies>> getMovie() async {
    final response = await _client.get();
    final List<Movies> movies = MovieModel.fromJson(response).movies;
    return movies;
  }
}
