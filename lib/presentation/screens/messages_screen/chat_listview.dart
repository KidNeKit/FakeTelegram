import 'package:fake_telegram/colors.dart';
import 'package:flutter/material.dart';

import '../../../styles.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(0),
      itemBuilder: (ctx, index) => const ChatItem(),
      itemCount: 10,
      separatorBuilder: (ctx, index) => Divider(
        height: 1.0,
        indent: 79,
        color: dividerColor,
        thickness: 1.2,
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  const ChatItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 9.0, top: 8.0, bottom: 8.0),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30.0,
            backgroundColor: Colors.amber,
          ),
          const SizedBox(width: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 80,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Text(
                      'Name',
                      style: chatNameStyle,
                      overflow: TextOverflow.ellipsis,
                    )),
                    const Icon(Icons.check, size: 16.0),
                    const SizedBox(width: 4.5),
                    Text('00:37', style: chatGreyInfoStyle),
                    const SizedBox(width: 8.0),
                  ],
                ),
              ),
              const SizedBox(height: 1.0),
              SizedBox(
                width: MediaQuery.of(context).size.width - 80,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Hello my name is Gustavo, but you can call me Gus, welcome to the los kekes, kmkdmada',
                        style: messagePreviewStyle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Icon(Icons.pin_drop, color: Color(0xFF8E8E93)),
                    const SizedBox(width: 8.0),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
