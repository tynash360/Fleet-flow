class Vehicle {
  final int? id;
  final String make;
  final String model;
  final int year;
  final String licensePlate;
  final String vin;
  final double currentMileage;
  final String fuelType;
  final String? color;
  final String? notes;
  final String? imagePath;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int userId;

  Vehicle({
    this.id,
    required this.make,
    required this.model,
    required this.year,
    required this.licensePlate,
    required this.vin,
    required this.currentMileage,
    required this.fuelType,
    this.color,
    this.notes,
    this.imagePath,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    required String name,
    required int mileage,
  });

  factory Vehicle.fromMap(Map<String, dynamic> map) {
    var mileage = map['mileage'] ?? 0;

    return Vehicle(
      id: map['id'],
      make: map['make'] ?? '',
      model: map['model'] ?? '',
      year: map['year'] ?? 0,
      licensePlate: map['license_plate'] ?? '',
      vin: map['vin'] ?? '',
      currentMileage: (map['current_mileage'] ?? 0).toDouble(),
      fuelType: map['fuel_type'] ?? '',
      color: map['color'],
      notes: map['notes'],
      imagePath: map['image_path'],
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
      userId: map['user_id'] ?? 0,
      name: map['name'] ?? '',
      mileage: mileage,
    );
  }

  get mileage => null;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'make': make,
      'model': model,
      'year': year,
      'license_plate': licensePlate,
      'vin': vin,
      'current_mileage': currentMileage,
      'fuel_type': fuelType,
      'color': color,
      'notes': notes,
      'image_path': imagePath,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'user_id': userId,
      'name': make,
      'mileage': mileage,
    };
  }

  Vehicle copyWith({
    int? id,
    String? make,
    String? model,
    int? year,
    String? licensePlate,
    String? vin,
    double? currentMileage,
    String? fuelType,
    String? color,
    String? notes,
    String? imagePath,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? userId,
    String? name,
    int? mileage,
  }) {
    return Vehicle(
      id: id ?? this.id,
      make: make ?? this.make,
      model: model ?? this.model,
      year: year ?? this.year,
      licensePlate: licensePlate ?? this.licensePlate,
      vin: vin ?? this.vin,
      currentMileage: currentMileage ?? this.currentMileage,
      fuelType: fuelType ?? this.fuelType,
      color: color ?? this.color,
      notes: notes ?? this.notes,
      imagePath: imagePath ?? this.imagePath,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      userId: userId ?? this.userId,
      name: name ?? this.make,
      mileage: mileage ?? this.mileage,
    );
  }
}
