import 'abstract.service.dart';
import 'package:fsek_mobile/models/home/fruit.dart';

class FruitService extends AbstractService {
  Future<List<Fruit>> getFruits() async {
    Map json = await AbstractService.get("/frukter");
    List<Fruit> fruitlist =
        (json['fruits'] as List).map((data) => Fruit.fromJson(data)).toList();
    print(fruitlist);
    return fruitlist;
  }
}
