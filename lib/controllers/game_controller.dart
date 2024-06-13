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

  /* late GameOptions _cardOne;
  late GameOptions _cardTwo;
  late Function _escolhaCardOne;
  late Function _escolhaCardTwo; */

  List<GameOptions> _escolha = [];
  List<Function> _escolhaCallback = [];
  int _acertos = 0;
  int _numPares = 0;

  @computed
  bool get jogadaCompleta => (_escolha.length == 2);
  /* @computed
  bool get jogadaCompleta => (_cardOne.selected && _cardTwo.selected); */

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
    // copia da lista de GameSettings
    List<int> cardOpcoes = GameSettings.cardOptions.sublist(0)..shuffle();
    cardOpcoes = cardOpcoes.sublist(0, _numPares);

    gameCards = [...cardOpcoes, ...cardOpcoes]
        .map((opcao) =>
            GameOptions(numberCard: opcao, matched: false, selected: false))
        .toList();
    gameCards.shuffle();
  }

  cardSelected(GameOptions cardSelected, Function resetCard) async {
    cardSelected.selected = true;
    _escolha.add(cardSelected);
    _escolhaCallback.add(resetCard);
    await _verificarEscolhas();
  }

  _verificarEscolhas() async {
    if (jogadaCompleta) {
      /* if(_cardOne.numberCard == _cardTwo.numberCard){
        _acertos++;
        _cardOne.matched == true;
        _cardTwo.matched == true;
      } else {
        await Future.delayed(const Duration(seconds: 1), () {
          _cardOne.selected = false;
          _cardTwo.selected = false;
          _escolhaCardOne();
            _escolhaCardTwo();
        },); */
      if (_escolha[0].numberCard == _escolha[1].numberCard) {
        _acertos++;
        _escolha[0].matched == true;
        _escolha[1].matched == true;
      } else {
        await Future.delayed(const Duration(seconds: 1), () {
          for (var i in [0, 1]) {
            _escolha[i].selected = false;
            _escolhaCallback[i]();
          }
        });
      }
      _resetJogada();
      _updateScore();
      _finishGame();
    }
  }

  _resetJogada() {
    _escolha = [];
    _escolhaCallback = [];
  }

  _updateScore() {
    _gamePlay.modo == Modo.normal ? tentativa++ : tentativa--;
  }

  _finishGame() async {
    bool allMatched = _acertos == _numPares;
    if (_gamePlay.modo == Modo.normal) {
      await _checkResultModeNormal(allMatched);
    } else {
      await _checkResultModeRound6(allMatched);
    }
  }

  _checkResultModeNormal(bool allMatched) async {
    await Future.delayed(const Duration(seconds: 1), () => winner = allMatched);
  }

  _checkResultModeRound6(bool allMatched) async {
    if (_tentativasAcabaram()) {
      await Future.delayed(
          const Duration(seconds: 1), () => loser = !allMatched);
    }

    if (allMatched && tentativa >= 0) {
      await Future.delayed(
          const Duration(seconds: 1), () => winner = allMatched);
    }
  }

  _tentativasAcabaram() {
    return tentativa < _numPares - _acertos;
  }

  restartGame() {
    startGame(gamePlay: _gamePlay);
  }

  nextLevel() {
    int nivelIndex = 0;

    if (_gamePlay.nivel != GameSettings.niveis.last) {
      nivelIndex = GameSettings.niveis.indexOf(_gamePlay.nivel) + 1;
    }

    _gamePlay.nivel = GameSettings.niveis[nivelIndex];
    startGame(gamePlay: _gamePlay);
  }
}
