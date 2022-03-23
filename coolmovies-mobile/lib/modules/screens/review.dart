import 'package:coolmovies/modules/models/movie.dart';
import 'package:coolmovies/utils/helpers/theme.dart';
import 'package:coolmovies/utils/services/movie_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Review extends StatefulWidget {
  const Review({Key? key}) : super(key: key);

  @override
  _ReviewState createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  MovieService? movieService;
  Movie? actualMovie;
  int rating = 0;
  final ratingController = TextEditingController();
  final commentController = TextEditingController();

  @override
  void initState() {
    super.initState();

    movieService = Provider.of<MovieService>(context, listen: false);

    actualMovie = movieService!.selectedMovie;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    final action = arguments["action"];

    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: getColor('background'),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(size.height * .065),
          child: Container(
            alignment: AlignmentDirectional.centerStart,
            padding: EdgeInsets.zero,
            color: getColor('header'),
            width: size.width * .8,
            height: size.height * .175,
            child: Row(children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )),
              const Padding(padding: EdgeInsets.only(right: 10)),
              Text(action == 'add' ? 'Add review' : 'Edit review',
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18))
            ]),
          )),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(children: [
                    Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Icon(
                          Icons.star,
                          size: 16,
                          color: Colors.yellowAccent[700],
                        )),
                    Text(
                      'Rating',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: getColor('text')),
                    ),
                  ]),
                  const Padding(
                      padding: EdgeInsets.only(
                    top: 15,
                  )),
                  TextField(
                    maxLines: 1,
                    maxLength: 3,
                    controller: ratingController,
                    cursorColor: getColor('text-dark'),
                    style: TextStyle(color: getColor('text')),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(15),
                      hintText: 'Add rating',
                      counterText: '',
                      hintStyle: TextStyle(
                          fontSize: 15,
                          color: getColor('text').withOpacity(0.5)),
                      filled: true,
                      fillColor: getColor('item').withOpacity(0.2),
                      counterStyle: TextStyle(color: getColor('text-dark')),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: getColor('header'),
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                      padding: EdgeInsets.only(
                    bottom: 20,
                  )),
                  Text(
                    'Comments',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: getColor('text')),
                  ),
                  const Padding(
                      padding: EdgeInsets.only(
                    top: 15,
                  )),
                  TextField(
                    maxLines: 6,
                    maxLength: 350,
                    controller: commentController,
                    cursorColor: getColor('text-dark'),
                    style: TextStyle(color: getColor('text')),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(15),
                      hintText: 'Add comments',
                      counterText: '',
                      hintStyle: TextStyle(
                          fontSize: 15,
                          color: getColor('text').withOpacity(0.5)),
                      filled: true,
                      fillColor: getColor('item').withOpacity(0.2),
                      counterStyle: TextStyle(color: getColor('text-dark')),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: getColor('header'),
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 15),
                          primary: getColor('bubble-dark')),
                      onPressed: ratingController.text.isEmpty ||
                              commentController.text.isEmpty
                          ? null
                          : () {
                              print('on');
                            },
                      child: Text(action == 'add' ? 'Add' : 'Edit'),
                    ),
                  ],
                ),
              ])),
    ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
