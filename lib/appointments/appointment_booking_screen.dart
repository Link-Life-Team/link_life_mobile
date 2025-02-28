import 'package:flutter/material.dart';

class AppointmentBookingScreen extends StatefulWidget {
  @override
  _AppointmentBookingScreenState createState() =>
      _AppointmentBookingScreenState();
}

class _AppointmentBookingScreenState extends State<AppointmentBookingScreen> {
  final List<Map<String, String>> appointments = [
    {
      "hospitalName": "City Hospital",
      "appointmentDate": "2023-10-15",
      "status": "Pending",
    },
    {
      "hospitalName": "Green Valley Hospital",
      "appointmentDate": "2023-10-20",
      "status": "Approved",
    },
    // Add more dummy appointments here
  ];

  final List<String> hospitals = [
    "City Hospital",
    "Green Valley Hospital",
    "Sunrise Hospital",
    // Add more dummy hospitals here
  ];

  final _formKey = GlobalKey<FormState>();
  String? selectedHospital;
  DateTime? selectedDate;
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book an Appointment'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: ElevatedButton(
              onPressed: () => _showBookingModal(context),
              child: Text('Book Appointment'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: appointments.length,
              itemBuilder: (context, index) {
                final appointment = appointments[index];
                return Card(
                  color: Colors.red[50],
                  margin: EdgeInsets.all(10),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          appointment['hospitalName']!,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text("Date: ${appointment['appointmentDate']}"),
                        Text("Status: ${appointment['status']}"),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showBookingModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Book Appointment'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: 'Select Hospital'),
                  items:
                      hospitals.map((String hospital) {
                        return DropdownMenuItem<String>(
                          value: hospital,
                          child: Text(hospital),
                        );
                      }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedHospital = value;
                    });
                  },
                  validator:
                      (value) =>
                          value == null ? 'Please select a hospital' : null,
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _dateController,
                  decoration: InputDecoration(labelText: 'Select Date'),
                  readOnly: true,
                  onTap: () async {
                    final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2101),
                    );
                    if (pickedDate != null && pickedDate != selectedDate) {
                      setState(() {
                        selectedDate = pickedDate;
                        _dateController.text =
                            "${selectedDate!.toLocal()}".split(' ')[0];
                      });
                    }
                  },
                  validator:
                      (value) =>
                          value == null || value.isEmpty
                              ? 'Please select a date'
                              : null,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  print('Hospital: $selectedHospital');
                  print('Date: ${selectedDate!.toLocal()}'.split(' ')[0]);
                  setState(() {
                    appointments.add({
                      "hospitalName": selectedHospital!,
                      "appointmentDate":
                          selectedDate!.toLocal().toString().split(' ')[0],
                      "status": "Pending",
                    });
                  });
                  Navigator.of(context).pop();
                }
              },
              child: Text('Submit'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            ),
          ],
        );
      },
    );
  }
}
