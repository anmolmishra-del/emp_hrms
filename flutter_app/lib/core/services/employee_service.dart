import '../services/api_service.dart';

class EmployeeService {
  final ApiService api = ApiService();

  Future<Map<String, dynamic>?> getEmployee(int id) async {
    try {
      final response = await api.get("/employee/employees/$id");

      return response.data;
    } catch (e) {
      print("API ERROR: $e");
      return null;
    }
  }
}
