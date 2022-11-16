import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/model/news_article_model.dart';
import '../api_services/api_services.dart';
import '../api_services/category_api/business_api.dart';
import '../api_services/category_api/entertainment_api.dart';
import '../api_services/category_api/general_api.dart';
import '../api_services/category_api/health_api.dart';
import '../api_services/category_api/science_api.dart';
import '../api_services/category_api/sports_api.dart';

final userDataProvider = FutureProvider<List<ArticleModel>?>((ref) async {
  return ref.watch(userProvider).getUsers();
});

final businessDataProvider = FutureProvider<List<ArticleModel>?>((ref) async {
  return ref.watch(apiBusinessProvider).getBusinessNews();
});

final entertainmentDataProvider =
    FutureProvider<List<ArticleModel>?>((ref) async {
  return ref.watch(apiEntertainmentProvider).getEntertainmentNews();
});
final generalDataProvider = FutureProvider<List<ArticleModel>?>((ref) async {
  return ref.watch(apiGeneralProvider).getGeneralNews();
});
final healthDataProvider = FutureProvider<List<ArticleModel>?>((ref) async {
  return ref.watch(apiHealthProvider).getHealthNews();
});
final scienceDataProvider = FutureProvider<List<ArticleModel>?>((ref) async {
  return ref.watch(apiScienceProvider).getScienceNews();
});
final sportsDataProvider = FutureProvider<List<ArticleModel>?>((ref) async {
  return ref.watch(apiSportsProvider).getSportsNews();
});
