import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      widthFactor: 0.5,
      heightFactor: 0.75,
      child: const Image(
        image: AssetImage('tiles.jpg'),
      ),
    );
  }
}
