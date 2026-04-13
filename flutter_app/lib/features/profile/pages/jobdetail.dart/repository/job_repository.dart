import 'package:dio/dio.dart';
import 'package:flutter_app/core/services/api_service.dart';
import 'package:flutter_app/features/profile/pages/jobdetail.dart/model/model_class.dart';

class EmployeeRepository {
  final ApiService api;

  EmployeeRepository(this.api);
  Future<EmployeeModel> getUser(int userId) async {
    try {
      final res = await api.get("/employee/employees/$userId");

      if (res.statusCode == 200 && res.data != null) {
        return EmployeeModel.fromJson(res.data);
      }

      throw Exception("Invalid response");
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? e.message);
    } catch (e) {
      throw Exception("Something went wrong: $e");
    }
  }
}
