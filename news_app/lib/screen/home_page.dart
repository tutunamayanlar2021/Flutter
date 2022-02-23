import 'package:flutter/material.dart';

import 'package:news_app/model/news_responce.dart';
import 'package:news_app/service/news_api.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("News",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                )),
            const Divider(
              height: 40,
              color: Colors.red,
              thickness: 6,
            ),
            const Text("Headlines ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color.fromARGB(190, 0, 0, 0))),
            const SizedBox(
              height: 20,
            ),
            getData,
          ],
        ),
      )),
    );
  }

  Widget get getData => Expanded(
      child: FutureBuilder<List<Articles>?>(
          future: NewsApiServices().fetchNewsArticle(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              List<Articles> newsArticle = snapshot.data!;
              return ListView.builder(
                  itemCount: newsArticle.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        minVerticalPadding: 6,
                        onTap: (() async {
                          if (await canLaunch(
                              newsArticle[index].url.toString())) {
                            await launch(snapshot.data![index].url.toString());
                          } else {
                            throw "could not launch ${snapshot.data![index].url}";
                          }
                        }),
                        title: Text(
                          newsArticle[index].title.toString(),
                        ),
                        subtitle: Text(
                          newsArticle[index].description.toString(),
                        ),
                        leading: newsArticle[index].urlToImage != null
                            ? Container(
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: NetworkImage(snapshot
                                            .data![index].urlToImage
                                            .toString()))),
                              )
                            : null,
                      ),
                    );
                  });
            }
          }));
}
