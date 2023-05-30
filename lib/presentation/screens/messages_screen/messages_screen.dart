import 'package:flutter/material.dart';

import 'chat_listview.dart';
import 'messages_header.dart';
import 'search_text_field.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MessagesHeader(),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: const [
                SearchTextField(),
                ChatListView(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
