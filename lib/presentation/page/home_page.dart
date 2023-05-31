import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers/presentation/widgets/produto_item_list.dart';
import 'package:providers/service/catalogo_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final catalogo = context.read<Catalogo>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(),

        itemCount: catalogo.withEstoque().length,
        itemBuilder: (context, index) => ProdutoListItem(index: index),
      ),

    );
  }
}