import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotlight_news/model/CategoryModel.dart';
import 'package:spotlight_news/ui/categories_widget/CategoryItem.dart';

class CategoriesWidget extends StatelessWidget {
  void Function(String category) onPress;
   CategoriesWidget({super.key,required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  REdgeInsets.all(36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '''Pick your category
of interest''',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w700
            ),
          ),
          SizedBox(height: 29.h,),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  childAspectRatio: 1.w/1.h,
                  mainAxisSpacing: 20.h,
                  crossAxisSpacing: 25.w,
                ),
                itemBuilder: (context, index) => CategoryItem(
                  onPress: onPress,
                    categoryModel: CategoryModel.categories[index],
                    index: index),
                itemCount: CategoryModel.categories.length,
            ),
          )
        ],
      ),
    );
  }
}
