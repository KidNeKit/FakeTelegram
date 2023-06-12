import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/chat_entity.dart';
import '../../../../resources/colors.dart';
import '../../../../resources/styles.dart';
import '../../../blocs/auth/auth_bloc.dart';
import '../../../blocs/chats/chats_bloc.dart';

class ChatsListView extends StatelessWidget {
  const ChatsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatsBloc, ChatsState>(
      builder: (context, state) {
        if (state is ChatsLoadingState) {
          return const CircularProgressIndicator();
        } else if (state is ChatsLoadedState) {
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(0),
            itemBuilder: (ctx, index) => ChatItem(chat: state.chats[index]),
            itemCount: state.chats.length,
            separatorBuilder: (ctx, index) => Divider(
              height: 1.0,
              indent: 79,
              color: dividerColor,
              thickness: 1.2,
            ),
          );
        }
        return Container();
      },
    );
  }
}

class ChatItem extends StatelessWidget {
  final ChatEntity chat;
  const ChatItem({required this.chat, super.key});

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
                      chat.getChatPreview(
                          context.read<AuthBloc>().state.user!.userId!),
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
