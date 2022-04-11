import 'package:fsek_mobile/models/user/user.dart';

import 'abstract.service.dart';
import 'package:fsek_mobile/models/cafe/coffee_card.dart';

class CoffeeCardService extends AbstractService {
  Future<List<CoffeCard>> getCoffeeCards() async {
    Map json = await AbstractService.get("/kaffe_kort");
    List<CoffeCard> coffee_card_list = (json['coffee_cards'] as List)
        .map((data) => CoffeCard.fromJson(data))
        .toList();
    return coffee_card_list;
  }

  void purchaseCoffee() async {
    int card_id = getCoffeeCards().then()
    Map json = await AbstractService.post("/kaffe_kort/purchase_coffees?id=" + getCoffeeCards().whenComplete(() => null));
    List<CoffeCard> coffee_card_list = (json['coffee_cards'] as List)
        .map((data) => CoffeCard.fromJson(data))
        .toList();
    return coffee_card_list;
  }
}
