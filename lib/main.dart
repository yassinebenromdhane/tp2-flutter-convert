import 'package:flutter/material.dart';


void main() => runApp(MyApp());
class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}


class MyAppState extends State<MyApp> {

  double _numberFrom = 0;
  double _per1 = 0;
  double _per2 = 0;
  String _tmp ='meters';
  String _tmp1 ='meters';


  final List<String> _measures = [
    'meters',
    'kilometers',
    'grams',
    'kilograms',
    'feet',
    'miles',
    'pounds (lbs)',
    'ounces',
  ];

  @override
  void initState() {
    _numberFrom = 0;
    _per1 = 0;
    _per2 = 0;
    _tmp = 'meters';
    _tmp1 ='meters';
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Measures Converter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Measures Converter'),
        ),
        body: Center(
          child: Column(
            children: [
              Text('Values'),


              TextField(
                onChanged: (text) {
                  var rv = double.tryParse(text);
                  if (rv != null) {
                    setState(() {
                      _numberFrom = rv;
                    });
                  }
                },
              ),


              Text('From'),

              DropdownButton<String>(
                  value: _tmp,
                  items: _measures.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),

                  onChanged: (text) {
                      setState(() {
                       _tmp = text!;
                      });
                  }

                  ),
              Text('To'),

              DropdownButton<String>(
                  value: _tmp1,
                  items: _measures.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),

                  onChanged: (text) {
                    setState(() {
                      _tmp1 = text!;
                    });
                  }
                  ),
              OutlinedButton.icon(
                label: Text('Convert'),
                icon: Icon(Icons.whatshot),
                style: OutlinedButton.styleFrom(
                  primary: Colors.teal,
                ),

                onPressed: () {
                    if (_tmp == _tmp1){
                      setState(() {
                        _per1 = _numberFrom;
                        _per2 = _numberFrom;
                      });
                    }
                    else if (_tmp == 'kilometers' && _tmp1 == 'meters'){
                          setState(() {
                            _per1 = _numberFrom;
                            _per2 = _per1 * 1000;
                          });
                    }
                    else if (_tmp == 'meters' && _tmp1 == 'kilometers'){
                      setState(() {
                        _per1 = _numberFrom;
                        _per2 = _per1 / 1000;
                      });
                    }
                },
              ),
              Text('$_per1 $_tmp are $_per2 $_tmp1 ')
            ],
          ),
        ),
      ),
    );
  }
}
