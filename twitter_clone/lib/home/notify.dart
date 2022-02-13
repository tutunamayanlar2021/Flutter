import 'package:flutter/material.dart';

class NotifyPage extends StatefulWidget {
  const NotifyPage({Key? key, required this.scrollController})
      : super(key: key);
  final ScrollController scrollController;
  @override
  State<NotifyPage> createState() => _NotifyPageState();
}

class _NotifyPageState extends State<NotifyPage> with TickerProviderStateMixin {
  String foto =
      "https://cdn.pixabay.com/photo/2021/06/04/10/29/man-6309454__340.jpg";
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: columnWithTabBar(context),
    );
  }

  Column columnWithTabBar(BuildContext context) {
    return Column(
      children: [tabBar(context), expandedWithTabBarView()],
    );
  }

  TabBar tabBar(BuildContext context) {
    return TabBar(
      indicatorColor: Colors.blue,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorWeight: 3,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey,
      isScrollable: true,
      tabs: [
        sizedBoxAll(context),
        sizedBoxMentions(context),
      ],
    );
  }

  SizedBox sizedBoxMentions(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2.5,
      child: Tab(
        child: Text(
          "Mentions",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }

  SizedBox sizedBoxAll(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2.5,
      child: Tab(
        child: Text(
          "All",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }

  Expanded expandedWithTabBarView() {
    return Expanded(
      child: Padding(
        //burada bir container vardı

        padding: const EdgeInsets.all(8),
        child: TabBarView(children: [
          allThingsWithPadding(),
          allThingsWithPadding(),
        ]),
      ),
    );
  }

  Padding allThingsWithPadding() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: ListTile(
        leading: leadingImage(),
        title: byWhoMessage(),
        subtitle: messageDescription(),
        trailing: messageDate(),
      ),
    );
  }

  Text messageDate() {
    return const Text(
      "15 January",
      style: TextStyle(
        color: Colors.grey,
      ),
    );
  }

  Padding messageDescription() {
    return const Padding(
      padding: EdgeInsets.only(
        left: 40,
        bottom: 20,
      ),
      child: Text(
        "Tweettini beğendi",
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }

  Row byWhoMessage() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(foto),
                ),
                borderRadius: BorderRadius.circular(25)),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            "Mike",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }

  Icon leadingImage() {
    return const Icon(
      Icons.favorite,
      color: Colors.red,
    );
  }
}
