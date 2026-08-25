import 'package:flutter/material.dart';

import 'package:news_application/model/articles.dart';
import 'package:news_application/network/abi-service.dart';

class Farmer extends StatefulWidget {
  const Farmer({super.key});

  @override
  State<Farmer> createState() => _FarmerState();
}

class _FarmerState extends State<Farmer> {
  Api api = Api();

  List<Articles>? article;

  bool Seview = false;

  @override
  void initState() {
    super.initState();
    getArticle();
  }

  Future<void> getArticle() async {
    article = await api.news("business");

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (article == null) {
      return const SliverToBoxAdapter(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (article!.isEmpty) {
      return const SliverToBoxAdapter(
        child: Center(
          child: Text(
            "لا توجد أخبار",
            style: TextStyle(fontSize: 20),
          ),
        ),
      );
    }

    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {},
              splashColor: Colors.orange,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(
                  article![0].urlToImage ?? "",
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: double.infinity,
                      height: 250,
                      color: Colors.grey[300],
                      child: const Icon(
                        Icons.image_not_supported,
                        size: 50,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              article![0].title ?? "",
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          InkWell(
            onTap: () {
              setState(() {
                Seview = !Seview;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                article![0].description ?? "",
                overflow: Seview
                    ? TextOverflow.visible
                    : TextOverflow.ellipsis,
                maxLines: Seview ? null : 2,
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}