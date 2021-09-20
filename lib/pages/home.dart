import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movies_list/pages/movie_detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List movies = [];
  bool loading = true;
  // ignore: non_constant_identifier_names
  dynamic api_key, api_token, url;

  // var strMeal, strMealThumb, strCategory, strInstructions;
  // ignore: non_constant_identifier_names
  var original_title,
      overview,
      popularity,
      // ignore: non_constant_identifier_names
      poster_path,
      // ignore: non_constant_identifier_names
      release_date,
      // ignore: non_constant_identifier_names
      vote_average,
      // ignore: non_constant_identifier_names
      vote_count;

  int? id;
  bool? adult;

  @override
  void initState() {
    super.initState();
    api_key = dotenv.get('API_KEY');
    url =
        'https://api.themoviedb.org/4/list/1?page=1&api_key=4135c72c9f9c0d45cd5d3d022c9cbd7e';
    fetchMovies(url);
  }

  Future<void> fetchMovies(url) async {
    var res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      setState(() {
        movies = jsonDecode(res.body)['results'];
        loading = false;
      });
    }
  }

  setDetail(item, index) {
    setState(() {
      original_title = item[index]['original_title'];
      overview = item[index]['overview'];
      popularity = item[index]['popularity'];
      poster_path = item[index]['poster_path'];
      release_date = item[index]['release_date'];
      vote_average = item[index]['vote_average'];
      vote_count = item[index]['vote_count'];
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loading || movies.contains(null) || movies.isEmpty) {
      return Center(
        child: CircularProgressIndicator(
          color: Colors.indigo[900],
          strokeWidth: 4.0,
        ),
      );
    }
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.indigo[900],
          title: Container(
            width: 40.0,
            child: Image.asset('assets/images/appbar_logo.png'),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: ListView.builder(itemBuilder: (BuildContext context, int index) {
          return ConstrainedBox(
            constraints: BoxConstraints(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        setDetail(movies, index);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailMovie(
                                    originalTitle: original_title,
                                    overview: overview,
                                    popularity: popularity,
                                    posterPath: poster_path,
                                    releaseDate: release_date,
                                    voteAverage: vote_average,
                                    voteCount: vote_count)));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                flex: 2,
                                child: Container(
                                  height: 160,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                          bottomLeft: Radius.circular(16)),
                                      child: Image.network(
                                          "https://image.tmdb.org/t/p/w500${movies[index]['poster_path']}",
                                          fit: BoxFit.fill)),
                                ),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                  flex: 4,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        movies[index]['original_title'],
                                        style: GoogleFonts.montserrat(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        movies[index]['overview'],
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.montserrat(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey[800]),
                                      )
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }));
  }

  SizedBox buttonContentDefault(title) {
    return SizedBox(
      child: TextButton(
        onPressed: () {},
        child: Text(title,
            style: GoogleFonts.montserrat(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
                color: Colors.grey)),
        style: OutlinedButton.styleFrom(
            side: BorderSide(width: 2.0, color: Colors.grey),
            padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
      ),
    );
  }

  SizedBox buttonContent(title) {
    return SizedBox(
      child: TextButton(
        onPressed: () {},
        child: Text(title,
            style: GoogleFonts.montserrat(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
                color: Colors.white)),
        style: TextButton.styleFrom(
            backgroundColor: Colors.indigo[900],
            padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}
