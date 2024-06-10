// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GameController on GameControllerBase, Store {
  Computed<bool>? _$jogadaCompletaComputed;

  @override
  bool get jogadaCompleta =>
      (_$jogadaCompletaComputed ??= Computed<bool>(() => super.jogadaCompleta,
              name: 'GameControllerBase.jogadaCompleta'))
          .value;

  late final _$gameCardsAtom =
      Atom(name: 'GameControllerBase.gameCards', context: context);

  @override
  List<GameOptions> get gameCards {
    _$gameCardsAtom.reportRead();
    return super.gameCards;
  }

  @override
  set gameCards(List<GameOptions> value) {
    _$gameCardsAtom.reportWrite(value, super.gameCards, () {
      super.gameCards = value;
    });
  }

  late final _$tentativaAtom =
      Atom(name: 'GameControllerBase.tentativa', context: context);

  @override
  int get tentativa {
    _$tentativaAtom.reportRead();
    return super.tentativa;
  }

  @override
  set tentativa(int value) {
    _$tentativaAtom.reportWrite(value, super.tentativa, () {
      super.tentativa = value;
    });
  }

  late final _$winnerAtom =
      Atom(name: 'GameControllerBase.winner', context: context);

  @override
  bool get winner {
    _$winnerAtom.reportRead();
    return super.winner;
  }

  @override
  set winner(bool value) {
    _$winnerAtom.reportWrite(value, super.winner, () {
      super.winner = value;
    });
  }

  late final _$loserAtom =
      Atom(name: 'GameControllerBase.loser', context: context);

  @override
  bool get loser {
    _$loserAtom.reportRead();
    return super.loser;
  }

  @override
  set loser(bool value) {
    _$loserAtom.reportWrite(value, super.loser, () {
      super.loser = value;
    });
  }

  @override
  String toString() {
    return '''
gameCards: ${gameCards},
tentativa: ${tentativa},
winner: ${winner},
loser: ${loser},
jogadaCompleta: ${jogadaCompleta}
    ''';
  }
}
