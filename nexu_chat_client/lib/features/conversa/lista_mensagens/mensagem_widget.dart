import 'package:flutter/material.dart';
import 'package:nexu_chat_client/core/models/mensagem_model.dart';
import 'package:nexu_chat_client/core/models/user_logged_model.dart';

final class MensagemWidget extends StatelessWidget {
  final MensagemModel mensagem;
  final bool isLoading; // Indica se a mensagem ainda está sendo enviada
  const MensagemWidget(this.mensagem, {super.key, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    bool isUser = mensagem.sender.uuid == UserLoggedModel().uuid;
    double maxWidth = MediaQuery.of(context).size.width * 0.7;

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isUser) _statusIcon(), // Ícone do status para mensagens recebidas
          Container(
            constraints: BoxConstraints(maxWidth: maxWidth),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(12),
                topRight: const Radius.circular(12),
                bottomLeft: isUser ? const Radius.circular(12) : Radius.zero,
                bottomRight: isUser ? Radius.zero : const Radius.circular(12),
              ),
            ),
            child: Text(
              mensagem.message,
              style: TextStyle(
                color: isUser ? Colors.white : Colors.black87,
                fontSize: 16,
              ),
            ),
          ),
          if (isUser) _statusIcon(), // Ícone do status para mensagens enviadas
        ],
      ),
    );
  }

  Widget _statusIcon() {
    return Padding(
      padding: const EdgeInsets.only(left: 6, right: 6),
      child: isLoading
          ? SizedBox(
        width: 14,
        height: 14,
        child: CircularProgressIndicator(strokeWidth: 2),
      )
          : Icon(Icons.check, size: 16, color: Colors.white70),
    );
  }
}
