import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/appbar.dart';
import '../../../data/Lists/category_data_list.dart';
import '../../../core/services/riverpod_services/data_provider.dart';
import '../../../data/model/news_article_model.dart';
import 'article.dart';
import 'category_screens/business.dart';
import 'category_screens/general.dart';
import 'category_screens/health.dart';
import 'category_screens/science.dart';
import 'category_screens/sports.dart';
import 'category_screens/technology.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(userDataProvider);

    List screens = const [
      BusinessNews(),
      GeneralNews(),
      HealthNews(),
      ScienceNews(),
      SportNews(),
      TechnologyNews(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarHome(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CarouselSlider.builder(
                itemCount: dataList.length,
                itemBuilder: ((context, index, realIndex) {
                  return InkWell(
                    onTap: () {
                      Navigator.push((context),
                          MaterialPageRoute(builder: (context) {
                        return screens[index];
                      }));
                    },
                    child: CategoryCard(
                      categoryCardName: dataList[index].categoryName,
                      imageUrl: dataList[index].imageUrl,
                    ),
                  );
                }),
                options: CarouselOptions(
                  height: 150.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 2000),
                  viewportFraction: 0.95,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              data.when(
                data: (data) {
                  List<ArticleModel> articleList = data!.map((e) => e).toList();

                  // Blogs
                  return Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: articleList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: (() {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ArticleNews(
                                        articles: articleList[index],
                                      )));
                            }),
                            child: BlogCard(
                              blogDescripion:
                                  articleList[index].description.toString(),
                              blogIimageUrl:
                                  articleList[index].urlToImage.toString(),
                              blogCardName: articleList[index]
                                  .title
                                  .toString()
                                  .toString(),
                            ),
                          );
                        }),
                  );
                },
                error: ((error, stackTrace) => Text(error.toString())),
                loading: () => const Center(
                  child: Center(child: CircularProgressIndicator()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CategoryCard extends StatelessWidget {
  CategoryCard({super.key, this.categoryCardName, this.imageUrl});
  String? imageUrl, categoryCardName;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: imageUrl!,
              height: 150,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(bottom: 10, left: 10),
            child: Text(
              categoryCardName!,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class BlogCard extends StatelessWidget {
  BlogCard(
      {super.key,
      required this.blogCardName,
      required this.blogIimageUrl,
      required this.blogDescripion});
  String blogIimageUrl, blogCardName, blogDescripion;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          Text(
            blogCardName,
            style: const TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
          ),
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(imageUrl: blogIimageUrl)),
          Text(
            blogDescripion,
            style: const TextStyle(
                color: Colors.black54,
                fontSize: 18,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
