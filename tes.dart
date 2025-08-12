
import 'package:fsek_mobile/api_client/lib/api_client.dart';

void main() async {
  // // Now you can call the method on the instance.
  // final response = await ApiClient().getAdsApi().adsGetAllAds();

  // // Use the response.
  // print(response.data);

  final response2 =
      await ApiClient().getNewsApi().newsGetPaginatedNews(pageNbr: 0);

  print(response2.data);
}
