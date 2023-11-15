import 'dart:convert';

import 'package:bitcoin_tracker/services/networking.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'dart:io' show Platform;
import 'services/coin.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  CoinModel coinModel = CoinModel();

  dynamic coinDataBTC;
  dynamic coinDataETH;
  dynamic coinDataLTC;
  String selectedCurrency = 'USD';
  String coin = 'BTC';
  String exchangeRateBTC = '';
  String exchangeRateETH = '';
  String exchangeRateLTC = '';

  DropdownButton<String> setupAndroidDropdown() {
    List<DropdownMenuItem<String>> dropdownList = [];
    for (var currency in currenciesList) {
      var newItem = DropdownMenuItem<String>(
        value: currency,
        child: Text(currency),
      );
      dropdownList.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownList,
      onChanged: (value) async {
        coinDataBTC = await coinModel.getCoinRate(
            coin: 'BTC', currency: value!);
        coinDataETH = await coinModel.getCoinRate(
            coin: 'ETH', currency: value!);
        coinDataLTC = await coinModel.getCoinRate(
            coin: 'LTC', currency: value!);
        setState(() {
          selectedCurrency = value;
          updateUi();
        });
      },
    );
  }

  CupertinoPicker setupIosPicker() {
    List<Widget> pickerList = [];

    for (var currency in currenciesList) {
      var newItem = Text(currency);
      pickerList.add(newItem);
    }

    return CupertinoPicker(
      itemExtent: 32,
      onSelectedItemChanged: (selectedIndex) {
        // print(selectedIndex);
      },
      backgroundColor: Colors.lightBlue,
      children: pickerList,
    );
  }

  void updateUi() async {
    coinDataBTC = await coinModel.getCoinRate(
        coin: 'BTC', currency: selectedCurrency!);
    coinDataETH = await coinModel.getCoinRate(
        coin: 'ETH', currency: selectedCurrency!);
    coinDataLTC = await coinModel.getCoinRate(
        coin: 'LTC', currency: selectedCurrency!);
    setState(() {
      // double rate = coinData['rate'];
      double coinRateBTC = coinDataBTC['rate'];
      double coinRateETH = coinDataETH['rate'];
      double coinRateLTC = coinDataLTC['rate'];
      exchangeRateBTC = coinRateBTC.toStringAsFixed(0);
      exchangeRateETH = coinRateETH.toStringAsFixed(0);
      exchangeRateLTC = coinRateLTC.toStringAsFixed(0);
    });
  }

  @override
  void initState() {
    super.initState();
    updateUi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            children: [
              CoinCard(coin: 'BTC',
                  exchangeRate: exchangeRateBTC,
                  selectedCurrency: selectedCurrency),
              CoinCard(coin: 'ETH',
                  exchangeRate: exchangeRateETH,
                  selectedCurrency: selectedCurrency),
              CoinCard(coin: 'LTC',
                  exchangeRate: exchangeRateLTC,
                  selectedCurrency: selectedCurrency),
            ],
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? setupIosPicker() : setupAndroidDropdown(),
          ),
        ],
      ),
    );
  }
}

class CoinCard extends StatelessWidget {
  const CoinCard({
    super.key,
    required this.coin,
    required this.exchangeRate,
    required this.selectedCurrency,
  });

  final String coin;
  final String exchangeRate;
  final String selectedCurrency;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $coin = $exchangeRate $selectedCurrency',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
