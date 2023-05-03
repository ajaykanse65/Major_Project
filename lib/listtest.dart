import 'package:flutter/material.dart';

class BillingCyclePage extends StatefulWidget {
  @override
  _BillingCyclePageState createState() => _BillingCyclePageState();
}

class _BillingCyclePageState extends State<BillingCyclePage> {
  late DateTime _startDate;
  late DateTime _endDate;
  late double _amountDue;
  late DateTime _paymentDate;
  late String _paymentMethod;

  void _calculateEndDate() {
    _startDate= DateTime.now();
    _endDate = _startDate.add(Duration(days: 30));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Billing Cycle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Start Date: ${_startDate?.toString() ?? ''}'),
            SizedBox(height: 16),
            Text('End Date: ${_endDate?.toString() ?? ''}'),
            SizedBox(height: 16),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Amount Due',
              ),
              onChanged: (value) {
                _amountDue = double.tryParse(value) ?? 0.0;
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                labelText: 'Payment Date',
              ),
              onChanged: (value) {
                _paymentDate = DateTime.tryParse(value)!;
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Payment Method',
              ),
              onChanged: (value) {
                _paymentMethod = value;
              },
            ),
            SizedBox(height: 32),
            ElevatedButton(
              child: Text('Save'),
              onPressed: () {
                // Save billing information in a database or file
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _startDate = DateTime.now();
          _calculateEndDate();
          setState(() {});
        },
      ),
    );
  }
}
