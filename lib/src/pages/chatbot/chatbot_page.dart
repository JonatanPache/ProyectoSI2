import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:seguro_motors_final/src/pages/chatbot/messages.dart';

class ChatbotPage extends StatefulWidget {
  const ChatbotPage({Key? key}) : super(key: key);

  @override
  State<ChatbotPage> createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();

  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    DialogFlowtter.fromFile().then((value) => dialogFlowtter = value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        leading: BackButton(),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        title: Text('ChatBot Asistente Personal'),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: Messages(message: messages,)
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              color: Colors.grey,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        sendMessage(_controller.text);
                        _controller.clear();
                      },
                      icon: Icon(Icons.send)
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  sendMessage(String text) async{
    if(text.isEmpty){
      print('Mensaje vacio');
    }else{
      setState(() {
        addMessage(Message(text: DialogText(text: [text])),true);
      });
      DetectIntentResponse response=await dialogFlowtter.detectIntent(
          queryInput: QueryInput(
              text: TextInput(
                  text: text
              )
          )
      );

      if(response.message == null) return;
      setState(() {
        addMessage(response.message!);
      });
    }
  }

  addMessage(Message message,[bool isUserMessage=false]){
    messages.add({
      'message':message,
      'isUserMessage':isUserMessage
    });
  }

}

