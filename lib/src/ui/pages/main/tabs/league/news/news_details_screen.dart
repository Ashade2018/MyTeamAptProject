import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:league_app/src/data/app_colors.dart';
import 'package:league_app/src/data/app_strings.dart';
import 'package:league_app/src/models/article.dart';
import 'package:league_app/src/util/date_time_util.dart';

class NewsDetailsScreen extends StatelessWidget {
  final Article article;

  const NewsDetailsScreen({Key key, @required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Text(
          AppStrings.news,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildNewsInformation(),
            _buildCoverImage(),
            _buildNewsText(),
          ],
        ),
      ),
    );
  }

  Widget _buildNewsText() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        article.body,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildCoverImage() {
    return AspectRatio(
      aspectRatio: 5 / 3,
      child: Image.network(
        article.image,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Widget _buildNewsInformation() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              toBeginningOfSentenceCase(article.section),
              style: TextStyle(
                color: AppColors.accentColor,
                fontStyle: FontStyle.italic,
                fontSize: 14.0,
              ),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              article.title,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(article.author,
                style: TextStyle(color: Colors.white, fontSize: 14.0)),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              DateTimeUtil().getDateString(article.publishedDate),
              style: TextStyle(color: Colors.white54, fontSize: 12.0),
            ),
          ),
        ],
      ),
    );
  }
}
