// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String firstName;
  final String lastName;
  final int age;
  final String job;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.job,
  });

  UserModel copyWith({
    String? firstName,
    String? lastName,
    int? age,
    String? job,
  }) {
    return UserModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      age: age ?? this.age,
      job: job ?? this.job,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'first-name': firstName,
      'last-name': lastName,
      'age': age,
      'Job': job,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      firstName: map['first-name'] as String,
      lastName: map['last-name'] as String,
      age: map['age'] as int,
      job: map['Job'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(firstName: $firstName, lastName: $lastName, age: $age, job: $job)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.firstName == firstName &&
        other.lastName == lastName &&
        other.age == age &&
        other.job == job;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^ lastName.hashCode ^ age.hashCode ^ job.hashCode;
  }
}
