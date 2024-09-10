class Thread {
  final String id;
  final bool mine;
  final String content;
  final DateTime date;
  final ThreadType type;
  const Thread({required this.mine,required this.content,required this.date, required this.id, this.type = ThreadType.text});
}

enum ThreadType {
  text, image, video, voice
}