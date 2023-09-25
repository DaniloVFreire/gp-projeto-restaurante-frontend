import 'package:dio/dio.dart';

import '../domain/entities/product.dart';
import 'package:sobre_mesa/core/error/server_exceptions.dart';

class MenuRemoteDataSource{
  final Dio httpClient = Dio();
  List<Product> getMenuProducts() {
    try{
      List<Product> products = [];
      products.add(Product(name: 'Panqueca de chocolate', description: 'Deliciosasa panquecas, com brigadeiro e fatias de morango.', price: 16.50, pictureId: 0));
      products.add(Product(name: 'Latte', description: 'Café de alta qualidade, com distintas camadas de leite e espuma.', price: 12.99, pictureId: 1));
      products.add(Product(name: 'Executivo com frango', description: 'Frango, arroz e batata.', price: 17.00, pictureId: 2));
      return products;
    } catch (e){
     throw ApiRequestTimeoutException(errorMessage: 'socorro');
    }
  }
}