import 'package:coolmovies/modules/models/movie.dart';
import 'package:coolmovies/utils/helpers/shorten_string.dart';
import 'package:coolmovies/utils/helpers/theme.dart';
import 'package:flutter/material.dart';

class MovieReviewItem extends StatefulWidget {
  final MovieReview review;
  final Size size;

  const MovieReviewItem({
    Key? key,
    required this.review,
    required this.size,
  }) : super(key: key);

  @override
  _MovieReviewItemState createState() => _MovieReviewItemState();
}

class _MovieReviewItemState extends State<MovieReviewItem> {
  double _height = 125;

  @override
  void initState() {
    super.initState();
  }

  void _updateSize() {
    setState(() {
      _height = _height == 125 ? 250 : 125;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => _updateSize(),
        child: AnimatedSize(
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 600),
            child: Container(
                width: widget.size.width * 0.9,
                height: _height,
                padding: const EdgeInsets.all(10),
                color: getColor('item').withOpacity(0.2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Icon(
                              Icons.star,
                              size: 16,
                              color: Colors.yellowAccent[700],
                            )),
                        Text(widget.review.rating.toString(),
                            style: TextStyle(
                                color: getColor('text'),
                                fontWeight: FontWeight.bold,
                                fontSize: 14)),
                        const Padding(padding: EdgeInsets.only(right: 5)),
                        Text('• ${widget.review.title}',
                            style: TextStyle(
                                color: getColor('text'),
                                fontWeight: FontWeight.bold,
                                fontSize: 14)),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 5)),
                    Text(widget.review.reviewer.name,
                        style: TextStyle(
                            color: getColor('text-dark'), fontSize: 14)),
                    const Padding(padding: EdgeInsets.only(bottom: 10)),
                    Text(shortenString(widget.review.body, 150),
                        style:
                            TextStyle(color: getColor('text'), fontSize: 14)),
                  ],
                ))));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
