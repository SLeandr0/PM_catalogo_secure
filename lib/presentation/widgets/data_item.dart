import 'package:flutter/material.dart';

class DataItem extends StatelessWidget {
  final String label;
  final String conteudo;
  
  const DataItem({
    super.key,
    required this.label,
    required this.conteudo
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(conteudo)
        ],
      ),
    );
  }
}