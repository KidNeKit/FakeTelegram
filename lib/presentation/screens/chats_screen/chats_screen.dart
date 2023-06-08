import 'package:flutter/material.dart';

import '../../../resources/colors.dart';
import '../../global_components/search_text_field.dart';
import '../search_screen/search_screen.dart';
import 'components/chats_listview.dart';
import 'components/chats_header.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ChatsHeader(),
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
                const ChatsListView(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
