import 'package:flutter/material.dart';

class ButtonsRowsView extends StatelessWidget {
  final List<Map<String, dynamic>> characters; 
  final ValueSetter<String> onTap;
  const ButtonsRowsView({Key? key, required this.characters, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getWidth({required double size}){
      return MediaQuery.of(context).size.width * size;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (var char in characters) 
          GestureDetector(
            onTap: (){
              onTap(char['label']);
            },
            child: SizedBox(
              width: char['space'] == 2 ? getWidth(size: 0.5) : getWidth(size: 0.25),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(35)
                ),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                onPressed: null, child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(char['label'],
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.black54,
                    )),
                  ),
                ),
              )
            ),
          ),
      ],
    );
  }
}