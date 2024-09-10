import 'package:flutter/material.dart';
import 'package:timesmedlite/model/thread.dart';
import 'package:timesmedlite/ui/pages/chat/chat_list_item.dart';

class ChatListBuilder extends StatelessWidget {
  final List<Thread> items;
  const ChatListBuilder({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 16, top: 16),
      itemCount: items.length,
      reverse: true,
      itemBuilder: (c, i){
        final item = items[i];
        return ChatListItem(data: item,);
      },
    );
  }
}
