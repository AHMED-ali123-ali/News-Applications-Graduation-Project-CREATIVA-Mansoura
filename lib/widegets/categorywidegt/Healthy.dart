import 'package:flutter/material.dart';

import '../../model/articles.dart';
import '../../network/abi-service.dart';





class Helathy extends StatefulWidget {
  const Helathy({super.key});

  @override
  State<Helathy> createState() => _HelathyState();
}

class _HelathyState extends State<Helathy> {
  Api api = Api();
  List<Articles>? article;
  bool seview = false;

  @override
  void initState() {
    super.initState();
    getArticle();
  }

  getArticle() async {
    article = await api.news("general");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return article == null
        ? const SliverToBoxAdapter(
      child: Center(child: CircularProgressIndicator()),
    )
        : SliverList.builder(
          itemCount: article!.length,
          itemBuilder: (context, index) => Column(
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
                      article![index].urlToImage ?? "",
                      errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.broken_image, size: 80),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  article![index].title,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    seview = !seview;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    article![index].description ?? "",
                    overflow: seview
                        ? TextOverflow.visible
                        : TextOverflow.ellipsis,
                    maxLines: seview ? null : 2,
                    style: const TextStyle(
                        fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        );
  }
}