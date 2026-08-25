import 'package:flutter/material.dart';

import '../../model/data.dart';
import '../../screens/article_screen.dart';
class categoryitem extends StatelessWidget {
 final Category value;




  const categoryitem({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return
     Padding(
       padding: const EdgeInsets.all(2.0),
        child: InkWell(
          onTap: (){
            Navigator.push(context ,MaterialPageRoute(builder: (_) {
             return ArticleScreen(category: value.name,);
            }));
          },
          child: CircleAvatar(
                radius:80 ,
                backgroundImage:NetworkImage (value.imageUrl),
                child: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Text(value.name,style: TextStyle(fontSize: 25,color: Colors.white),),
                ),

            ),

        ),
      );
  }
}
