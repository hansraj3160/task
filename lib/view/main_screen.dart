import 'dart:io';

import 'package:flutter/material.dart';
import 'package:task_pluton/view/explorer_screen.dart';
import 'package:task_pluton/view/news_screen.dart';
import 'package:task_pluton/view/purchase_screen.dart';
import 'package:task_pluton/view/video_details.dart';
import 'package:task_pluton/widgets/common.dart';

import '../widgets/style.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  var mainTab = {
    "tabs": [
      {"icon": "assets/icons/ic_home.png"},
      {"icon": "assets/icons/ic_video.png"},
      {"icon": "assets/icons/ic_news.png"},
      {"icon": "assets/icons/ic_explorer.png"},
      {"icon": "assets/icons/ic_purchase.png"}
    ]
  };
  List<String> appbarText = ["Home", "Watch", "News", "Explorer", "Purchase"];
  @override
  void initState() {
    super.initState();
    tabController = TabController(
        length: 5,
        animationDuration: const Duration(milliseconds: 700),
        initialIndex: 0,
        vsync: this);
    tabController!.addListener(handleTabSelection);
  }

  handleTabSelection() {
    setState(() {});
  }

  Future<bool> onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Confirm'),
              content: const Text('Do you want to exit the app?'),
              actions: <Widget>[
                TextButton(
                  child: const Text('No'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Yes', style: TextStyle(color: Colors.red)),
                  onPressed: () {
                    exit(0);
                  },
                )
              ],
            );
          },
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () => onWillPop(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: primaryColorB2,
          centerTitle: true,
          title: VariableText(
            text: appbarText[tabController!.index],
            fontcolor: primaryColorW,
            fontsize: size.height * 0.022,
            weight: FontWeight.w700,
          ),
          leading: Icon(Icons.line_weight),
        ),
        body: TabBarView(
          controller: tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            HomeScreen(),
            VideoDetailScreen(),
            NewsScreen(),
            ExplorerScreen(),
            PurchaseScreen()
          ],
        ),
        bottomSheet: Container(
          height: size.height * 0.06,
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: TabBar(
            labelPadding: EdgeInsets.all(0),
            indicatorColor: primaryColorR1,
            indicatorWeight: 3.2,
            indicatorSize: TabBarIndicatorSize.label,
            controller: tabController,
            labelColor: primaryColorR1,
            tabs: List.generate(mainTab['tabs']!.length, (index) {
              return Tab(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.height * 0.035,
                      width: size.height * 0.035,
                      child: Image.asset(
                        mainTab['tabs']![index]['icon'].toString(),
                        scale: 5,
                        color: tabController!.index == index
                            ? primaryColorR1
                            : primaryColorW,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
