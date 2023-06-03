
import 'package:providers/domain/item_pedido.dart';
import 'package:providers/domain/pedido.dart';
import 'package:providers/domain/produto.dart';

class Carrinho {
  late List<ItemPedido> _items;
  late Pedido _pedido;
  
  List<ItemPedido> get items => _items;
  Pedido get pedido => _pedido;

  double get total =>_pedido.total;

  void add(Produto produto, int quantidade) {
    _items.add(
      ItemPedido(
        produto: produto,
        desconto: 0.0,
        preco: produto.preco,
        quantidade: quantidade,
      ),
    );
  }
}