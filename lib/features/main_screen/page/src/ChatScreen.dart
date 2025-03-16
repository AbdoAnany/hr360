import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hr360/core/utils/constants/colors.dart';
import 'package:hr360/features/1_login/data/user_model.dart';
import 'package:intl/intl.dart';

import 'ChatService.dart';

class ChatScreen extends StatefulWidget {
  final String senderId;
  final String receiverId;

  const ChatScreen({required this.senderId, required this.receiverId});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ChatService _chatService = ChatService();
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  UserModel receiverDate = UserModel();

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      _chatService.sendMessage(
          widget.senderId, widget.receiverId, _messageController.text.trim());
      _messageController.clear();
      _scrollToBottom();
    }
  }
  void _editMessage(String messageId, String currentText) async {
    print('Attempting to edit message with ID: $messageId'); // Debug
    final newText = await showDialog<String>(
      context: context,
      builder: (context) {
        final controller = TextEditingController(text: currentText);
        return AlertDialog(
          title: const Text('Edit Message'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: "Enter new message"),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, controller.text),
              child: const Text('Save'),
            ),
          ],
        );
      },
    );

    if (newText != null && newText.trim().isNotEmpty) {
      try {
        // Construct the correct chatId using the same logic as ChatService
        String chatId = _chatService.getChatId(widget.senderId, widget.receiverId);

        // Update the message in the correct subcollection
        await FirebaseFirestore.instance
            .collection('chats')
            .doc(chatId)
            .collection('messages')
            .doc(messageId)
            .update({'text': newText.trim()});

        print('Message updated successfully');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Message updated successfully')),
        );
      } catch (e) {
        print('Error updating message: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update message: $e')),
        );
      }
    }
  }

  void _deleteMessage(String messageId) async {
    print('Attempting to delete message with ID: $messageId'); // Debug
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Message'),
        content: const Text('Are you sure you want to delete this message?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      try {
        // Construct the correct chatId using the same logic as ChatService
        String chatId = _chatService.getChatId(widget.senderId, widget.receiverId);

        // Delete the message from the correct subcollection
        await FirebaseFirestore.instance
            .collection('chats')
            .doc(chatId)
            .collection('messages')
            .doc(messageId)
            .delete();

        print('Message deleted successfully');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Message deleted successfully')),
        );
      } catch (e) {
        print('Error deleting message: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to delete message: $e')),
        );
      }
    }
  }
  @override
  void initState() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => getReceiverDate(widget.receiverId));
    super.initState();
  }

  void getReceiverDate(String receiverId) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(receiverId)
        .get()
        .then((DocumentSnapshot snapshot) {
      if (snapshot.exists) {
        setState(() {
          print(snapshot.data());
          receiverDate =
              UserModel.fromJson(snapshot.data() as Map<String, dynamic>);
        });
      }
    });
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final messageDate = DateTime(date.year, date.month, date.day);

    final difference = today.difference(messageDate).inDays;

    if (difference == 0) return 'Today';
    if (difference == 1) return 'Yesterday';
    return DateFormat('MMMM d, yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text(receiverDate.firstName ?? ""),
          elevation: 0,
          backgroundColor: Colors.grey[300],
        ),
        backgroundColor: AppColor.white,
        body: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _chatService.getMessages(widget.senderId, widget.receiverId),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(child: Text('Something went wrong'));
                  }
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  var messages = snapshot.data?.docs
                      .map((doc) => {
                    'id': doc.id,
                    ...doc.data() as Map<String, dynamic>,
                  })
                      .where((msg) => msg['timestamp'] != null)
                      .toList()
                    ?..sort((a, b) {
                      final aTimestamp = a['timestamp'] as Timestamp;
                      final bTimestamp = b['timestamp'] as Timestamp;
                      return aTimestamp.compareTo(bTimestamp);
                    });

                  if (messages == null || messages.isEmpty) {
                    return const Center(child: Text('No messages yet'));
                  }

                  WidgetsBinding.instance
                      .addPostFrameCallback((_) => _scrollToBottom());

                  return ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.all(8.0),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      var message = messages[index];
                      bool isMe = message['senderId'] == widget.senderId;
                      final timestamp = message['timestamp'] as Timestamp?;
                      DateTime currentDate =
                          timestamp?.toDate() ?? DateTime.now();

                      bool showDate = index == 0 ||
                          (index > 0 &&
                              (messages[index - 1]['timestamp'] as Timestamp)
                                  .toDate()
                                  .day !=
                                  currentDate.day);

                      return Column(
                        children: [
                          if (showDate)
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 8.0),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 4.0,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Text(
                                _formatDate(currentDate),
                                style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          GestureDetector(
                            onLongPress: isMe
                                ? () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) => SafeArea(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ListTile(
                                        leading: const Icon(Icons.edit),
                                        title: const Text('Edit'),
                                        onTap: () {
                                          Navigator.pop(context);
                                          _editMessage(
                                              message['id'], message['text']);
                                        },
                                      ),
                                      ListTile(
                                        leading: const Icon(Icons.delete),
                                        title: const Text('Delete'),
                                        onTap: () {
                                          Navigator.pop(context);
                                          _deleteMessage(message['id']);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                                : null,
                            child: Align(
                              alignment: isMe
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: Container(
                                margin: const EdgeInsets.symmetric(vertical: 4.0),
                                padding: const EdgeInsets.all(12.0),
                                constraints: BoxConstraints(
                                  maxWidth:
                                  MediaQuery.of(context).size.width * 0.75,
                                ),
                                decoration: BoxDecoration(
                                  color: isMe
                                      ? Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.9)
                                      : Colors.grey[200],
                                  borderRadius: BorderRadius.circular(12.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 3,
                                      offset: const Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: isMe
                                      ? CrossAxisAlignment.end
                                      : CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      message['text'],
                                      style: TextStyle(
                                        color: isMe ? Colors.white : Colors.black87,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    const SizedBox(height: 4.0),
                                    Text(
                                      DateFormat('HH:mm').format(currentDate),
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        color:
                                        isMe ? Colors.white70 : Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: "Type a message...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey[100],
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 10.0,
                        ),
                      ),
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.send,
                      onSubmitted: (_) => _sendMessage(),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  FloatingActionButton(
                    mini: true,
                    onPressed: _sendMessage,
                    child: const Icon(Icons.send),
                    elevation: 0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}