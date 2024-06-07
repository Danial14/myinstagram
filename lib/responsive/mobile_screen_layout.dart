import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myinstagram/models/user.dart';
import 'package:myinstagram/providers/user_provider.dart';
import 'package:myinstagram/utils/colors.dart';
import 'package:myinstagram/utils/global_variables.dart';
import 'package:provider/provider.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});
  @override
  State<MobileScreenLayout> createState() {
    return _MobileScreenLayoutState();
  }
}
class _MobileScreenLayoutState extends State<MobileScreenLayout>{
  PageController _pageController = PageController();
  int _page = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    //User user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      bottomNavigationBar: Platform.isAndroid ? BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (page){
          _pageController.jumpToPage(page);
        },
        backgroundColor: mobileBackgroundColor,
        items: [
          BottomNavigationBarItem(icon: Icon(
            Icons.home,
            color: _page == 0 ? primaryColor : secondaryColor,
          ),
            label: "",
          ),
          BottomNavigationBarItem(icon: Icon(
            Icons.search,
            color: _page == 1 ? primaryColor : secondaryColor,
          ),
            label: "",
          ),
          BottomNavigationBarItem(icon: Icon(
            Icons.add_circle_outline,
            color: _page == 2 ? primaryColor : secondaryColor,
          ),
            label: "",
          )
          ,
          BottomNavigationBarItem(icon: Icon(
            Icons.person,
            color: _page == 3 ? primaryColor : secondaryColor,
          ),
            label: "",
          ),
          BottomNavigationBarItem(icon: Icon(
            Icons.favorite,
            color: _page == 4 ? primaryColor : secondaryColor,
          ),
            label: "",
          )
        ],
      ) : CupertinoTabBar(backgroundColor: mobileBackgroundColor,
        onTap: (page){
          _pageController.jumpTo(page as double);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(
            Icons.home,
            color: _page == 0 ? primaryColor : secondaryColor,
          ),
            label: "",
          ),
          BottomNavigationBarItem(icon: Icon(
            Icons.search,
            color: _page == 1 ? primaryColor : secondaryColor,
          ),
            label: "",
          ),
          BottomNavigationBarItem(icon: Icon(
            Icons.add_circle_outline,
            color: _page == 2 ? primaryColor : secondaryColor,
          ),
            label: "",
          ),
          BottomNavigationBarItem(icon: Icon(
            Icons.person,
            color: _page == 3 ? primaryColor : secondaryColor,
          ),
            label: "",
          ),
          BottomNavigationBarItem(icon: Icon(
            Icons.favorite,
            color: _page == 4 ? primaryColor : secondaryColor,
          ),
            label: "",
          ),
        ],),
      body: PageView(
        controller: _pageController,
        children: homeScreenItems,
        onPageChanged: (ind){
          _page = ind;
          setState(() {

          });
        },
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }
}
