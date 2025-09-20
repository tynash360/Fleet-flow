class FuelRecord {
  final int? id;
  final int vehicleId;
  final double gallons;
  final double totalCost;
  final double pricePerGallon;
  final double mileage;
  final DateTime date;
  final String? station;
  final String? location;
  final bool fullTank;
  final String? notes;
  final String? receiptImagePath;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int userId;

  FuelRecord({
    this.id,
    required this.vehicleId,
    required this.gallons,
    required this.totalCost,
    required this.pricePerGallon,
    required this.mileage,
    required this.date,
    this.station,
    this.location,
    required this.fullTank,
    this.notes,
    this.receiptImagePath,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
  });

  factory FuelRecord.fromMap(Map<String, dynamic> map) {
    return FuelRecord(
      id: map['id'],
      vehicleId: map['vehicle_id'] ?? 0,
      gallons: (map['gallons'] ?? 0).toDouble(),
      totalCost: (map['total_cost'] ?? 0).toDouble(),
      pricePerGallon: (map['price_per_gallon'] ?? 0).toDouble(),
      mileage: (map['mileage'] ?? 0).toDouble(),
      date: DateTime.parse(map['date']),
      station: map['station'],
      location: map['location'],
      fullTank: map['full_tank'] == 1,
      notes: map['notes'],
      receiptImagePath: map['receipt_image_path'],
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
      userId: map['user_id'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'vehicle_id': vehicleId,
      'gallons': gallons,
      'total_cost': totalCost,
      'price_per_gallon': pricePerGallon,
      'mileage': mileage,
      'date': date.toIso8601String(),
      'station': station,
      'location': location,
      'full_tank': fullTank ? 1 : 0,
      'notes': notes,
      'receipt_image_path': receiptImagePath,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'user_id': userId,
    };
  }

  FuelRecord copyWith({
    int? id,
    int? vehicleId,
    double? gallons,
    double? totalCost,
    double? pricePerGallon,
    double? mileage,
    DateTime? date,
    String? station,
    String? location,
    bool? fullTank,
    String? notes,
    String? receiptImagePath,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? userId,
  }) {
    return FuelRecord(
      id: id ?? this.id,
      vehicleId: vehicleId ?? this.vehicleId,
      gallons: gallons ?? this.gallons,
      totalCost: totalCost ?? this.totalCost,
      pricePerGallon: pricePerGallon ?? this.pricePerGallon,
      mileage: mileage ?? this.mileage,
      date: date ?? this.date,
      station: station ?? this.station,
      location: location ?? this.location,
      fullTank: fullTank ?? this.fullTank,
      notes: notes ?? this.notes,
      receiptImagePath: receiptImagePath ?? this.receiptImagePath,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      userId: userId ?? this.userId,
    );
  }

  // Calculate miles per gallon if we have previous record
  double? calculateMPG(FuelRecord? previousRecord) {
    if (previousRecord == null || !fullTank || !previousRecord.fullTank) {
      return null;
    }

    final milesDriven = mileage - previousRecord.mileage;
    if (milesDriven <= 0 || gallons <= 0) {
      return null;
    }

    return milesDriven / gallons;
  }

  @override
  String toString() {
    return 'FuelRecord{id: $id, gallons: $gallons, totalCost: $totalCost, date: $date}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FuelRecord && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

// Fuel efficiency calculations helper
class FuelEfficiency {
  final List<FuelRecord> records;

  FuelEfficiency(this.records);

  double? get averageMPG {
    final mpgValues = <double>[];

    for (int i = 1; i < records.length; i++) {
      final current = records[i];
      final previous = records[i - 1];
      final mpg = current.calculateMPG(previous);
      if (mpg != null) {
        mpgValues.add(mpg);
      }
    }

    if (mpgValues.isEmpty) return null;

    return mpgValues.reduce((a, b) => a + b) / mpgValues.length;
  }

  double get totalSpent {
    return records.fold(0.0, (sum, record) => sum + record.totalCost);
  }

  double get totalGallons {
    return records.fold(0.0, (sum, record) => sum + record.gallons);
  }

  double get averagePricePerGallon {
    if (records.isEmpty) return 0.0;
    return totalSpent / totalGallons;
  }
}
