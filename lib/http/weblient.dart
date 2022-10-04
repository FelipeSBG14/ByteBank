import 'dart:convert';

import 'package:bytebank_final/models/contact.dart';
import 'package:bytebank_final/screens/transactions_list.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';

Future<List<Transaction>> findAll() async {
  http.Client client = InterceptedClient.build(interceptors: [
    LoggingInterceptor(),
  ]);
  final _urlBase = "http://172.18.0.1:8080/transactions";
  final response = await client.get(
    Uri.parse(
      _urlBase,
    ),
  );
  final List<dynamic> decodedJson = jsonDecode(response.body);
  final List<Transaction> transactions = [];
  for (Map<String, dynamic> transactionJson in decodedJson) {
    final Map<String, dynamic> contactJson = transactionJson['contact'];

    final Transaction transaction = Transaction(
      transactionJson['value'],
      Contact(
        0,
        contactJson['name'],
        contactJson['accountNumber'],
      ),
    );
    transactions.add(transaction);
  }
  return transactions;
}

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    print('Request');
    print('url ${data.url}');
    print('headers ${data.headers}');
    print('body ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    print(data.toString());
    return data;
  }
}
