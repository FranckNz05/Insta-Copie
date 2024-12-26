import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/mock_data.dart';

class MessagesController extends GetxController {
  final conversations = [].obs;
  final isLoading = true.obs;
  final messageController = TextEditingController();
  
  @override
  void onInit() {
    super.onInit();
    fetchConversations();
  }
  
  Future<void> fetchConversations() async {
    try {
      isLoading.value = true;
      await Future.delayed(Duration(seconds: 1)); // Simuler un délai réseau
      conversations.value = MockData.conversations;
    } finally {
      isLoading.value = false;
    }
  }
  
  void sendMessage(String recipientId, String text) {
    if (text.isEmpty) return;
    
    final newMessage = {
      'id': DateTime.now().toString(),
      'senderId': MockData.currentUser['username'],
      'recipientId': recipientId,
      'text': text,
      'timestamp': DateTime.now(),
      'isRead': false,
    };
    
    // Trouver la conversation existante ou en créer une nouvelle
    final conversationIndex = conversations.indexWhere(
      (conv) => conv['participants'].contains(recipientId),
    );
    
    if (conversationIndex != -1) {
      conversations[conversationIndex]['messages'].insert(0, newMessage);
      conversations[conversationIndex]['lastMessage'] = text;
      conversations[conversationIndex]['lastMessageTime'] = 'à l\'instant';
    } else {
      final newConversation = {
        'id': DateTime.now().toString(),
        'participants': [MockData.currentUser['username'], recipientId],
        'messages': [newMessage],
        'lastMessage': text,
        'lastMessageTime': 'à l\'instant',
        'unreadCount': 0,
      };
      conversations.insert(0, newConversation);
    }
    
    messageController.clear();
  }
  
  void markAsRead(String conversationId) {
    final conversationIndex = conversations.indexWhere(
      (conv) => conv['id'] == conversationId,
    );
    
    if (conversationIndex != -1) {
      conversations[conversationIndex]['unreadCount'] = 0;
      conversations[conversationIndex]['messages'].forEach((message) {
        if (message['recipientId'] == MockData.currentUser['username']) {
          message['isRead'] = true;
        }
      });
    }
  }
  
  @override
  void onClose() {
    messageController.dispose();
    super.onClose();
  }
}
