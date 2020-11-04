import 'package:wookie/data/models/movie_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<Movies>> getMovie();
}
