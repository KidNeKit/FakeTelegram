import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../colors.dart';
import '../../../data/remote/datasources/firebase/user_datasource.dart';
import '../../../data/repositories/user_repository.dart';
import '../../../styles.dart';
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
                      //context.read<SearcherBloc>().add(UserSearched('Mercury'));
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
          create: (context) => SearcherBloc(
              userRepository: UserRepository(
                  userDatasource: UserDatasource(FirebaseFirestore.instance))),
          child: const SearchScreen(),
        ),
      );
}
