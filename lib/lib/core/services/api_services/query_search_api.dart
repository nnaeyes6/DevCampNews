import 'dart:convert';

import 'package:http/http.dart';

import '../../../data/model/news_article_model.dart';
import '../../constants/constant_api.dart';

class QueryServices {
static Future<List<ArticleModel>> searchQuery({required String query}) async {
    var response = await get(Uri.parse(ApiConstants.baseUrl));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['articles'];
      return result.map(((e) => ArticleModel.fromJson(e))).toList();
    } else {
      throw Exception(response.statusCode);
    }
  }
}