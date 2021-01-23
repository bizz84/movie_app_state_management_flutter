import 'package:flutter/material.dart';

class CreateProfilePage extends StatefulWidget {
  const CreateProfilePage({
    Key? key,
    this.isLoading = false,
    this.errorText,
    required this.onSubmit,
  }) : super(key: key);
  final bool isLoading;
  final String? errorText;
  final Function(String) onSubmit;

  @override
  _CreateProfilePageState createState() => _CreateProfilePageState();
}

class _CreateProfilePageState extends State<CreateProfilePage> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Profile'),
        actions: [
          FlatButton(
            onPressed: widget.isLoading
                ? null
                : () => widget.onSubmit(controller.value.text),
            child: const Text('Save'),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(32.0),
        alignment: Alignment.center,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(errorText: widget.errorText),
          onSubmitted:
              widget.isLoading ? null : (value) => widget.onSubmit(value),
        ),
      ),
    );
  }
}
