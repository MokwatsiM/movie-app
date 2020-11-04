import 'package:flutter/material.dart';
import 'package:wookie/data/models/movie_model.dart';
import 'package:wookie/view_models/movie_view_model.dart';

class MovieCardWidget extends StatelessWidget {
  final Movies movies;
  final Function(Movies movieCard) onSelected;
  const MovieCardWidget({Key key, this.movies, this.onSelected})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      child: Card(
          child: Material(
        elevation: 32,
        borderRadius: BorderRadius.circular(16),
        child: GestureDetector(
          onTap: () {
            this.onSelected(movies);
          },
          child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  FractionallySizedBox(
                    alignment: Alignment.topCenter,
                    heightFactor: 0.9,
                    child: Image.network(
                      movies.poster,
                      fit: BoxFit.cover,
                    ),
                  ),
                  FractionallySizedBox(
                      alignment: Alignment.bottomCenter,
                      heightFactor: 0.1,
                      child: Text(movies.title))
                ],
              )),
        ),
      )),
    );
  }
}
