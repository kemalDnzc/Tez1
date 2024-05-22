import 'package:flutter/material.dart';
import 'package:taki/pages/ProductPage.dart';

class EndSide extends StatefulWidget {
  const EndSide({super.key});

  @override
  _EndSideState createState() => _EndSideState();
}
class _EndSideState extends State<EndSide> {
  int? _selectedRadioValue;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromRGBO(148, 137, 121, 1),
            ),
            child: Center(
              child: Text(
                'Filtreleme',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            ),
          RadioListTile<int>(
            title: Text('Dini Motifler'),
            value: 1,
            groupValue: _selectedRadioValue,
            onChanged: (int? value){
              setState(() {
                _selectedRadioValue = value;
              });
            },
          ),
          Divider(),
          RadioListTile<int>(
            title: Text('Hac Motifleri'),
            value: 2,
            groupValue: _selectedRadioValue,
            onChanged: (int? value){
              setState(() {
                _selectedRadioValue = value;
              });
            },
          ),
          Divider(),
          RadioListTile<int>(
            title: Text('Hayvan Motifleri'),
            value: 3,
            groupValue: _selectedRadioValue,
            onChanged: (int? value){
              setState(() {
                _selectedRadioValue = value;
              });
            },
          ),
          Divider(),
          RadioListTile<int>(
            title: Text('Silah Motifleri'),
            value: 4,
            groupValue: _selectedRadioValue,
            onChanged: (int? value){
              setState(() {
                _selectedRadioValue = value;
              });
            },
          ),
          Divider(),
          RadioListTile<int>(
            title: Text('Kalp Motifleri'),
            value: 5,
            groupValue: _selectedRadioValue,
            onChanged: (int? value){
              setState(() {
                _selectedRadioValue = value;
              });
            },
          ),
          Divider(),
          RadioListTile<int>(
            title: Text('Melek Motifleri'),
            value: 6,
            groupValue: _selectedRadioValue,
            onChanged: (int? value){
              setState(() {
                _selectedRadioValue = value;
              });
            },
          ),
          Divider(),
          RadioListTile<int>(
            title: Text('Sonsuzluk Motifleri'),
            value: 7,
            groupValue: _selectedRadioValue,
            onChanged: (int? value){
              setState(() {
                _selectedRadioValue = value;
              });
            },
          ),
          Divider(),
          RadioListTile<int>(
            title: Text('Çapa Motifleri'),
            value: 8,
            groupValue: _selectedRadioValue,
            onChanged: (int? value){
              setState(() {
                _selectedRadioValue = value;
              });
            },
          ),
          Divider(),
          RadioListTile<int>(
            title: Text('Spor Motifleri'),
            value: 9,
            groupValue: _selectedRadioValue,
            onChanged: (int? value){
              setState(() {
                _selectedRadioValue = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
