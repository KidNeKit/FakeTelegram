import 'package:flutter/material.dart';

import '../../../resources/colors.dart';
import '../../../resources/styles.dart';

class SearchCriteria extends StatefulWidget {
  const SearchCriteria({super.key});

  @override
  State<SearchCriteria> createState() => _SearchCriteriaState();
}

class _SearchCriteriaState extends State<SearchCriteria> {
  int _index = 0;

  final List<String> tabs = const [
    'Чаты',
    'Медиа',
    'Ссылки',
    'Файлы',
    'Музыка',
    'Голосовые'
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => SearchCriteriaItem(
          tab: tabs[index],
          isActive: _index == index,
          onSelected: () {
            setState(() {
              _index = index;
            });
          },
        ),
        itemCount: tabs.length,
      ),
    );
  }
}

class SearchCriteriaItem extends StatelessWidget {
  final String _tab;
  final bool _isActive;
  final Function() _onSelected;

  const SearchCriteriaItem(
      {required String tab,
      required bool isActive,
      required Function() onSelected,
      super.key})
      : _tab = tab,
        _isActive = isActive,
        _onSelected = onSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onSelected,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 15.0).copyWith(top: 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(_tab,
                style: chatGreyInfoStyle.copyWith(
                    color: _isActive ? blueSelectedColor : greyInfoColor)),
            const Spacer(),
            if (_isActive)
              Container(
                height: 3.0,
                width: 30.0,
                decoration: BoxDecoration(
                  color: blueSelectedColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0)),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
