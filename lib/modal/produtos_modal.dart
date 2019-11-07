class Produtos{
  String descricao;
  String marca;
  String codBarras;
  String codReferencia;
  double precoCusto;
  double precoVenda;
  double maximoDesconto;
  int saldoEstoque;

  Produtos();

  Produtos.fromMap(Map map){
     descricao = map['descricao'];
     marca = map['marca'];
     codBarras = map['codBarras'];
     codReferencia = map['codReferencia'];
     precoCusto = map['precoCusto'];
     precoVenda = map['precoVenda'];
     maximoDesconto = map['maximoDesconto'];
     saldoEstoque = map['saldoEstoque'];
  }

  Map toMap(){
    Map<String, dynamic> map = {
    "descricao" : descricao,
    "marca" : marca,
    "codBarras" : codBarras,
    "codReferencia": codReferencia,
    "precoCusto" : precoCusto,
    "precoVenda" : precoVenda,
    "maximoDesconto" : maximoDesconto,
    "saldoEstoque" : saldoEstoque
    }

    ;
  }


}