import 'package:flutter/material.dart';

class WidgArrow extends StatelessWidget {
  String? txt;
  String? txt2;
  void Function()? onPressed;
  WidgArrow({super.key,this.txt,this.onPressed,this.txt2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        children: [
          Expanded(
              child: Text('$txt')
          ),
          Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  txt2 == null ? const Text('') : Text('$txt2'),
                  IconButton(
                    onPressed: onPressed,
                    icon: const Icon(Icons.arrow_forward),
                  ),
                ],
              )
          ),

        ],
      ),
    );
  }
}
