import 'package:flutter/material.dart';
import 'package:spotlight_news/model/ArticleModel.dart';
import 'package:spotlight_news/model/ArticlesResponse/Article.dart';
import 'package:spotlight_news/remote/ApiManger.dart';
import 'package:spotlight_news/ui/category_details/ArticleItem.dart';

class Articleslist extends StatefulWidget {
  String sourceId;
  Articleslist( this.sourceId);

  @override
  State<Articleslist> createState() => _ArticleslistState();
}

class _ArticleslistState extends State<Articleslist> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManger.getAtricles(widget.sourceId),
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          if(snapshot.hasError){
            return Column(
              children: [
                Text(snapshot.error?.toString()??""),
                ElevatedButton(
                    onPressed: (){
                      setState(() {

                      });
                    },
                    child: Text("Try again"))
              ],
            );
          }
          var response = snapshot.data;
          if(response?.status == "error"){
            return Column(
              children: [
                Text(response?.message??""),
                ElevatedButton(
                    onPressed: (){
                      setState(() {

                      });
                    },
                    child: Text("Try again"))
              ],
            );
          }
          List<Article> aricles = response?.articles??[];
          return ListView.separated(
              itemBuilder: (context, index) => ArticleItem(
                article: aricles[index],
              ),
              separatorBuilder: (context, index) => Divider(),
              itemCount: aricles.length);
        },
    );
  }
}
