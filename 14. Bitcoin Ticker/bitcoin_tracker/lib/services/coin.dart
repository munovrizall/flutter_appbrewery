import 'networking.dart';

const apiUrl = 'rest.coinapi.io';
const apiKey = '7D3BC89E-47CD-458E-A539-5A33E8840014';

class CoinModel {

  Future<dynamic> getCoinRate(
      {required String coin, required String currency}) async {

    Uri url = Uri.https(
      apiUrl,
      '/v1/exchangerate/$coin/$currency',
      {'apikey': apiKey},
    );

    NetworkHelper networkHelper = NetworkHelper(url);

    var coinData = await networkHelper.getData();
    return coinData;
  }
}
