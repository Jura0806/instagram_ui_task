import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_ui_task/navigation_page/account_page.dart';
import 'package:instagram_ui_task/navigation_page/home_page.dart';
import 'package:instagram_ui_task/navigation_page/like_page.dart';
import 'package:instagram_ui_task/navigation_page/newpost_page.dart';
import 'package:instagram_ui_task/navigation_page/search_page.dart';

import 'navigation_bar.dart';


class CollectPage extends StatefulWidget {
static final String id = "home_page";
  @override
  _CollectPageState createState() => _CollectPageState();
}

class _CollectPageState extends State<CollectPage> {

  int indexPage  = 0 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: getBottomNavigationBar(),
      body: getBody() ,
    );
  }

   Widget getBottomNavigationBar(){
    return Container(
      height: 70,
     decoration: BoxDecoration(
       //color: Colors.white,
       border: Border(top: BorderSide(width: 1, color: Colors.grey.shade400)),
     ),
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(icons.length, (index) {
            return IconButton(onPressed: (){
              setState(() {
                indexPage = index;
              });
            },
              icon: SvgPicture.asset(
                indexPage == index
                    ? icons[index]["active"].toString()
                    : icons[index]["inActive"].toString(),
                height: 25,
              ),
            );
          })
        ),
      ),
    );
   }
   Widget getBody(){
    return IndexedStack(
      index: indexPage,
      children: [
        HomePage(),
        SearchPage(),
        NewPostPage(),
        LikePage(),
        AccountPage(),
      ],
    );
   }
}
