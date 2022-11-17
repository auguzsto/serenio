import 'package:dio/dio.dart';
import 'package:serenio/model/cliente.dart';

class ClienteService extends Cliente {
  Dio dio = Dio();

  Future<Map> getCliente(cpf) async {
    var resp =
        await dio.get("http://192.168.254.109:8089/clientes/?cpf=${cpf}");
    return resp.data[0];
  }
}
