import 'package:flutter/material.dart';
import 'package:flutter_application_1/repository/employee.dart';

class EmployeeDetailsScreen extends StatelessWidget {
  // final Employee employee;
  // const EmployeeDetailsScreen({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    final employee = ModalRoute.of(context)!.settings.arguments as Employee;
    return Scaffold(
      appBar: AppBar(
        title: Text(employee.employeeName),
      ),
    );
  }
}
