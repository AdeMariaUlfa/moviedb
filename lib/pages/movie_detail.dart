import 'package:flutter/material.dart';
import 'package:moviedb/models/movie.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  final String imgPath = 'https://image.tmdb.org/t/p/w500/';

  MovieDetail(this.movie);

  @override
  Widget build(BuildContext context) {
    String path;
    if (movie.posterPath != null) {
      path = imgPath + movie.posterPath;
    } else {
      path =
          'https://images.freeimages.com/images/large-previews/Seb/movie-clapboard-1184339.jpg';
    }
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.all(16),
                  height: height / 1.5,
                  child: Image.network(path)),
              Container(
                child: Text(movie.title,
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                padding: EdgeInsets.all(15),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(2, 10, 0, 10),
                child: Text('rating : ' + movie.voteAverage.toString(),
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              ),
              Container(
                child: Text('Overview : ' + movie.overview,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
                padding: EdgeInsets.all(25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
