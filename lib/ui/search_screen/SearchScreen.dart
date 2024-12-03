import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotlight_news/main.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = "search";
   Widget? selectedWidget;
   SearchScreen({super.key,required this.selectedWidget});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
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
        appBar: AppBar(
          title: Container(
            height: 48.h,
            width: 343.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.r)
            ),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none
                ),
                  contentPadding: EdgeInsets.fromLTRB(30.0, 10.0, 20.0, 10.0),
                  hintText: "Search Article",
                hintStyle: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.28),
                ),

                prefixIcon: IconButton(
                    onPressed: (){
                      setState(() {
                        controller.clear();
                        FocusScope.of(context).unfocus();
                      });
                    },
                    icon: Icon(Icons.close,
                      color: Theme.of(context).colorScheme.primary,
                      size: 30.sp,
                    )),
                suffixIcon: Icon(Icons.search,
                size: 30.sp,
                color: Theme.of(context).colorScheme.primary,
              )
            ),
              ),
          ),
          ),
        body: widget.selectedWidget,
      ),
    );
  }
}
