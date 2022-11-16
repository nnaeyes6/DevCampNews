import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

import '../../../../data/model/news_article_model.dart';
import '../../../constants/constant_api.dart';

class SportsApiServices {
  Future<List<ArticleModel>> getSportsNews() async {
    var response = await get(Uri.parse(ApiConstants.sportsUrl));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['articles'];
      return result.map(((e) => ArticleModel.fromJson(e))).toList();
    } else {
      throw Exception(response.statusCode);
    }
  }
}

final apiSportsProvider =
    Provider<SportsApiServices>((ref) => SportsApiServices());
