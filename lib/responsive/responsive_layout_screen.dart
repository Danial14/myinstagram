import 'package:flutter/material.dart';
import 'package:myinstagram/providers/user_provider.dart';
import 'package:myinstagram/utils/dimensions.dart';
import 'package:provider/provider.dart';

class ResponsiveLayout extends StatefulWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;
  const ResponsiveLayout({super.key, required this.webScreenLayout, required this.mobileScreenLayout});

  @override
  State<ResponsiveLayout> createState() {
    return _ResponsiveLayoutState();
  }
}
class _ResponsiveLayoutState extends State<ResponsiveLayout>{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //fetchUser();
  }
  fetchUser(){
    Provider.of<UserProvider>(context, listen: false).fetchUser();
  }
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints){
      if(constraints.maxWidth > webScreenSize){
        return widget.webScreenLayout;
      }
      return widget.mobileScreenLayout;
    });
  }
}
