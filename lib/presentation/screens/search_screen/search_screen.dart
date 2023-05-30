import 'package:fake_telegram/di_container.dart';
import 'package:fake_telegram/domain/repositories/base_user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../resources/colors.dart';
import '../../../resources/styles.dart';
import '../../blocs/searcher/searcher_bloc.dart';
import '../../global_components/search_text_field.dart';
import 'search_criteria.dart';

class SearchScreen extends StatelessWidget {
  static const String routeName = '/search';

  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: navBarColor,
            border: Border(bottom: BorderSide(color: dividerColor, width: 0.5)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 5.0),
              Row(
                children: [
                  Expanded(
                    child: SearchTextField(onPressedFunc: () {
                      context.read<SearcherBloc>().add(UserSearched('KidNe'));
                    }),
                  ),
                  TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(
                        'Отмена',
                        style: blueHeaderButton,
                      )),
                ],
              ),
              const SearchCriteria(),
            ],
          ),
        ),
      ),
    );
  }

  static Route getMaterialPageRoute() => MaterialPageRoute(
      builder: (_) => BlocProvider(
            create: (context) =>
                SearcherBloc(userRepository: locator.get<BaseUserRepository>()),
            child: const SearchScreen(),
          ));
}
