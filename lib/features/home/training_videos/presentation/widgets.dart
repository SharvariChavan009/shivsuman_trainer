import 'package:flutter/material.dart';

class BlankScreen extends StatelessWidget {
  const BlankScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      alignment: Alignment.center,
      child: const Text(
        'Tap on any video to start watching.',
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}

// ! ----------------------------------------------

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox.square(
            dimension: 15,
            child: CircularProgressIndicator(),
          ),
          SizedBox(width: 20),
          Text(
            'Loading...',
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
