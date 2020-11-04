import 'package:wookie/data/data_source/movie_remote_data_source.dart';
import 'package:wookie/data/models/movie_model.dart';
import 'package:wookie/data/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource _movieRemoteDataSource;

  MovieRepositoryImpl(this._movieRemoteDataSource);
  @override
  Future<List<Movies>> getMovie() async {
    try {
      final movie = await _movieRemoteDataSource.getMovie();
      return movie;
    } catch (e) {
      print("Something went wrong" + e.toString());
      return null;
    }
  }
}
