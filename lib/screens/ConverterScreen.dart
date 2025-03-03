import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CurrencyConverterScreen extends StatefulWidget {
  @override
  _CurrencyConverterScreenState createState() =>
      _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  Map<String, dynamic>? _exchangeRates;
  String _baseCurrency = 'USD';
  String _targetCurrency = 'PKR';
  double _enteredAmount = 100.0;

  @override
  void initState() {
    super.initState();
    _fetchExchangeRates();
  }

  Future<void> _fetchExchangeRates() async {
    setState(() {
      _exchangeRates = {
        'conversion_rates': {'PKR': 277.5, 'AED': 3.67, 'INR': 83.2, 'CNY': 7.1, 'USD': 1.0}
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(
                'animations/2.json',
                height: 300,
                reverse: true,
                repeat: true,
              ),
              SizedBox(height: 30),
              Text(
                'CurrenSee App',
                style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 32),
              CurrencySelectorRow(
                baseCurrency: _baseCurrency,
                targetCurrency: _targetCurrency,
                onBaseCurrencyChanged: (newCurrency) {
                  setState(() {
                    _baseCurrency = newCurrency;
                  });
                },
                onTargetCurrencyChanged: (newCurrency) {
                  setState(() {
                    _targetCurrency = newCurrency;
                  });
                },
              ),
              SizedBox(height: 16),
              if (_exchangeRates != null)
                ExchangeRateBox(
                  baseCurrency: _baseCurrency,
                  targetCurrency: _targetCurrency,
                  exchangeRates: _exchangeRates!,
                  enteredAmount: _enteredAmount,
                  onAmountChanged: (newAmount) {
                    setState(() {
                      _enteredAmount = newAmount;
                    });
                  },
                ),
              SizedBox(height: 20),
              Text(
                'CURRENT RATES',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 10),
              if (_exchangeRates != null) CurrentRatesList(exchangeRates: _exchangeRates!),
            ],
          ),
        ),
      ),
    );
  }
}

class CurrencySelectorRow extends StatelessWidget {
  final String baseCurrency;
  final String targetCurrency;
  final Function(String) onBaseCurrencyChanged;
  final Function(String) onTargetCurrencyChanged;

  CurrencySelectorRow({
    required this.baseCurrency,
    required this.targetCurrency,
    required this.onBaseCurrencyChanged,
    required this.onTargetCurrencyChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: CurrencyDropdown(selectedCurrency: baseCurrency, onCurrencyChanged: onBaseCurrencyChanged)),
        SizedBox(width: 16),
        Icon(Icons.swap_horiz, color: Colors.white, size: 40),
        SizedBox(width: 16),
        Expanded(child: CurrencyDropdown(selectedCurrency: targetCurrency, onCurrencyChanged: onTargetCurrencyChanged)),
      ],
    );
  }
}

class CurrencyDropdown extends StatelessWidget {
  final String selectedCurrency;
  final Function(String) onCurrencyChanged;

  CurrencyDropdown({required this.selectedCurrency, required this.onCurrencyChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedCurrency,
          items: ['USD', 'PKR', 'AED', 'INR', 'CNY'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            if (newValue != null) {
              onCurrencyChanged(newValue);
            }
          },
        ),
      ),
    );
  }
}

class ExchangeRateBox extends StatelessWidget {
  final String baseCurrency;
  final String targetCurrency;
  final Map<String, dynamic> exchangeRates;
  final double enteredAmount;
  final Function(double) onAmountChanged;

  ExchangeRateBox({
    required this.baseCurrency,
    required this.targetCurrency,
    required this.exchangeRates,
    required this.enteredAmount,
    required this.onAmountChanged,
  });

  @override
  Widget build(BuildContext context) {
    final double rate = exchangeRates['conversion_rates'][targetCurrency] ?? 1.0;
    final double convertedAmount = enteredAmount * rate;

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          TextField(
            keyboardType: TextInputType.number,
            style: TextStyle(color: Colors.white, fontSize: 18),
            decoration: InputDecoration(
              labelText: "Enter Amount",
              labelStyle: TextStyle(color: Colors.white),
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              final double? newAmount = double.tryParse(value);
              if (newAmount != null) {
                onAmountChanged(newAmount);
              }
            },
          ),
          SizedBox(height: 8),
          Text(
            '${convertedAmount.toStringAsFixed(2)} $targetCurrency',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ],
      ),
    );
  }
}

class CurrentRatesList extends StatelessWidget {
  final Map<String, dynamic> exchangeRates;

  CurrentRatesList({required this.exchangeRates});

  @override
  Widget build(BuildContext context) {
    return Text("Rates will be shown here.", style: TextStyle(color: Colors.white));
  }
}
