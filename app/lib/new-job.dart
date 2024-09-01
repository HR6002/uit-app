import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewJob extends StatefulWidget {
  const NewJob({super.key});

  @override
  State<NewJob> createState() => _NewJobState();
}

class _NewJobState extends State<NewJob> {
  DateTimeRange? _dateRange;
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;
  String? _selectedPosition;
  bool _useRegisteredAddress = true;
  String? _address;
  String? _postcode;
  String? _extraInfo;

  final List<String> _positions = [
    'Kitchen Porter',
    'Kitchen Assistant',
    'Barback',
    'Waiter/Waitress',
    'Retail Sales Assistant',
    'Cleaner',
    'Warehouse Assistant',
    'Food Packers'
  ];

  final TextEditingController _extraInfoController = TextEditingController();

  Future<void> _selectDateRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _dateRange) {
      setState(() {
        _dateRange = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        if (isStartTime) {
          _startTime = picked;
        } else {
          _endTime = picked;
        }
      });
    }
  }

  void _showAddressDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final TextEditingController addressController = TextEditingController();
        final TextEditingController postcodeController = TextEditingController();

        return AlertDialog(
          title: const Text('Enter New Address'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: addressController,
                decoration: const InputDecoration(labelText: 'Address'),
              ),
              TextField(
                controller: postcodeController,
                decoration: const InputDecoration(labelText: 'Postcode'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _address = addressController.text;
                  _postcode = postcodeController.text;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _submitForm() {
    if (_dateRange != null &&
        _startTime != null &&
        _endTime != null &&
        _selectedPosition != null &&
        (_useRegisteredAddress || (_address != null && _postcode != null))) {
      // All required fields are filled, navigate back to the previous screen
      Navigator.of(context).pop();
    } else {
      // Show a snackbar or dialog indicating that all required fields must be filled
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all required fields')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Request New Job'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Select Date Range:'),
              TextButton(
                onPressed: () => _selectDateRange(context),
                child: Text(
                  _dateRange == null
                      ? 'Choose Date Range'
                      : '${DateFormat('dd/MM/yyyy').format(_dateRange!.start)} - ${DateFormat('dd/MM/yyyy').format(_dateRange!.end)}',
                ),
              ),
              const SizedBox(height: 16.0),
              const Text('Select Time Range:'),
              Row(
                children: [
                  TextButton(
                    onPressed: () => _selectTime(context, true),
                    child: Text(
                      _startTime == null ? 'Start Time' : _startTime!.format(context),
                    ),
                  ),
                  const Text('to'),
                  TextButton(
                    onPressed: () => _selectTime(context, false),
                    child: Text(
                      _endTime == null ? 'End Time' : _endTime!.format(context),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              const Text('Select Position:'),
              DropdownButton<String>(
                value: _selectedPosition,
                hint: const Text('Choose Position'),
                isExpanded: true,
                items: _positions.map((String position) {
                  return DropdownMenuItem<String>(
                    value: position,
                    child: Text(position),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedPosition = newValue;
                  });
                },
              ),
              const SizedBox(height: 16.0),
              const Text('Location:'),
              Row(
                children: [
                  Radio<bool>(
                    value: true,
                    groupValue: _useRegisteredAddress,
                    onChanged: (bool? value) {
                      setState(() {
                        _useRegisteredAddress = value!;
                      });
                    },
                  ),
                  const Text('Use Registered Address'),
                ],
              ),
              Row(
                children: [
                  Radio<bool>(
                    value: false,
                    groupValue: _useRegisteredAddress,
                    onChanged: (bool? value) {
                      setState(() {
                        _useRegisteredAddress = value!;
                        if (!_useRegisteredAddress) {
                          _showAddressDialog(context);
                        }
                      });
                    },
                  ),
                  const Text('Enter New Address'),
                ],
              ),
              const SizedBox(height: 16.0),
              const Text('Extra Information (optional):'),
              TextField(
                controller: _extraInfoController,
                maxLines: 3,
                decoration: const InputDecoration(
                  hintText: 'Enter any additional details...',
                ),
                onChanged: (value) {
                  _extraInfo = value;
                },
              ),
              const SizedBox(height: 20.0),
                            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _submitForm();
                  },
                  style: ElevatedButton.styleFrom(

                    side: const BorderSide(color: Colors.deepPurple),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text('Submit Job Request'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
