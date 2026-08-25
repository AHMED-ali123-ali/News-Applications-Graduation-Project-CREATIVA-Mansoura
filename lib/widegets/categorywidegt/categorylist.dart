import 'package:flutter/material.dart';
import 'package:news_application/model/articles.dart';
import 'package:news_application/network/abi-service.dart';

import '../../model/data.dart';
import 'category_item.dart';





Api apiservice= Api();
List<Articles>?vvv;

class categorylist extends StatefulWidget {


  @override
  State<categorylist> createState() => _categorylistState();
}

class _categorylistState extends State<categorylist> {
  @override
  Widget build(BuildContext context) {
    return
      vvv == null ?

      SliverToBoxAdapter(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ):
      SliverToBoxAdapter(
        child:    SizedBox(
          height: 160,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index){
              return categoryitem(value:news[index]);
            },itemCount: news.length,),
        )
      );

  }
  @override
  void initState() {
    getArticle();
    // TODO: implement initState
    super.initState();
  }
  getArticle()async{
    vvv= await apiservice.news('');
    setState(() {

    });


  }

}
