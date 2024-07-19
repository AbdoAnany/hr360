


import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}

class DetailItem extends StatelessWidget {
  final String label;
  final String value;

  DetailItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label : ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}

class FamilySection extends StatelessWidget {
  final String title;
  final FamilyDetails details;

  FamilySection({required this.title, required this.details});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.0),
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        DetailItem(label: 'Profession', value: details.profession),
        if (details.organizationName.isNotEmpty) DetailItem(label: 'Name of Organization', value: details.organizationName),
        DetailItem(label: 'Contact Number', value: details.contactNumber),
        if (details.whatsappNumber.isNotEmpty) DetailItem(label: 'Whatsapp Number', value: details.whatsappNumber),
        if (details.email.isNotEmpty) DetailItem(label: 'Email Address', value: details.email),
        if (details.dateOfBirth.isNotEmpty) DetailItem(label: 'Date of Birth', value: details.dateOfBirth),
      ],
    );
  }
}

class Employee {
  final String name;
  final String dateOfJoining;
  final String dateOfBirth;
  final String contactNumber;
  final String emergencyContactNumber;
  final String email;
  final String highestQualification;
  final String institutionName;
  final String yearOfQualification;
  final FamilyDetails fatherDetails;
  final FamilyDetails motherDetails;

  Employee({
    required this.name,
    required this.dateOfJoining,
    required this.dateOfBirth,
    required this.contactNumber,
    required this.emergencyContactNumber,
    required this.email,
    required this.highestQualification,
    required this.institutionName,
    required this.yearOfQualification,
    required this.fatherDetails,
    required this.motherDetails,
  });
}

class FamilyDetails {
  final String name;
  final String profession;
  final String organizationName;
  final String contactNumber;
  final String whatsappNumber;
  final String email;
  final String dateOfBirth;

  FamilyDetails({
    required this.name,
    required this.profession,
    required this.organizationName,
    required this.contactNumber,
    required this.whatsappNumber,
    required this.email,
    required this.dateOfBirth,
  });
}