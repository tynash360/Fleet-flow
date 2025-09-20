class MaintenanceRecord {
  final int? id;
  final int vehicleId;
  final String type;
  final String description;
  final double cost;
  final double mileage;
  final DateTime date;
  final String? serviceProvider;
  final String? notes;
  final String? receiptImagePath;
  final DateTime? nextDueDate;
  final double? nextDueMileage;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int userId;

  MaintenanceRecord({
    this.id,
    required this.vehicleId,
    required this.type,
    required this.description,
    required this.cost,
    required this.mileage,
    required this.date,
    this.serviceProvider,
    this.notes,
    this.receiptImagePath,
    this.nextDueDate,
    this.nextDueMileage,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
  });

  factory MaintenanceRecord.fromMap(Map<String, dynamic> map) {
    return MaintenanceRecord(
      id: map['id'],
      vehicleId: map['vehicle_id'] ?? 0,
      type: map['type'] ?? '',
      description: map['description'] ?? '',
      cost: (map['cost'] ?? 0).toDouble(),
      mileage: (map['mileage'] ?? 0).toDouble(),
      date: DateTime.parse(map['date']),
      serviceProvider: map['service_provider'],
      notes: map['notes'],
      receiptImagePath: map['receipt_image_path'],
      nextDueDate: map['next_due_date'] != null
          ? DateTime.parse(map['next_due_date'])
          : null,
      nextDueMileage: map['next_due_mileage']?.toDouble(),
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
      userId: map['user_id'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'vehicle_id': vehicleId,
      'type': type,
      'description': description,
      'cost': cost,
      'mileage': mileage,
      'date': date.toIso8601String(),
      'service_provider': serviceProvider,
      'notes': notes,
      'receipt_image_path': receiptImagePath,
      'next_due_date': nextDueDate?.toIso8601String(),
      'next_due_mileage': nextDueMileage,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'user_id': userId,
    };
  }

  MaintenanceRecord copyWith({
    int? id,
    int? vehicleId,
    String? type,
    String? description,
    double? cost,
    double? mileage,
    DateTime? date,
    String? serviceProvider,
    String? notes,
    String? receiptImagePath,
    DateTime? nextDueDate,
    double? nextDueMileage,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? userId,
  }) {
    return MaintenanceRecord(
      id: id ?? this.id,
      vehicleId: vehicleId ?? this.vehicleId,
      type: type ?? this.type,
      description: description ?? this.description,
      cost: cost ?? this.cost,
      mileage: mileage ?? this.mileage,
      date: date ?? this.date,
      serviceProvider: serviceProvider ?? this.serviceProvider,
      notes: notes ?? this.notes,
      receiptImagePath: receiptImagePath ?? this.receiptImagePath,
      nextDueDate: nextDueDate ?? this.nextDueDate,
      nextDueMileage: nextDueMileage ?? this.nextDueMileage,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      userId: userId ?? this.userId,
    );
  }

  bool get isDue {
    if (nextDueDate != null) {
      return DateTime.now().isAfter(nextDueDate!);
    }
    return false;
  }

  bool get isDueSoon {
    if (nextDueDate != null) {
      final daysUntilDue = nextDueDate!.difference(DateTime.now()).inDays;
      return daysUntilDue <= 30 && daysUntilDue >= 0;
    }
    return false;
  }

  @override
  String toString() {
    return 'MaintenanceRecord{id: $id, type: $type, description: $description, date: $date}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MaintenanceRecord && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

// Common maintenance types
class MaintenanceTypes {
  static const String oilChange = 'Oil Change';
  static const String tireRotation = 'Tire Rotation';
  static const String brakeInspection = 'Brake Inspection';
  static const String airFilter = 'Air Filter';
  static const String transmission = 'Transmission Service';
  static const String coolantFlush = 'Coolant Flush';
  static const String sparkPlugs = 'Spark Plugs';
  static const String inspection = 'Annual Inspection';
  static const String other = 'Other';

  static const List<String> all = [
    oilChange,
    tireRotation,
    brakeInspection,
    airFilter,
    transmission,
    coolantFlush,
    sparkPlugs,
    inspection,
    other,
  ];
}
