// ignore: depend_on_referenced_packages
import 'package:mobx/mobx.dart';

import '../constants.dart';
import '../game_settings.dart';
import '../models/game_options.dart';
import '../models/game_play.dart';

part 'game_controller.g.dart';

class GameController = GameControllerBase with _$GameController;

abstract class GameControllerBase with Store {
  @observable
  List<GameOptions> gameCards = [];
  @observable
  int tentativa = 0;
  @observable
  bool winner = false;
  @observable
  bool loser = false;

  late GamePlay _gamePlay;
  List<GameOptions> _escolha = [];
  List<Function> _escolhaCallback = [];
  int _acertos = 0;
  int _numPares = 0;

  @computed
  bool get jogadaCompleta => (_escolha.length == 2);

  startGame({required GamePlay gamePlay}) {
    _gamePlay = gamePlay;
    _acertos = 0;
    _numPares = (_gamePlay.nivel / 2).round();
    winner = false;
    loser = false;
    _resetTentativas();
    _generateCards();
  }

  _resetTentativas() {
    _gamePlay.modo == Modo.normal ? tentativa = 0 : tentativa = _gamePlay.nivel;
  }

  _generateCards() {
    // copia
    List<int> cardOpcoes = GameSettings.cardOptions.sublist(0)..shuffle();
    cardOpcoes = cardOpcoes.sublist(0, _numPares);

    gameCards = [...cardOpcoes, ...cardOpcoes]
        .map((opcao) =>
            GameOptions(option: opcao, matched: false, selected: false))
        .toList();
    gameCards.shuffle();
  }
}
