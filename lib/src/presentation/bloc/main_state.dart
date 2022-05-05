import 'package:casino_test/src/data/models/character.dart';
import 'package:equatable/equatable.dart';

abstract class MainPageState extends Equatable {}

class InitialMainPageState extends MainPageState {
  @override
  List<Object> get props => [];
}

class LoadingMainPageState extends MainPageState {
  @override
  List<Object> get props => [];
}

class UnSuccessfulMainPageState extends MainPageState {
  @override
  List<Object> get props => [];
}

class SuccessfulMainPageState extends MainPageState {
  final List<Character> characters;
  SuccessfulMainPageState(this.characters);
  @override
  List<Object> get props => [characters];
}




class CharacterLoaded extends MainPageState {
  final List<Character> characters;
  CharacterLoaded(this.characters);
  @override
  List<Object?> get props => [characters];
}

class CharacterLoading extends MainPageState {
  final List<Character> oldCharacters;
  final bool isFirstFetch;
  CharacterLoading(this.oldCharacters, {this.isFirstFetch=false});
  @override
  List<Object?> get props => [oldCharacters,isFirstFetch];
}
