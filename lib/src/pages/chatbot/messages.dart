import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Messages extends StatefulWidget {
  final List message;
  const Messages({Key? key,required this.message}) : super(key: key);

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    late double w=MediaQuery.of(context).size.width;
    return ListView.separated(
        itemBuilder: (context,index){
          return Container(
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: widget.message[index]['isUserMessage']?MainAxisAlignment.end:MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [

                Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 14, horizontal: 14),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(
                            20,
                          ),
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(
                              widget.message[index]['uid'] == 1234
                                  ? 0
                                  : 20),
                          topLeft: Radius.circular(
                              widget.message[index]['uid'] == 1234
                                  ? 20
                                  : 0),
                        ),
                        color: widget.message[index]['uid'] == 1234
                            ? Colors.white
                            : Colors.orange),
                    constraints: BoxConstraints(maxWidth: w * 2 / 3),
                    child: Text(widget.message[index]['message'].text.text[0])),
              ],
            ),
          );
        },
        separatorBuilder: (_ , i)=>Padding(padding: EdgeInsets.only( top: 10)),
        itemCount: widget.message.length
    );
  }

  /*Widget giveTime(DateTime dateTime) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        DateFormat('kk:mm').format(dateTime),
        style:
        TextStyle(color: Colors.grey.shade600, fontStyle: FontStyle.italic),
      ),
    );
  }*/
}
