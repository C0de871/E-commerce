// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce/core/database/api/end_points.dart';

class User {
  int id;
  String firstName;
  String? lastName;
  String phoneNumber;
  String address;
  String email;
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.address,
    required this.email,
  });

  factory User.fronJson(Map<String, dynamic> data) {
    return User(
      id: data[ApiKeys.id],
      firstName: data[ApiKeys.firstName],
      lastName: data[ApiKeys.lastName],
      phoneNumber: data[ApiKeys.mobile],
      address: data[ApiKeys.address],
      email: data[ApiKeys.email],
    );
  }
}
