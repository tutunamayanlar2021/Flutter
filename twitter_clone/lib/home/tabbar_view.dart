import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/home/message.dart';
import 'package:twitter_clone/home/notify.dart';
import 'package:twitter_clone/home_view.dart';

import 'search_view.dart';

class TwitterTabbarView extends StatefulWidget {
  const TwitterTabbarView({Key? key}) : super(key: key);

  @override
  State<TwitterTabbarView> createState() => _TwitterTabbarViewState();
}

String _linkedlnFoto = "https://avatars.githubusercontent.com/u/63172521?v=4";

class _TwitterTabbarViewState extends State<TwitterTabbarView> {
  static late ScrollController scrollController;
  bool isHeaderClose = false;
  double lastOffset = 0;
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();

    scrollController = ScrollController();
    scrollController.addListener(() {
      isHeaderClose = scrollController.offset > lastOffset ? true : false;
      if (scrollController.offset <= 0) {
        isHeaderClose = true;
      } else if (scrollController.offset >=
          scrollController.position.maxScrollExtent) {
        isHeaderClose = true;
      }
      setState(() {
        lastOffset = scrollController.offset;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          floatingActionButton: _tabButton,
          bottomNavigationBar: BottomAppBar(
            child: _tabBarItems,
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 10, left: 0),
            child: Column(
              children: [
                _containerAppBar,
                Expanded(
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),

                    ///isscrollu false yapmak  işe yaramadı .
                    children: [
                      HomeView(controller: scrollController),
                      SearchView(
                        scrollController: scrollController,
                      ),
                      NotifyPage(
                        scrollController: scrollController,
                      ),
                      const MessagePage()
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget get _containerAppBar => AnimatedContainer(
        height: isHeaderClose ? 0 : 80,
        duration: const Duration(milliseconds: 800),
        child: _appbar,
      );

  Widget get _tabBarItems => TabBar(
        indicatorColor: Colors.white,
        isScrollable: false,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        tabs: const [
          Tab(
            child: Icon(
              Icons.home,
              size: 35,
            ),
          ),
          Tab(
            child: Icon(
              FontAwesomeIcons.search,
            ),
          ),
          Tab(
            icon: FaIcon(
              Icons.notifications,
              size: 35,
            ),
          ),
          Tab(
            child: Icon(
              Icons.local_post_office,
              size: 35,
            ),
          ),
        ],
      );

  Widget get _appbar => AppBar(
        centerTitle: false,
        title: _appbarItems,
        elevation: 0,
      );
  Widget get _appbarItems => Wrap(
        alignment: WrapAlignment.spaceEvenly,
        //   spacing: MediaQuery.of(context).size.width / 2,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(_linkedlnFoto),
          ),
          const SizedBox(
            width: 40,
          ),

          ///burası
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: currentIndex == 0
                ? const Icon(
                    FontAwesomeIcons.twitter,
                    color: Colors.blue,
                    size: 26.0,
                  )
                : textfieldSizeBox(),
          ),

          currentIndex == 0
              ? const Icon(
                  Icons.star_border_purple500_outlined,
                  color: Colors.black,
                  size: 26.0,
                )
              : const Padding(
                  padding: EdgeInsets.only(
                    top: 4,
                    left: 19,
                  ),
                  child: Icon(
                    Icons.settings,
                    color: Colors.black,
                    size: 26,
                  ),
                ),
        ],
      );

  SizedBox textfieldSizeBox() {
    return SizedBox(
      width: 30,
      height: 35,
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: currentIndex != 2
            ? myTextfield()
            : const Padding(
                padding: EdgeInsets.all(6.0),
                child: Text(
                  "Bildirimler",
                  style: TextStyle(color: Colors.black),
                ),
              ),
      ),
    );
  }

  TextField myTextfield() {
    return TextField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromRGBO(88, 86, 86, 1),
        hintText: currentIndex == 1
            ? "Search in Twitter"
            : "Search for people and groups",
        hintStyle: const TextStyle(
            fontSize: 13, color: Color.fromARGB(255, 221, 216, 216)),
        contentPadding: const EdgeInsets.all(8),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none),
      ),
    );
  }

  Widget get _tabButton => FloatingActionButton(
      onPressed: () {},
      child:
          currentIndex != 3 ? const Icon(Icons.add) : const Icon(Icons.local_post_office));
}

const titleTextStyle =
    TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Colors.black);
