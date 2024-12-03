import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotlight_news/model/SourcesResponse/Source.dart';
import 'package:spotlight_news/remote/ApiManger.dart';
import 'package:spotlight_news/ui/category_details/ArticlesList.dart';

class CategoryDetailsWidget extends StatefulWidget {
  String category;
  CategoryDetailsWidget({super.key,required this.category});

  @override
  State<CategoryDetailsWidget> createState() => _CategoryDetailsWidgetState();
}

class _CategoryDetailsWidgetState extends State<CategoryDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManger.getSources(widget.category),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          if(snapshot.hasError){
            return Column(
              children: [
                Text(snapshot.error.toString()),
                ElevatedButton(onPressed: (){
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
                ElevatedButton(onPressed: (){
                  setState(() {

                  });
                }, child: Text("Try again"))
              ],
            );
          }
          List<Source> sources = response?.sources??[];
          return DefaultTabController(
              length: sources.length,
              child: Padding(
                  padding: REdgeInsets.all(16),
                child: Column(
                  children: [
                    TabBar(
                        isScrollable: true,
                        indicator: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(25.r)
                        ),
                        labelColor: Colors.white,
                        dividerHeight: 0,
                        unselectedLabelColor: Theme.of(context).colorScheme.primary,
                        tabs: sources.map((source) => Tab(
                       child: Container(
                        padding: REdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 7,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Theme.of(context).colorScheme.primary),
                          borderRadius: BorderRadius.circular(25.r)
                        ),
                        child: Text(source.name??""),
                      ),
                    )).toList()
                    ),
                    SizedBox(height: 10.h,),
                    Expanded(
                      child: TabBarView(children: sources.map((source) => Articleslist(
                        source.id??""
                      )).toList()
                                        ,
                    ))],
                ),
              ));
        },
    );
  }
}
