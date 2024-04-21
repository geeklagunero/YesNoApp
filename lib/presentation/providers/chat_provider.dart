//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer =
      GetYesNoAnswer(); //implemntacion de la llamada a la api

  List<Message> messages = [
    Message(text: 'Hola Amor', fromWho: FromWho.me),
    Message(text: 'Ya regresaste del trabajo', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messages.add(newMessage);

    if (text.endsWith('?')) {
      await herReplay();
    }

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> herReplay() async {
    //utilizar la clase de la peticion url y guardamos ese mensaje en her message
    final herMessage = await getYesNoAnswer.getAnswer();
    messages.add(herMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
