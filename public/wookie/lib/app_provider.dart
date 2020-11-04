import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:wookie/data/repository/movie_repository.dart';
import 'package:wookie/di/get_it.dart' as getIt;
import 'package:wookie/view_models/movie_view_model.dart';

class AppProviders {
  static List<SingleChildWidget> get allProviders {
    final List<SingleChildWidget> viewModelProviders = [
      ChangeNotifierProvider(
        create: (context) =>
            MovieViewModel(getIt.getInstance<MovieRepository>()),
      ),
    ];

    return [
      ...viewModelProviders,
    ];
  }
}
