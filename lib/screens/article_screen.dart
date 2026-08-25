import 'package:flutter/material.dart';
import 'package:news_application/model/articles.dart';

import '../network/abi-service.dart';
class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key, required this.category});
  final String category;

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}



class _ArticleScreenState extends State<ArticleScreen> {
  List<Articles>? article;
  @override
  void initState() {
    super.initState();
    getArticleCategory();
  }
  Future<void> getArticleCategory() async {
    article = await Api().news(widget.category.toLowerCase());
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    bool isExpandedDescription = false;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text(" News ${widget.category}")),
      body:
      article == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: article!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  "ArticleDetailsScreen",
                  arguments: article![index],
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Image.network(
                      article![index].urlToImage ?? '',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    article![index].title,
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(height: 12),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isExpandedDescription = !isExpandedDescription;
                      });
                    },
                    child: Text(
                      maxLines: isExpandedDescription ? null : 2,
                      overflow:
                      isExpandedDescription
                          ? TextOverflow.visible
                          : TextOverflow.ellipsis,
                      article![index].description ?? "No Description",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}