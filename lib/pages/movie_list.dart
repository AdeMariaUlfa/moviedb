import 'package:flutter/material.dart';
import 'package:moviedb/service/http_service.dart';
import 'movie_detail.dart';

class MovieList extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  int moviesCount;
  List movies;
  HttpService service;

  Future initialize() async {
    movies = [];
    movies = await service.getPopularMovies();
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }

  @override
  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("POPULAR  MOVIES"),
      ),
      // body: ListView.builder(
      //   itemCount: (this.moviesCount == null) ? 0 : this.moviesCount,
      //   itemBuilder: (context, int position) {
      //     return Card(
      //       color: Colors.white,
      //       elevation: 2.0,
      //       child: ListTile(
      //         leading: Image.network('https://image.tmdb.org/t/p/w500/' +
      //             movies[position].posterPath),
      //         title: Text(movies[position].title),
      //         subtitle: Text(
      //           'Rating = ' + movies[position].voteAverage.toString(),
      //         ),
      //         onTap: () {
      //           MaterialPageRoute route = MaterialPageRoute(
      //               builder: (_) => MovieDetail(movies[position]));
      //           Navigator.push(context, route);
      //         },
      //       ),
      //     );
      //   },
      // )
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
            mainAxisExtent: 200,
          ),
          itemCount: (this.moviesCount == null) ? 0 : this.moviesCount,
          itemBuilder: (context, int position) {
            return InkResponse(
              child: Image.network('https://image.tmdb.org/t/p/w500/' +
                  movies[position].posterPath),
              onTap: () {
                MaterialPageRoute route = MaterialPageRoute(
                    builder: (_) => MovieDetail(movies[position]));
                Navigator.push(context, route);
              },
            );
          },
        ),
      ),
    );
  }
}
