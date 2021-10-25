import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_calculator/views/buttons_row_view.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final appBar = AppBar(
    backgroundColor: Colors.white,
    title: const Text('Basic Calculator', 
      style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w400)
    ),
    elevation: 0,
    actions: const <Widget>[
      IconButton(
        onPressed: null, icon: 
        Icon(CupertinoIcons.moon, color: Colors.black,)
      )
    ],
  ); 

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final appBarHeight = appBar.preferredSize.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    TextEditingController _inputHolderController = TextEditingController(text: '0');
    TextEditingController _userInputController = TextEditingController(text: '0');

    handleOnTap({required String value}){
      int _userInput = int.parse(_userInputController.text);
      int _inputHolder = int.parse(_inputHolderController.text);

      switch (value) {
        case 'C':
          _userInputController.text = '0';
          _inputHolderController.text = '0';
          break;
        case '=':
          _inputHolderController.text = '0';
          _userInputController.text = (_userInput + _inputHolder).toString();
          break;
        case '+':
          _inputHolderController.text = (_inputHolder + _userInput).toString();
          _userInputController.text = '0';
          break;
        case '-':
          _inputHolderController.text = (_inputHolder - _userInput).toString();
          _userInputController.text = '0';
          break;
        case '÷':
          debugPrint('division');
          _inputHolderController.text = (_inputHolder / _userInput).toString();
          _userInputController.text = '0';
          break;
        case '+/-':

          debugPrint('+/-');
          break;
        default:
          (_userInput == 0) ?
          _userInputController.text = (_userInput + int.parse(value)).toString():
          _userInputController.text += value;
      }
    }

    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: (screenHeight - appBarHeight - statusBarHeight) * 0.3,
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                  style: BorderStyle.solid,
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: _inputHolderController,
                    readOnly: true,
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontSize: 25, color: Colors.black54),
                    decoration: const InputDecoration(
                      border: InputBorder.none
                    ),
                  ),
                  TextField(
                    controller: _userInputController,
                    textAlign: TextAlign.right,
                    decoration: const InputDecoration(
                      border: InputBorder.none
                    ),
                    style: const TextStyle(fontSize: 35),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: (screenHeight - appBarHeight - statusBarHeight) * 0.7,
              decoration: const BoxDecoration(
                color: Colors.white38
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonsRowsView(
                    onTap: (String value) => handleOnTap(value: value),
                    characters: const [
                      {'label': 'C'},
                      {'label': '+/-'},
                      {'label': '%'},
                      {'label': '÷'},
                    ]
                  ),
                  ButtonsRowsView(
                    onTap: (String value) => handleOnTap(value: value),
                    characters: const [
                      {'label': '7', 'space': 1},
                      {'label': '8', 'space': 1},
                      {'label': '9', 'space': 1},
                      {'label': 'x', 'space': 1},
                    ]
                  ),
                  ButtonsRowsView(
                    onTap: (String value) => handleOnTap(value: value),
                    characters: const [
                      {'label': '4', 'space': 1},
                      {'label': '5', 'space': 1},
                      {'label': '6', 'space': 1},
                      {'label': '-', 'space': 1},
                    ]
                  ),
                  ButtonsRowsView(
                    onTap: (String value) => handleOnTap(value: value),                    
                    characters: const [
                      {'label': '1', 'space': 1},
                      {'label': '2', 'space': 1},
                      {'label': '3', 'space': 1},
                      {'label': '+', 'space': 1},
                    ]
                  ),
                  ButtonsRowsView(
                    onTap: (String value) => handleOnTap(value: value),
                    characters: const [
                      {'label': '0', 'space': 2},
                      {'label': '.', 'space': 1},
                      {'label': '=', 'space': 1},
                    ]
                  ),
                ],
              ),
            )
          ],
        ),
      )       // 
          // Container(
          //   height: MediaQuery.of(context).size.height / 2,
          //   decoration: BoxDecoration(
          //     color: Colors.black,
          //     border: Border.all()
          //   ),
          // )
    );
  }
}