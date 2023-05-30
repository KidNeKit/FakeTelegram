import 'package:flutter/material.dart';

import '../../../resources/colors.dart';
import '../../global_components/search_text_field.dart';
import '../search_screen/search_screen.dart';
import 'chat_listview.dart';
import 'messages_header.dart';

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
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  decoration: BoxDecoration(
                    color: navBarColor,
                    border: Border(
                        bottom: BorderSide(color: dividerColor, width: 0.5)),
                  ),
                  child: SearchTextField(
                    onPressedFunc: () =>
                        Navigator.of(context).pushNamed(SearchScreen.routeName),
                  ),
                ),
                const ChatListView(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
