import 'package:flutter/material.dart';

import '../../../di_container.dart';
import '../../../resources/colors.dart';
import '../../../resources/styles.dart';
import '../../blocs/active_chat/active_chat_bloc.dart';

class ChatAppBar extends StatelessWidget {
  const ChatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 44.0,
        width: double.infinity,
        padding: const EdgeInsets.only(left: 8.0, right: 6.0),
        color: const Color(0xFFF6F6F6),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 0,
              child: InkWell(
                onTap: () {
                  locator.get<ActiveChatBloc>().add(ChatClosed());
                  Navigator.of(context).pop();
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: blueSelectedColor,
                      size: 21.0,
                    ),
                    Text('Назад', style: blueHeaderButton),
                  ],
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  Text('Никита', style: chatNameStyle.copyWith(fontSize: 17.0)),
                  Text('Недавно', style: onlineStatus),
                ],
              ),
            ),
            const Positioned(
              right: 0,
              child: CircleAvatar(
                radius: 18.5,
                backgroundColor: Colors.amber,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
