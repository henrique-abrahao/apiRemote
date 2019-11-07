import 'package:barcode_flutter/barcode_flutter.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {

  final Map produto;

  DetailsScreen(this.produto);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${produto['descricao']}'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Produto: ${produto['descricao']}', style: TextStyle(fontSize: 20),),
            SizedBox(height: 16,),
            Text('Marca: ${produto['marca']}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 16,),
            BarCodeImage(
              params: Code39BarCodeParams(
                "${produto['codBarras']}",
                lineWidth: 1.5,                // width for a single black/white bar (default: 2.0)
                barHeight: 90.0,               // height for the entire widget (default: 100.0)
                withText: true,                // Render with text label or not (default: false)
              ),
            ),
            SizedBox(height: 16,),
            Text('codReferencia: ${produto['codReferencia']}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 16,),
            Text('precoCusto: ${produto['precoCusto']} R\$', style: TextStyle(fontSize: 18)),
            SizedBox(height: 16,),
            Text('precoVenda: ${produto['precoVenda']} R\$', style: TextStyle(fontSize: 18)),
            SizedBox(height: 16,),
            Text('maximoDesconto: ${produto['maximoDesconto']} %', style: TextStyle(fontSize: 18)),
            SizedBox(height: 16,),
            Text('saldoEstoque: ${produto['saldoEstoque']}', style: TextStyle(fontSize: 18))
          ],
        ),
      ),
    );
  }
}
