import 'package:wookie/data/models/movie_model.dart';

abstract class MovieRepository{
  Future<List<Movies>> getMovie();
}