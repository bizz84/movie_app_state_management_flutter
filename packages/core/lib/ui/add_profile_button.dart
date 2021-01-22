import 'package:flutter/material.dart';

class AddProfileButton extends StatelessWidget {
  const AddProfileButton({Key key, this.onPressed}) : super(key: key);
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  )),
              child: const Icon(Icons.add),
            ),
          ),
          const SizedBox(height: 8.0),
          const Text('Add Profile'),
        ],
      ),
    );
  }
}
