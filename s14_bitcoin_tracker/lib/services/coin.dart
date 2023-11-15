import 'networking.dart';

const apiUrl = 'rest.coinapi.io';
const apiKey = '685BA50E-D2A1-442A-9265-3CEA7A6D1041';

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
