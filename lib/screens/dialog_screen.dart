import 'package:flutter/material.dart';

class DialogScreen extends StatefulWidget {
  const DialogScreen({super.key});

  @override
  State<DialogScreen> createState() => _DialogScreenState();
}

class _DialogScreenState extends State<DialogScreen> {
  TextEditingController inputController =
      TextEditingController(); //Controller to grab input from user
  String input = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, //center the text (at the middle)
        spacing: 10.0,
        children: [
          input.isEmpty
              ? Text(
                'Tell me about your day', //if empty this
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              )
              : SizedBox(width: 300, height: 50, child: Text(input)),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder:
                    (context) => AlertDialog(
                      title: Text(
                        'How are you?',
                        style: TextStyle(fontSize: 19.0),
                      ),
                      content: TextField(
                        controller: inputController,
                        decoration: InputDecoration(
                          label: Text('Enter your Feeling'),
                          border: OutlineInputBorder(),
                          hintText: 'Enter text',
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              input =
                                  inputController
                                      .text; //get the text from the text field (updating the state)
                            });
                            inputController
                                .clear(); //clear the text field after submitting
                            Navigator.pop(context);
                          },
                          child: Text('Submit'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            inputController.clear();
                          },
                          child: Text('Cancel'),
                        ),
                      ],
                    ),
              );
            },
            child: Text('click me'),
          ),
        ],
      ),
    ); //center to make the text in the middle
  }
}
