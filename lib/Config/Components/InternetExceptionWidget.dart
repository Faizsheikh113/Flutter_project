import 'package:flutter/material.dart';

class Internetexceptionwidget extends StatelessWidget {
  final VoidCallback onPress;
  const Internetexceptionwidget({super.key,required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * .15),
        const Icon(Icons.cloud_off, color: Colors.red, size: 50),
        Padding(
          padding: EdgeInsets.only(top: 30),
          child: Center(
            child: Text(
              'we`re unable to show result.\n please check your data \n connections.',
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.displayMedium!.copyWith(fontSize: 20),
            ),
          ),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * .1),
        ElevatedButton(
          onPressed: onPress,
          child: Center(
            child: Text('RETRY', style: Theme.of(context).textTheme.bodySmall),
          ),
        ),
      ],
    );
  }
}
