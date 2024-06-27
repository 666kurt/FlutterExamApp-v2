import 'package:flutter/material.dart';
import 'package:flutter_application_1/repository/employee.dart';
import 'package:flutter_application_1/repository/employee_repository.dart';
import 'package:flutter_application_1/screens/employee_details_screen.dart';

final class EmployeeListScreen extends StatelessWidget {
  final EmployeeRepository employeeRepository = EmployeeRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee List"),
      ),
      body: FutureBuilder(
        future: employeeRepository.fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
                child: Text('Oops.. Some error :( ${snapshot.error}'));
          } else {
            final List<Employee> employees = snapshot.data!;
            return ListView.separated(
              itemCount: employees.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                final Employee employee = employees[index];
                return ListTile(
                  title: Text(employee.employeeName),
                  trailing: Icon(Icons.arrow_right_alt_rounded),
                  onTap: () {
                    Navigator.pushNamed(context, '/employee_details',
                        arguments: employee);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => EmployeeDetailsScreen(
                    //       employee: employee,
                    //     ),
                    //   ),
                    // );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
