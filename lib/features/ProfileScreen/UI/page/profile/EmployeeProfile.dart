




import 'package:flutter/material.dart';

import '../../../../../core/utils/formatters/formatter.dart';
import '../../../../1_login/data/user_model.dart';
import '../../../../home/presentation/pages/Home.dart';
import '../../ProfileScreen.dart';

class EmployeeProfilePage extends StatelessWidget {
  late  final   Employee employee ;
  UserModel? userDetails;
   EmployeeProfilePage({super.key, this.userDetails}){


     try {
       print(userDetails!.birthDate!);

       // print(DateTime.parse( HomeControl.userModelLogin!.data!.birthDate!));
     } catch (e) {
       print(e);
     }


     employee = Employee(
       name:   "${userDetails?.firsName}  ${userDetails?.lastName}",
        dateOfJoining:  TFormatter.formatDate(DateTime.now()),
  //     dateOfBirth: TFormatter.formatDate(DateTime.parse( userDetails!.birthDate!)),
       contactNumber: TFormatter.formatPhoneNumber(userDetails?.phone),
       emergencyContactNumber:  TFormatter.formatPhoneNumber(userDetails?.phone),
       email: '${userDetails?.email}',
       // highestQualification: 'BBA',
       // institutionName: 'NarsejimoHanrao Phule University, Pune',
       // yearOfQualification: '2017',
       fatherDetails: FamilyDetails(
         name: 'Manohar Lal Shekhawat',
         profession: 'Businessmen',
         organizationName: 'Swami Traders Private Limited',
         contactNumber: TFormatter.formatPhoneNumber(userDetails?.phone),
         whatsappNumber: TFormatter.formatPhoneNumber(userDetails?.phone),
         email: '${userDetails?.email}',
         dateOfBirth: '30 Apr 1975',
       ),
       motherDetails: FamilyDetails(
         name: 'Shakti Devi Shekhawat',
         profession: 'Housewife',
         organizationName: '',
         contactNumber: '',
         whatsappNumber: '',
         email: '',
         dateOfBirth: '',
       ),
     );
   }




  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          SectionTitle(title: 'Personal Details'),
          DetailItem(label: 'Name', value: employee.name),
          DetailItem(label: 'Date of Joining', value: employee.dateOfJoining),
          DetailItem(label: 'Date of Birth', value: employee.dateOfBirth),
          DetailItem(label: 'Contact Number', value: employee.contactNumber),
          DetailItem(label: 'Emergency Contact Number', value: employee.emergencyContactNumber),
          DetailItem(label: 'Email Address', value: employee.email),
          // Divider(),
          // SectionTitle(title: 'Educational Details'),
          // DetailItem(label: 'Highest Qualification', value: employee.highestQualification),
          // DetailItem(label: 'Name of Institution', value: employee.institutionName),
          // DetailItem(label: 'Year of Qualification', value: employee.yearOfQualification),
          Divider(),
          SectionTitle(title: 'Family Details'),

        ],
      ),
    );
  }
}
