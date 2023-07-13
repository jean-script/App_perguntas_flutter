import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int? pontuacao;
  final void Function()? reiniciarForm;
  const Resultado({super.key, this.pontuacao, this.reiniciarForm});

  String get fraseResultado {
    if (pontuacao! < 8) {
      return 'Parabéns';
    } else if (pontuacao! < 12) {
      return 'Você é bom';
    } else if (pontuacao! < 16) {
      return 'Impressionante';
    } else {
      return 'Nível Jedi!!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(fraseResultado, style: const TextStyle(fontSize: 28)),
        ),
        TextButton(
          onPressed: reiniciarForm,
          style: ButtonStyle(
              foregroundColor:
                  MaterialStateProperty.all<Color>(Colors.blueAccent)),
          child: const Text('Reiniciar'),
        )
      ],
    );
  }
}
