import 'package:flutter/material.dart';

class TodoBottomSheet extends StatefulWidget {
  const TodoBottomSheet({super.key});

  @override
  State<TodoBottomSheet> createState() => _TodoBottomSheetState();
}

TextEditingController textController = TextEditingController();

String? errorText;

class _TodoBottomSheetState extends State<TodoBottomSheet> {
  bool validate() {
  final text = textController.value.text;
  if (text.isEmpty){
    setState((){
      errorText = "Wariacie wpisz zadanie do wykonania";
    });
    return false;
  }
  setState(() {
    errorText = null;
  });
  return true;
}
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 
        EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Wrap(
        runSpacing: 30,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 30,
            ),
            child: TextField(
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.go,
              controller: textController,
              decoration: InputDecoration(
                labelText: "Co masz do załatwienia wariacie?",
                errorText: errorText,
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                validate();
              },
              onEditingComplete: () {
                validate() ?
                Navigator.pop(context, textController.text) : null;
                textController.clear();
              },
            ),
          ),
        ],
      ),
    );
  }
}
