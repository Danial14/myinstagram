import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myinstagram/models/user.dart';
import 'package:myinstagram/providers/user_provider.dart';
import 'package:myinstagram/utils/colors.dart';
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
        onTap: (page){
          _pageController.jumpTo(page as double);
        },
        backgroundColor: mobileBackgroundColor,
        items: const [
          BottomNavigationBarItem(icon: Icon(
            Icons.home,
            color: primaryColor,
          ),
            label: "",
          ),
          BottomNavigationBarItem(icon: Icon(
            Icons.search,
            color: primaryColor,
          ),
            label: "",
          ),
          BottomNavigationBarItem(icon: Icon(
            Icons.favorite,
            color: primaryColor,
          ),
            label: "",
          ),
          BottomNavigationBarItem(icon: Icon(
            Icons.person,
            color: primaryColor,
          ),
            label: "",
          ),
          BottomNavigationBarItem(icon: Icon(
            Icons.add_circle_outline,
            color: primaryColor,
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
            color: primaryColor,
          ),
            label: "",
          ),
          BottomNavigationBarItem(icon: Icon(
            Icons.search,
            color: primaryColor,
          ),
            label: "",
          ),
          BottomNavigationBarItem(icon: Icon(
            Icons.favorite,
            color: primaryColor,
          ),
            label: "",
          ),
          BottomNavigationBarItem(icon: Icon(
            Icons.person,
            color: primaryColor,
          ),
            label: "",
          ),
          BottomNavigationBarItem(icon: Icon(
            Icons.add_circle_outline,
            color: primaryColor,
          ),
            label: "",
          )
        ],),
      body: PageView(
        controller: _pageController,
        children: [
          Text("feed"),
          Text("search"),
          Text("add post"),
          Text("notification"),
          Text("profile"),
        ],
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
