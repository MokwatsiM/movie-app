import 'package:flutter/material.dart';
import 'package:wookie/data/models/movie_model.dart';
import 'dart:ui' as ui;

class MovieDetailPage extends StatelessWidget {
  final Movies movies;

  const MovieDetailPage({Key key, this.movies}) : super(key: key);
  DateTime getDateByString(date) {
    var parsedDate = DateTime.parse(date);
    return parsedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(movies.backdrop, fit: BoxFit.cover),
            BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(20.0),
                child: Column(children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: Container(
                      width: 400.0,
                      height: 400.0,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                            image: NetworkImage(movies.poster),
                            fit: BoxFit.cover),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 20.0,
                              offset: Offset(0.0, 10.0))
                        ]),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 0.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Text(
                          movies.title,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30.0,
                              fontFamily: 'Arvo'),
                        )),
                        Text(
                          '${movies.imdbRating.toString()}/10',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontFamily: 'Arvo'),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 0.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Text(
                          "Year: " +
                              getDateByString(movies.releasedOn)
                                  .year
                                  .toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30.0,
                              fontFamily: 'Arvo'),
                        )),
                        Text("|"),
                        Text(
                          '${movies.length}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontFamily: 'Arvo'),
                        ),
                      ],
                    ),
                  ),
                  Text(movies.overview,
                      style:
                          TextStyle(color: Colors.white, fontFamily: 'Arvo')),
                  Padding(padding: const EdgeInsets.all(10.0)),
                  Padding(padding: const EdgeInsets.all(10.0)),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Container(
                        width: 150.0,
                        height: 60.0,
                        alignment: Alignment.center,
                        child: Text(
                          'Rate Movie',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Arvo',
                              fontSize: 20.0),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: const Color(0xaa3C3261)),
                      )),
                      new Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.share,
                            color: Colors.white,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: const Color(0xaa3C3261)),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.bookmark,
                              color: Colors.white,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: const Color(0xaa3C3261)),
                          )),
                    ],
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
