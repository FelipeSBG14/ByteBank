import 'dart:convert';

import 'package:bytebank_final/models/contact.dart';
import 'package:bytebank_final/screens/transactions_list.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

import 'interceptors/logging_interceptors.dart';


final Client client = InterceptedClient.build(interceptors: [
  LoggingInterceptor(),
]);

