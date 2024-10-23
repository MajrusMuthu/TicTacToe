

import 'package:flutter/material.dart';
import 'package:tic_tac_toe_game/models/players.dart';

class RoomDataProvider extends ChangeNotifier {
Map<String, dynamic> _roomData = {};
List<String>_displayElements = ['', '', '', '', '', '', '', '', ''];
int _filledBoxes = 0;
Player _player1 = Player(
    nickname: '', 
    socketID: '',
    points: 0,    
    playerType: 'X',
  );
  Player _player2 = Player(
    nickname: '', 
    socketID: '',
    points: 0,    
    playerType: 'O',
  );


Map<String, dynamic> get roomData => _roomData;
List<String> get displayElements =>_displayElements;
int get filledBoxes => _filledBoxes;
Player get player1 => _player1;
Player get player2 =>_player2;
void updateRoomData (Map<String, dynamic> data) {
  print('Updating room data: $data'); // Debug line
  _roomData = data;
  notifyListeners();
}
void updatePlayer1(Map<String, dynamic>player1data){
_player1 = Player.fromMap(player1data);
  notifyListeners();
}

void updatePlayer2(Map<String, dynamic>player2data){
_player2 = Player.fromMap(player2data);
  notifyListeners();
}

void updateDisplayElements(int index, String choice) {
displayElements[index] = choice;
_filledBoxes+=1;
notifyListeners();
}

void setFilledBoxesTo0 (){
  _filledBoxes = 0;
}
}