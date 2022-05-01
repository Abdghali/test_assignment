import 'package:casino_test/src/data/repository/characters_repository.dart';
import 'package:casino_test/src/presentation/bloc/main_event.dart';
import 'package:casino_test/src/presentation/bloc/main_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/character.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  final CharactersRepository _charactersRepository;
  int page = 1;

  MainPageBloc(
    MainPageState initialState,
    this._charactersRepository,
  ) : super(initialState) {}

  void loadPosts() {
    if (state is CharacterLoading) return;

    final currentState = state;

    var oldCharacter = <Character>[];
    if (currentState is CharacterLoaded) {
      oldCharacter = currentState.characters;
    }

    emit(CharacterLoading(oldCharacter, isFirstFetch: page == 1));

    _charactersRepository.getCharacters(page).then((newcharacter) {
      page++;

      final characters = (state as CharacterLoading).oldcharacters;
      characters.addAll(newcharacter!);

      emit(CharacterLoaded(characters));
    });
  }
}
