// ignore_for_file: use_key_in_widget_constructors
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:movies_list/pages/home.dart';

class DetailMovie extends StatelessWidget {
  final String originalTitle, overview, posterPath, releaseDate;
  final dynamic voteAverage, popularity, voteCount;

  const DetailMovie({
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.indigo[900],
            size: 28,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_rounded,
                color: Colors.indigo[900],
                size: 28,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.share_rounded,
                color: Colors.indigo[900],
                size: 28,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.network(
                      'https://image.tmdb.org/t/p/w500$posterPath',
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              originalTitle,
                              style: GoogleFonts.montserrat(
                                  fontSize: 23.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            Row(
                              children: [
                                RichText(
                                  text: const TextSpan(
                                    children: [
                                      WidgetSpan(
                                        child: Icon(
                                          Icons.star_rounded,
                                          color: Colors.amber,
                                          size: 20.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  "$voteAverage Ratings",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey[800]),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 16.0,
                            ),
                            Text(
                              "Popularity: $popularity",
                              style: GoogleFonts.montserrat(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey[800]),
                            ),
                            Text(
                              "Vote count: $voteCount",
                              style: GoogleFonts.montserrat(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey[800]),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: 500,
              margin: EdgeInsets.only(top: 8),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Release Date',
                        style: GoogleFonts.montserrat(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Text(
                        releaseDate,
                        style: GoogleFonts.montserrat(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[800]),
                      ),
                      Divider(
                        thickness: 3.0,
                        height: 64.0,
                        color: Colors.grey[200],
                      ),
                      Text(
                        'Overview',
                        style: GoogleFonts.montserrat(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Text(
                        overview,
                        style: GoogleFonts.montserrat(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[800]),
                      ),
                      SizedBox(height: 16.0)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
