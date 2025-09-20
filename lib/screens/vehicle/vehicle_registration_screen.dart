import 'package:flutter/material.dart';

class VehicleRegistrationScreen extends StatelessWidget {
  const VehicleRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vehicle Registration'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Manufacturer, Model, Year section
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Manufacturer'),
                    ),
                  ),
                  Icon(Icons.chevron_right),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Model'),
                    ),
                  ),
                  Icon(Icons.chevron_right),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Year'),
                    ),
                  ),
                  Icon(Icons.chevron_right),
                ],
              ),

              SizedBox(height: 20),
              // Current Mileage section
              Text(
                'CURRENT MILEAGE',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: '000 000'),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(onPressed: () {}, child: Text('Km')),
                  SizedBox(width: 10),
                  ElevatedButton(onPressed: () {}, child: Text('Miles')),
                ],
              ),

              SizedBox(height: 20),
              // Additional Info section
              Text(
                'ADDITIONAL INFO',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              ListTile(
                title: Text('Fuel Type'),
                subtitle: Text('Gasoline'),
                trailing: Icon(Icons.chevron_right),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Fuel Capacity (Gal)'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Identification (VIN)'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'License Plate'),
              ),

              SizedBox(height: 20),
              // Purchase Info section
              Text(
                'PURCHASE INFO',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              ListTile(
                title: Text('Purchase Date'),
                trailing: Icon(Icons.chevron_right),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
