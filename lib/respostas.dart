import 'package:flutter/material.dart';

class Respostas extends StatelessWidget {
  final String? texto;
  final void Function()? onSelecao;
  const Respostas({super.key, this.texto, this.onSelecao});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: Colors.blueAccent,
      textStyle: const TextStyle(color: Colors.amberAccent),
      minimumSize: const Size(88, 38),
      padding: const EdgeInsets.all(10),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
    );
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 10),
      child: ElevatedButton(
        onPressed: onSelecao,
        style: raisedButtonStyle,
        child: Text(texto!),
      ),
    );
  }
}
