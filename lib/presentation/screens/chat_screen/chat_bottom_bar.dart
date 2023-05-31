import 'package:flutter/material.dart';

import '../../../resources/styles.dart';

class ChatBottomBar extends StatelessWidget {
  const ChatBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.0,
      width: double.infinity,
      padding:
          const EdgeInsets.only(left: 7.0, right: 12.0, top: 6.0, bottom: 6.0),
      color: const Color(0xFFF6F6F6),
      child: Row(
        children: const [
          Icon(
            Icons.abc,
            size: 30.0,
            color: Color(0xFF858E99),
          ),
          SizedBox(width: 5.0),
          MessageTextField(),
          SizedBox(width: 11.0),
          Icon(
            Icons.mic_external_on,
            color: Color(0xFF858E99),
            size: 20.0,
          ),
        ],
      ),
    );
  }
}

class MessageTextField extends StatelessWidget {
  const MessageTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.5),
              borderSide: BorderSide.none),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 13.0, vertical: 4.0),
          hintText: 'Сообщение',
          hintStyle: blueHeaderButton.copyWith(
              color: const Color(0xFF3C3C43).withOpacity(0.6)),
          filled: true,
          fillColor: const Color(0xFFFFFFFF),
        ),
      ),
    );
  }
}
