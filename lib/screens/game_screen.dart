import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe_game/provider/room_data_provider.dart';
import 'package:tic_tac_toe_game/resources/socket_methods.dart';
import 'package:tic_tac_toe_game/views/scoreboard.dart';
import 'package:tic_tac_toe_game/views/tic_tac_board.dart';
import 'package:tic_tac_toe_game/views/waiting_lobby.dart';

class GameScreen extends StatefulWidget {
  static String routeName = '/game';
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final SocketMethods _socketMethods = SocketMethods();
  @override
  void initState() {
    super.initState();
    _socketMethods.updateRoomListener(context);
    _socketMethods.updatePlayerStateListener(context);
    _socketMethods.pointIncreaseListener(context);
    _socketMethods.endGameListeners(context);
  }
  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);
    return Scaffold(
      body: roomDataProvider.roomData['isJoin']
          ? const WaitingLobby()                                                                                                                                                                    
          : SafeArea(child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const ScoreBoard(),
              const TicTacToeBoard(),
              Text('${roomDataProvider.roomData['turn']['nickname']}\'s turn')
            ],
          ))
    );
  }
}
//