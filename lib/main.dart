import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

void main() {
  runApp(const PerguntaApp());
}

class PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual é sua cor favoriata?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 3},
        {'texto': 'Verde', 'pontuacao': 4},
        {'texto': 'Branco', 'pontuacao': 6}
      ],
    },
    {
      'texto': 'Qual seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'pontuacao': 4},
        {'texto': 'Cachorro', 'pontuacao': 6},
        {'texto': 'Gato', 'pontuacao': 10},
        {'texto': 'Leão', 'pontuacao': 1}
      ],
    },
    {
      'texto': 'Qual seu estrutor favorito',
      'respostas': [
        {'texto': 'Maria', 'pontuacao': 7},
        {'texto': 'Sujeito Programador', 'pontuacao': 6},
        {'texto': 'Gui', 'pontuacao': 3},
        {'texto': 'joão', 'pontuacao': 1},
      ]
    }
  ];

  bool get temPerguntaSelecionda {
    return _perguntaSelecionada < _perguntas.length;
  }

  void responder(int pontuacao) {
    setState(() {
      _perguntaSelecionada++;
      _pontuacaoTotal += pontuacao;
    });

    debugPrint(pontuacao.toString());
  }

  void reiniciarForm() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // for (var textResp in respostas) {
    //   widgets.add(Respostas(
    //     texto: textResp,
    //     onSelecao: responder,
    //   ));
    // }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionda
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: responder)
            : Resultado(
                pontuacao: _pontuacaoTotal,
                reiniciarForm: reiniciarForm,
              ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  PerguntaAppState createState() {
    return PerguntaAppState();
  }
}
