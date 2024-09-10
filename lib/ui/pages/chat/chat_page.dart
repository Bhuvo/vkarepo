import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timesmedlite/model/thread.dart';
import 'package:timesmedlite/ui/pages/chat/chat_list_builder.dart';
import 'chat_entry_widget.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myDummyData = Thread(mine: true,
      content: 'I have suffering from fever and headache for 2 days, i took 2 tables of dolo, but headache is still there',
      date: DateTime.now(),
      id: 'id',);
    final receiverDummyData = Thread(mine: false,
      content: 'Ok, do you have fever? is the headache severe?',
      date: DateTime.now(),
      id: 'id',);

    return MScaffold(
      title: const Text('VICKY'),
      actions: [
        IconButton(
            onPressed: () {

            },
            icon: const Icon(Icons.videocam))
      ],
      body: ChatListBuilder(
        items: List.generate(10, (i){
          if(i % 2 == 0){
            return myDummyData;
          } else {
            return receiverDummyData;
          }
        }).toList(),
      ),
      bottom: const ChatEntryWidget(),
    );
  }
}
