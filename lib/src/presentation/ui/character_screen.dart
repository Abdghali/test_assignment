import 'dart:async';
import 'package:casino_test/src/data/models/character.dart';
import 'package:casino_test/src/presentation/bloc/main_bloc.dart';
import 'package:casino_test/src/presentation/bloc/main_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/characters_widget.dart';
import '../widgets/custom_circular_progress_indicator.dart';

@immutable
class CharactersScreen extends StatelessWidget {
  final scrollController = ScrollController();

  void setupScrollController(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          BlocProvider.of<MainPageBloc>(context).loadPosts();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);
    BlocProvider.of<MainPageBloc>(context).loadPosts();
    return Scaffold(
      appBar: AppBar(
        title: Text('Character'),
        backgroundColor: Colors.green,
      ),
      body: _postList(),
    );
  }

  Widget _postList() {
    return BlocBuilder<MainPageBloc, MainPageState>(builder: (context, state) {
      if (state is CharacterLoading && state.isFirstFetch) {
        return CustomCircularProgressIndicator();
      }

      List<Character> characters = [];
      bool isLoading = false;

      if (state is CharacterLoading) {
        characters = state.oldCharacters;
        isLoading = true;
      } else if (state is CharacterLoaded) {
        characters = state.characters;
      }

      return ListView.builder(
        controller: scrollController,
        itemBuilder: (context, index) {
          if (index < characters.length)
            return CharactersWidget(
              character: characters[index],
            );
          else {
            Timer(Duration(milliseconds:29), () {
              scrollController
                  .jumpTo(scrollController.position.maxScrollExtent);
            });

            return CustomCircularProgressIndicator();
          }
        },
        itemCount: characters.length + (isLoading ? 1 : 0),
      );
    });
  }
}
