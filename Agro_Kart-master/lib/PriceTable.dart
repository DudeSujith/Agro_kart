import 'package:flutter/material.dart';
import 'package:project/constants.dart';

import 'Main Page.dart';

/// This Widget is the main application widget.
class Tables extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Center(
            child: Text('Price Table',
              style: Constants.boldHeading,
              textAlign: TextAlign.center,

            ),
          ),
leading: IconButton(
  icon: Icon(Icons.arrow_back),
  onPressed: (){ Navigator.push(context, MaterialPageRoute(
    builder:(context)=> MainPage(),
  )); },
),

        ),
        body: Table(),
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class Table extends StatelessWidget {
  Table({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 12.0
      ),
      child: DataTable(
        columns: const <DataColumn>[
          DataColumn(

            label: Text(
              'Name',
              style: Constants.boldHeading,
            ),
          ),
          DataColumn(
            label: Text(
              'Quantity',
              style: Constants.boldHeading
            ),
          ),
          DataColumn(
            label: Text(
              'Price',
              style: Constants.boldHeading
            ),
          ),
        ],
        rows: const <DataRow>[
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Rice',style: Constants.regularDarkText,)),
              DataCell(Text('1 Kg')),
              DataCell(Text('\$50')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Wheat',style: Constants.regularDarkText,)),
              DataCell(Text('1 Kg')),
              DataCell(Text('\$25')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Fruits',style: Constants.regularDarkText,)),
              DataCell(Text('1 Kg')),
              DataCell(Text('\$40')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('cereals',style: Constants.regularDarkText,)),
              DataCell(Text('1 Kg')),
              DataCell(Text('\$130')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Grains',style: Constants.regularDarkText,)),
              DataCell(Text('1 Kg')),
              DataCell(Text('\$90')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Pulses',style: Constants.regularDarkText,)),
              DataCell(Text('1 Kg')),
              DataCell(Text('\$120')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Oil',style: Constants.regularDarkText,)),
              DataCell(Text('1 L')),
              DataCell(Text('\$40')),
            ],
          ),
        ],
      ),
    );
  }
}