import 'package:flutter/material.dart';

import 'package:news_application/widegets/categorywidegt/Healthy.dart';

import '../widegets/categorywidegt/categorylist.dart';
class   HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.orangeAccent,
            pinned: true,
            snap: true,
            floating: true,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text("News App", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                ),
              ),
              background: Image.network('https://images.pexels.com/photos/2872418/pexels-photo-2872418.jpeg', fit: BoxFit.cover),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 10)),
          categorylist(),
          SliverToBoxAdapter(

            child:   Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('General news',style: TextStyle(fontSize: 30,color: Colors.orange,fontWeight: FontWeight.bold).copyWith(color:Colors.black),),
            ),
          ),
          SliverToBoxAdapter(
            child:SizedBox(height: 40,),
          ),
          SliverToBoxAdapter(
            child:SizedBox(height: 40,),
          ),
          Helathy(),
        ],
      )

      )
    ;}
}
