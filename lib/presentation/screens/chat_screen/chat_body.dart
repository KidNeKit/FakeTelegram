import 'package:flutter/material.dart';

import '../../../resources/styles.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/tg_background.jpg'),
            fit: BoxFit.cover,
          ),
          color: Colors.amber,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              MessageItem(text: 'dadada'),
            ],
          ),
        ),
      ),
    );
  }
}

class MessageItem extends StatelessWidget {
  final String text;
  const MessageItem({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 7, bottom: 7, left: 10, right: 80),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: const Color(0xFFE1FEC6),
      ),
      child: Text(
        text,
        style: blueHeaderButton.copyWith(color: Colors.black),
      ),
    );
  }
}
