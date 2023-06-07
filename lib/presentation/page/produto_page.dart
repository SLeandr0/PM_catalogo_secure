import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers/domain/produto.dart';
import 'package:providers/presentation/widgets/data_item.dart';
import 'package:providers/service/catalogo_service.dart';

class ProdutoPage extends StatefulWidget {
  const ProdutoPage({super.key});

  @override
  State<ProdutoPage> createState() => _ProdutoPageState();
}

class _ProdutoPageState extends State<ProdutoPage> {
  late int _quantidade;
  late Produto produto;


  @override
  void initState() {
    super.initState();

    _quantidade = 0;
  }

  @override
  Widget build(BuildContext context) {
    final idProduto = ModalRoute.of(context)!.settings.arguments as int; // "!" - o caracter fala pro projeto, confia que vai ter ROTA!
    produto = context.select<Catalogo, Produto>(
      (catalogo) => catalogo.findProdutoById(idProduto),);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(produto.nome),
            pinned: true,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  DataItem(label: 'Descrição', conteudo: produto.descricao),
                  DataItem(label: 'Estoque', conteudo: produto.estoque.toString()),
                  DataItem(label: 'Preço', conteudo: produto.precoFormatado),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(10),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: decrementa,
                    icon: const Icon(Icons.remove_circle_outline_rounded),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: SizedBox(
                      width: 60,
                      height: 30,
                      child: Center(
                        child: Text("$_quantidade")
                      )
                    ),
                  ),
                  IconButton(
                    onPressed: incrementa,
                    icon: const Icon(Icons.add_circle_outlined),
                  ),
                ],
              ),
            ),
            )
        ],
      ),
    );
  }

  void incrementa(){
    final novaQuantidade = _quantidade + 1;

    if (novaQuantidade > produto.estoque) {
      const msg = SnackBar(
        content: Text('Não há estoque disponível para essa compra!'));

      ScaffoldMessenger.of(context).showSnackBar(msg);
      return;
    }

    setState(() {
      _quantidade = novaQuantidade;
    });
  }

void decrementa(){
  final novaQuantidade = _quantidade - 1;

  if (novaQuantidade < 0) {
    return;
  }

  setState(() {
    _quantidade = novaQuantidade;
  });
}


}