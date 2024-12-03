import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotlight_news/ui/categories_widget/CategoriesWidget.dart';
import 'package:spotlight_news/ui/category_details/ArticlesList.dart';
import 'package:spotlight_news/ui/category_details/CategoryDetailsWidget.dart';
import 'package:spotlight_news/ui/home/CustomDrawer.dart';
import 'package:spotlight_news/ui/search_screen/SearchScreen.dart';
import 'package:spotlight_news/ui/settings_widget/SettingsWidget.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Widget selectedWidget;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedWidget = CategoriesWidget(onPress: showCategoryDetailsWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(image: AssetImage(
            "assets/images/bsckground.png",
        ),
          fit: BoxFit.fill
        )
      ),
      child: Scaffold(
        drawer: Drawer(
          child: CustomDrawer(
            onPress: selectDrawerItem,
          ),
        ),
        appBar: AppBar(
          title: Text("Spotlight News"),
          actions: [
            if(selectedWidget is CategoryDetailsWidget)
              IconButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => SearchScreen(selectedWidget: selectedWidget,),));
                  },
                  icon: Padding(
                    padding: REdgeInsets.symmetric(
                      horizontal: 44.w,
                      vertical:5.h,
                    ),
                    child: SvgPicture.asset("assets/images/search_icon.svg",
                      height: 27.h,
                      width: 30.w,
                    ),
                  )
              )
          ],
        ),
        body: selectedWidget,
      ),
    );
  }

  selectDrawerItem(DrawerTabs value){
    switch(value){

      case DrawerTabs.CATEGORIES:{
        setState(() {
          selectedWidget = CategoriesWidget(
            onPress: showCategoryDetailsWidget,
          );
          Navigator.pop(context);
        });
      }
      case DrawerTabs.SETTINGS:{
        setState(() {
          selectedWidget = SettingsWidget();
          Navigator.pop(context);
        });
      }
    }
  }
  showCategoryDetailsWidget(String category){
    setState(() {
      selectedWidget = CategoryDetailsWidget(category: category,);
    });
  }
}
enum DrawerTabs{
  CATEGORIES,
  SETTINGS
}
