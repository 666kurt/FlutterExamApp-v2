import 'package:dio/dio.dart';
import 'package:flutter_application_1/repository/employee.dart';

class EmployeeRepository {
  final Dio _dio = Dio();
  final String url = 'https://dummy.restapiexample.com/api/v1/employees';

  Future<List<Employee>> fetchData() async {
    try {
      final Response response = await _dio.get(url);
      if (response.statusCode == 200) {
        final data = response.data['data'] as List;
        return data.map((item) => Employee.fromJson(item)).toList();
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
