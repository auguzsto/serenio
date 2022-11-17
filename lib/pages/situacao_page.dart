import 'package:flutter/material.dart';
import 'package:serenio/service/cliente_service.dart';

class SituacaoPage extends StatefulWidget {
  String? _inputCpf;
  SituacaoPage(this._inputCpf, {super.key});

  @override
  State<SituacaoPage> createState() => _SituacaoPageState();
}

class _SituacaoPageState extends State<SituacaoPage> {
  ClienteService clienteService = ClienteService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Situação"),
      ),
      body: FutureBuilder<Map>(
        future: clienteService.getCliente("${widget._inputCpf}"),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.active:
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              return Container(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Olá, ${snapshot.data!['nome'].toString()}",
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 22),
                      child: Container(
                        padding: EdgeInsets.all(12),
                        width: double.infinity,
                        height: 110,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.blue)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Saldo:",
                                  style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "${snapshot.data!['saldo'].toString()},00",
                                  style: TextStyle(fontSize: 35),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 22),
                      child: Column(
                        children: [
                          if (snapshot.data!['situacao'].toString() == "0") ...[
                            Icon(
                              Icons.info,
                              size: 238,
                              color: Colors.orange,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 22),
                              child: Column(
                                children: [
                                  Text(
                                    "Você não tem nenhum pedido financeiro.",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    "Entre em contato com seu banco.",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            )
                          ],
                          if (snapshot.data!['situacao'].toString() == "1") ...[
                            Icon(
                              Icons.directions_walk,
                              size: 238,
                              color: Colors.blue,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 22),
                              child: Column(
                                children: [
                                  Text(
                                    "Você tem um pedido financeiro em análise",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    "Entre em contato com seu banco.",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ],
                          if (snapshot.data!['situacao'].toString() == "2") ...[
                            Icon(
                              Icons.check_box,
                              size: 238,
                              color: Colors.green,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 22),
                              child: Column(
                                children: [
                                  Text(
                                    "Seu pedido foi aceito. Aproveite seu saldo.",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    "Entre em contato com seu banco.",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            )
                          ],
                          if (snapshot.data!['situacao'].toString() == "3") ...[
                            Icon(
                              Icons.error,
                              size: 238,
                              color: Colors.red,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 22),
                              child: Column(
                                children: [
                                  Text(
                                    "Seu pedido não foi aceito.",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    "Entre em contato com seu banco.",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}
