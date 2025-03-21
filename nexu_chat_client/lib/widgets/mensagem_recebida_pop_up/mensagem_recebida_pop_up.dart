import 'package:flutter/material.dart';
import 'package:nexu_chat_client/core/models/mensagem_model.dart';
import 'package:nexu_chat_client/widgets/mensagem_recebida_pop_up/mensagem_recebida_pop_up_controller.dart';

final class MensagemRecebidaPopUp extends StatelessWidget {
  final MensagemRecebidaPopUpController popUpController;

  MensagemRecebidaPopUp(MensagemModel mensagem, {super.key})
      : popUpController = MensagemRecebidaPopUpController(mensagem);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        child: _cardContent(),
        onTap: (){
          popUpController.irParaChat(context);
        },
      ),
    );
  }
  Widget _cardContent(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: Row(
        children: [
          _fotoPerfil(),
          const SizedBox(width: 12),
          _dadosUsuario(),
        ],
      ),
    );
  }
  Widget _dadosUsuario(){
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _nomeUsuario(),
          const SizedBox(height: 4),
          _mensagem(),
        ],
      ),
    );
  }
  Widget _nomeUsuario(){
    return Text(
      popUpController.mensagem.sender.username,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
  Widget _mensagem(){
    return Text(
      popUpController.mensagem.message,
      style: const TextStyle(
        fontSize: 14,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
  Widget _fotoPerfil(){
    return CircleAvatar(
      radius: 24,
      child: Icon(Icons.person),
    );
  }
}
