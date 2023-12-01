import 'package:flutter/material.dart';

class TodoBottomSheet extends StatelessWidget {
  const TodoBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        TextField(),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context, "Dane z bottomsheet");
          },
          child: Text("Zapisz"),
        )
      ],
    ));
  }
}
