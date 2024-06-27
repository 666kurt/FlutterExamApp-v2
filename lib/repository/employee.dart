final class Employee {
  final int id;
  final String employeeName;
  final int employeeSalary;
  final int employeeAge;

  Employee({
    required this.id,
    required this.employeeName,
    required this.employeeSalary,
    required this.employeeAge,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'],
      employeeName: json['employee_name'],
      employeeSalary: json['employee_salary'],
      employeeAge: json['employee_age'],
    );
  }
}
