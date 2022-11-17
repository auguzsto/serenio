import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:serenio/pages/situacao_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _inputCpf = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Serenio"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(22),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 12),
                child: Text(
                    "Insira seu CPF para realizar consulta da situação do seu pedido financeiro"),
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: _inputCpf,
                decoration: InputDecoration(
                  labelText: "Digite seu CPF",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SituacaoPage(_inputCpf.text)));
                },
                child: Text("Consultar"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
