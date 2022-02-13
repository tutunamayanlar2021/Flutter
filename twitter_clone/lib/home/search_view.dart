import 'package:flutter/material.dart';
import 'package:twitter_clone/model/trend.dart';

class SearchView extends StatefulWidget {
  final ScrollController scrollController;
  const SearchView({Key? key, required this.scrollController})
      : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  double padding = 20;
  late TrendTopic _trendTopic;
  String foto =
      "https://pbs.twimg.com/semantic_core_img/1486815902205038594/JA4kh_Yz?format=png&name=small";

  @override
  void initState() {
    super.initState();
    _trendTopic = TrendTopic(
        hashtag: "#ZamlarKaldırılsın",
        location: "Trending in Turkey",
        tweets: "81.5K Tweets");
  }

  Future tempFuture() async {
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () {
          return tempFuture();
        },
        child: ListView(
          controller: widget.scrollController,
          children: [
            _emptySpace,
            _foto,
            _trendTitleWidget,
            _listHashView,
          ],
        ),
      ),
    );
  }

  Card _topicCard() {
    return Card(
      color: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      //shape: RoundedRectangleBorder(side: BorderSide(style: BorderStyle.none)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //sol basşa

              children: [
                Text(
                  _trendTopic.location!,
                  style: const TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                ),
                Text(
                  _trendTopic.hashtag!,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  _trendTopic.tweets!,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.more_vert,
            color: Colors.grey,
          )
        ],
      ),
    );
  }

  Widget get _foto => Image.network(foto);
  Widget get _trendTitleWidget => Card(
        color: Theme.of(context).scaffoldBackgroundColor,
        margin: const EdgeInsets.all(0.0),
        elevation: 0,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          alignment: Alignment.centerLeft,
          height: 50,
          child: const Text("Trends for you",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        ),
      );

  Widget get _emptySpace => const SizedBox(
        height: 10,
      );

  Widget get _divider => const Divider(
        color: Colors.grey,
      );

  Widget get _listHashView => ListView.separated(
        shrinkWrap: true,
        itemCount: 10,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => _divider,
        itemBuilder: (context, int k) {
          return _topicCard();
        },
      );
}
