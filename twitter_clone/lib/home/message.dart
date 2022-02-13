import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  String foto =
      "https://cdn.pixabay.com/photo/2021/06/04/10/29/man-6309454__340.jpg";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: ListTile(
        leading: leadingImage(),
        title: byWhoMessage(),
        subtitle:  messageDescription(),
        trailing:  messageDate(),
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

  Text messageDescription() {
    return const Text(
        "Sana bir mesaj gönderdi.",
        style: TextStyle(
          color: Colors.grey,
        ),
      );
  }

  Row byWhoMessage() {
    return Row(
        children: const [
          Text(
            "Mike",
            style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Text(
            "@mike",
            style: TextStyle(
              color: Colors.grey,
            ),
          )
        ],
      );
  }

  Container leadingImage() {
    return Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(foto),
            ),
            borderRadius: BorderRadius.circular(25)),
      );
  }



  
}
