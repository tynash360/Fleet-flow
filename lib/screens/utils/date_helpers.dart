import 'package:fleetflow/models/vehicle_model.dart';
import 'package:fleetflow/models/fuel_maintanace.dart';

class DataHelpers {
  static List<Vehicle> vehicles = [
    Vehicle(
      id: '1',
      name: 'Toyota Corolla',
      model: 'Sedan',
      year: 2019,
      mileage: 50000,
    ),
    Vehicle(
      id: '2',
      name: 'Honda Civic',
      model: 'Sedan',
      year: 2020,
      mileage: 30000,
    ),
  ];

  static List<dynamic>? get fuels => null;
}

class Fuel {
  final String id;
  final String vehicleId;
  final double liters;
  final double price;
  final DateTime date;

  Fuel({
    required this.id,
    required this.vehicleId,
    required this.liters,
    required this.price,
    required this.date,
  });
}

List<Maintenance> maintenances = [
  Maintenance(
    id: 'M001',
    vehicleId: '1',
    title: 'Oil Change',
    date: DateTime.now().subtract(Duration(days: 10)),
    notes: 'Changed engine oil and filter',
  ),
  Maintenance(
    id: 'M002',
    vehicleId: '2',
    title: 'Brake Service',
    date: DateTime.now().subtract(Duration(days: 5)),
    notes: 'Replaced brake pads',
  ),
];
