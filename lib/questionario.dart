import 'package:flutter/material.dart';
import './questao.dart';
import './respostas.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>>? perguntas;
  final int? perguntaSelecionada;
  final void Function(int)? responder;
  const Questionario(
      {super.key,
      required this.perguntas,
      required this.perguntaSelecionada,
      required this.responder});

  bool get temPerguntaSelecionda {
    return perguntaSelecionada! < perguntas!.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionda
        ? perguntas![perguntaSelecionada!].cast()['respostas']
        : [];
    return Column(
      children: <Widget>[
        Questao(texto: perguntas![perguntaSelecionada!]['texto'].toString()),
        ...respostas
            .map((resp) => Respostas(
                texto: resp['texto'].toString(),
                onSelecao: () =>
                    responder!(int.parse(resp['pontuacao'].toString()))))
            .toList(),
      ],
    );
  }
}
