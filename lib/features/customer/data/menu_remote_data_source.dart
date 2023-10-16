import 'package:dio/dio.dart';
import 'package:sobre_mesa/core/constants/urls.dart';

import '../domain/entities/product.dart';
import 'package:sobre_mesa/core/error/server_exceptions.dart';

class MenuRemoteDataSource {
  final Dio httpClient = Dio();
  Map<String, Product> productsMap = {};
  List<Product> productsList = [];

  Future<List<Product>> getMenuProductsListFromApi() async {
    final response = await httpClient.get(
      Urls.baseAPI + '/api/pt/items',
    );
    productsList = [];
    final mapped_res = response.data as List<Map<String, dynamic>>;
    for (final product in mapped_res) {
      productsList.add(Product(
          name: product["name"],
          description: product["description"],
          price: product["value"],
          pictureId: 1,
          id: product["id"]));
    }
    return productsList;
  }

  List<Product> getMenuProductsList() {
    try {
      productsList.add(Product(
          name: 'Panqueca de chocolate',
          description:
              'Deliciosas panquecas, com brigadeiro e fatias de morango.',
          price: 16.50,
          pictureId: 0,
          id: '3'));

      productsList.add(Product(
          name: 'Latte',
          description:
              'Café de alta qualidade, com distintas camadas de leite e espuma.',
          price: 12.99,
          pictureId: 1,
          id: '4'));
      productsList.add(Product(
          name: 'Executivo com frango',
          description: 'Frango, arroz e batata.',
          price: 17.00,
          pictureId: 2,
          id: '5'));
      productsList.add(Product(
          name: 'Agua mineral 500ml',
          description: 'Agua geladinha.',
          price: 4.80,
          pictureId: 3,
          id: '6'));

      // productsList.add(Product(
      //     name: 'Bolo de macaxeira (P)',
      //     description: 'Bolo delicioso de macaxeira.',
      //     price: 12.00,
      //     pictureId: 4,
      //     id: '2'));
      // productsList.add(Product(
      //     name: 'Bolo de milho (P)',
      //     description: 'Bolo delicioso de milho.',
      //     price: 12.00,
      //     pictureId: 5,
      //     id: '6'));
      // productsList.add(Product(
      //     name: 'Canjica (250ml)',
      //     description: 'Deliciosa porção de canjica.',
      //     price: 7.00,
      //     pictureId: 7,
      //     id: '9'));
      // productsList.add(Product(
      //     name: 'Munguzá (400ml)',
      //     description: 'Delicioso copo de munguzá.',
      //     price: 5.00,
      //     pictureId: 9,
      //     id: '10'));
      return productsList;
    } catch (e) {
      throw ApiRequestTimeoutException(errorMessage: 'socorro');
    }
  }

  Map<String, Product> getMenuProductsMap() {
    try {
      if (productsList == null) {
        getMenuProductsList();
      }
      for (final i in productsList) {
        productsMap[i.id] = i;
      }
      return productsMap;
    } catch (e) {
      throw ApiRequestTimeoutException(errorMessage: 'socorro');
    }
  }
}
