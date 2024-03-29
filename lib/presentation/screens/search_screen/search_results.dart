import 'dart:developer';

import 'package:fake_telegram/di_container.dart';
import 'package:fake_telegram/domain/entities/chat_entity.dart';
import 'package:fake_telegram/domain/entities/user_entity.dart';
import 'package:fake_telegram/presentation/blocs/active_chat/active_chat_bloc.dart';
import 'package:fake_telegram/presentation/screens/chat_screen/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../resources/colors.dart';
import '../../../resources/styles.dart';
import '../../blocs/searcher/searcher_bloc.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearcherBloc, SearcherState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (state.users.isNotEmpty) ...[
              const CriteriaDivider(text: 'ГЛОБАЛЬНЫЙ ПОИСК'),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) => SearchedPeopleItem(
                  userName: state.users[index].name!,
                  login: state.users[index].login!,
                ),
                itemCount: state.users.length,
                separatorBuilder: (_, index) => Divider(
                  height: 1.0,
                  indent: 70,
                  color: dividerColor,
                  thickness: 1.2,
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}

class CriteriaDivider extends StatelessWidget {
  final String _text;
  const CriteriaDivider({required String text, super.key}) : _text = text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      color: greyInfoColor.withOpacity(0.1),
      child: Text(_text,
          style: chatGreyInfoStyle.copyWith(fontWeight: FontWeight.w500)),
    );
  }
}

class SearchedPeopleItem extends StatelessWidget {
  final String _userName;
  final String _login;
  const SearchedPeopleItem(
      {required String userName, required String login, super.key})
      : _userName = userName,
        _login = login;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        locator.get<ActiveChatBloc>().add(ChatOpened(ChatEntity()));
        Navigator.of(context).pushNamed(ChatScreen.routeName);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 20.0,
              backgroundColor: Colors.amber,
            ),
            const SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_userName, style: chatNameStyle),
                Text('@$_login',
                    style:
                        chatGreyInfoStyle.copyWith(color: blueSelectedColor)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
