import 'package:flutter/material.dart';
import 'package:wookie/data/models/movie_model.dart';
import 'package:wookie/data/repository/movie_repository.dart';
import 'package:wookie/utils/loading.dart';

class MovieViewModel extends ChangeNotifier {
  final MovieRepository movieRepository;
  LoadingStatus _fetchState = LoadingStatus.not_fetched;
  List<Movies> _movieList;
  MovieViewModel(this.movieRepository);

  Future<List<Movies>> getMovie() async {
    _fetchState = LoadingStatus.fetching;
    try {
      _movieList = await movieRepository.getMovie();
      if (_movieList != null) {
        _fetchState = LoadingStatus.done;
        notifyListeners();
      } else {
        _fetchState = LoadingStatus.not_fetched;
        notifyListeners();
      }
      return _movieList;
    } catch (e) {
      _fetchState = LoadingStatus.error;

      notifyListeners();
      print(e);
      return null;
    }
  }

  LoadingStatus get fetchState => _fetchState;
  List<Movies> get movieList => _movieList;
}
