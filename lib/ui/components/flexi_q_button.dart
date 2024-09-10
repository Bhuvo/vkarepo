import 'package:flutter/material.dart';

class FlexiQButton extends StatelessWidget {
  const FlexiQButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: OutlinedButton(
          onPressed: () {},
          child: const Text(
            'Add to Flexi Q',
            style: TextStyle(color: Colors.white, fontSize: 8),
          ),
          style: OutlinedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shape: const RoundedRectangleBorder(),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0)),
        ),
      ),
    );
  }
}
