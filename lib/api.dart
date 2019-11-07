import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trampoely3/modal/produtos_modal.dart';

class Api{

  http.Response response;

  List<Produtos> produtos;



  Future<List<Produtos>> buscar() async{
    response = await http.get(
      'http://sistemaagely.com.br/getArquivo?file=produtos.json'
    );

    return decode(response);
  }

  List<Produtos> decode(http.Response response){
    var decode = json.decode(response.body);

    produtos = decode.map<Produtos>((map){
      return Produtos.fromMap(map);
    }).toList();

    print(produtos[0].descricao);
    return produtos;
  }
}