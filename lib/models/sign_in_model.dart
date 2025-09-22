import 'dart:convert';

class SignInModel {
    final String? role;
    final String? id;
    final String? employeeNumber;
    final String? email;
    final String? firstName;
    final String? lastName;
    final String? grade;
    final Department? department;
    final bool? isAdmin;
    final bool? isDriver;
    final bool? isApprover;
    final bool? isBayManager;
    final bool? isLineManager;
    final String? status;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int? v;
    final String? password;
    final String? licenseNumber;

    SignInModel({
        this.role,
        this.id,
        this.employeeNumber,
        this.email,
        this.firstName,
        this.lastName,
        this.grade,
        this.department,
        this.isAdmin,
        this.isDriver,
        this.isApprover,
        this.isBayManager,
        this.isLineManager,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.password,
        this.licenseNumber,
    });

    factory SignInModel.fromRawJson(String str) => SignInModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
        role: json["role"],
        id: json["_id"],
        employeeNumber: json["employeeNumber"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        grade: json["grade"],
        department: json["department"] == null ? null : Department.fromJson(json["department"]),
        isAdmin: json["isAdmin"],
        isDriver: json["isDriver"],
        isApprover: json["isApprover"],
        isBayManager: json["isBayManager"],
        isLineManager: json["isLineManager"],
        status: json["status"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        password: json["password"],
        licenseNumber: json["licenseNumber"],
    );

    Map<String, dynamic> toJson() => {
        "role": role,
        "_id": id,
        "employeeNumber": employeeNumber,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "grade": grade,
        "department": department?.toJson(),
        "isAdmin": isAdmin,
        "isDriver": isDriver,
        "isApprover": isApprover,
        "isBayManager": isBayManager,
        "isLineManager": isLineManager,
        "status": status,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "password": password,
        "licenseNumber": licenseNumber,
    };
}

class Department {
    final String? id;
    final String? departmentName;

    Department({
        this.id,
        this.departmentName,
    });

    factory Department.fromRawJson(String str) => Department.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Department.fromJson(Map<String, dynamic> json) => Department(
        id: json["_id"],
        departmentName: json["departmentName"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "departmentName": departmentName,
    };
}
