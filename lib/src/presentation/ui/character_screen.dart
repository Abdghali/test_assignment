import 'package:casino_test/src/data/models/character.dart';
import 'package:casino_test/src/data/repository/characters_repository.dart';
import 'package:casino_test/src/presentation/bloc/main_bloc.dart';
import 'package:casino_test/src/presentation/bloc/main_event.dart';
import 'package:casino_test/src/presentation/bloc/main_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../widgets/character_widget.dart';
import '../widgets/custom_circular_progress_indicator.dart';

@immutable
class CharactersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => MainPageBloc(
          InitialMainPageState(),
          GetIt.I.get<CharactersRepository>(),
        )..add(const GetTestDataOnMainPageEvent(1)),
        child: BlocConsumer<MainPageBloc, MainPageState>(
          listener: (context, state) {},
          builder: (blocContext, state) {
            if (state is LoadingMainPageState) {
              return CustomCircularProgressIndicator();
            } else if (state is SuccessfulMainPageState) {
              return _successfulWidget(context, state);
            } else {
              return Center(child: const Text("error"));
            }
          },
        ),
      ),
    );
  }


  Widget _successfulWidget(
      BuildContext context, SuccessfulMainPageState state) {
    return ListView.builder(
      cacheExtent: double.maxFinite,
      itemCount: state.characters.length,
      itemBuilder: (context, index) {
        return CharacterWidget(character: state.characters[index]);
      },
    );
  }

  
}
