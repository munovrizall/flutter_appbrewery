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

  dynamic coinData;
  String selectedCurrency = 'USD';
  String coin = 'BTC';
  String exchangeRate = '';

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
        coinData = await coinModel.getCoinRate(
            coin: 'BTC', currency: value!);
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
    coinData =
        await coinModel.getCoinRate(coin: 'BTC', currency: selectedCurrency);
    setState(() {
      // double rate = coinData['rate'];
      double coinRate = coinData['rate'];
      exchangeRate = coinRate.toStringAsFixed(0);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
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
          Padding(
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
                  '1 BTC = $exchangeRate $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
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
