import 'package:flutter/material.dart';
import 'package:tic_tac_toe_game/resources/socket_methods.dart';
import 'package:tic_tac_toe_game/screens/game_screen.dart';
import 'package:tic_tac_toe_game/widgets/custom_button.dart';
import 'package:tic_tac_toe_game/widgets/custom_text.dart';
import 'package:tic_tac_toe_game/widgets/custom_textField.dart';

class JoinRoomScreen extends StatefulWidget {
  static const String routeName = '/join-room';
  const JoinRoomScreen({super.key});

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _gameIdController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.joinRoomSuccessListener(context);
    _socketMethods.errorOccuredListener(context);
    _socketMethods.updatePlayerStateListener(context);
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _gameIdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomText(shadow: [], text: 'Join Room', fontSize: 70),
            SizedBox(
              height: size.height * 0.05,
            ),
            CustomTextfield(
              controller: _nameController,
              hintText: 'Enter your nickname',
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextfield(
              controller: _gameIdController,
              hintText: 'Enter Game ID',
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            CustomButton(
              onTap: () {
                _socketMethods.joinRoom(
                  _nameController.text,
                  _gameIdController.text,
                );

                // Directly navigate to GameScreen
                Navigator.pushNamed(context, GameScreen.routeName);
              },
              text: 'Join',
            )
          ],
        ),
      ),
    );
  }
}
