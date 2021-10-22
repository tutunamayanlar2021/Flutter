import 'package:flutter/material.dart';

import 'button.dart';

class GonderiKarti extends StatelessWidget {
  final String ppLink;
  final String isim;
  final String gecenSure;
  final String sendPicLink;
  final String title;

  const GonderiKarti(
      {Key? key,
      required this.ppLink,
      required this.isim,
      required this.gecenSure,
      required this.sendPicLink,
      required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Material(
        //yukseklik veriyoruz
        borderRadius: BorderRadius.circular(12),
        elevation: 1.0,
        child: Container(
          padding: const EdgeInsets.all(15.0),
          width: double.infinity,
          height: 409,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.indigo,
                            image: DecorationImage(
                                image: NetworkImage(
                                  ppLink,
                                ),
                                fit: BoxFit.cover)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              isim,
                              style: const TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              gecenSure,
                              style: const TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Icon(Icons.more_vert),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 18.0),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Image.network(
                sendPicLink,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Button(
                    button: Icons.favorite,
                    txt: "Beğen",
                    fonksiyonum: () {
                      debugPrint("begen");
                    },
                  ),
                  Button(
                    button: Icons.comment,
                    txt: "Yorum yap",
                    fonksiyonum: () {
                      debugPrint("yorum yap");
                    },
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.share, color: Colors.grey),
                    label: const Text(
                      "Paylaş",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
