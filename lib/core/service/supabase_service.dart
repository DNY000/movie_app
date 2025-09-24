import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final SupabaseClient _client = Supabase.instance.client;

  Future<dynamic> postFunction(String functionName, {Map<String, dynamic>? params}) async {
    try {
      final response = await _client.rpc(functionName, params: params ?? {});
      return response;
    } catch (e) {
      throw Exception("POST RPC Error: $e");
    }
  }

  Future<dynamic> putFunction(String functionName, {required Map<String, dynamic> params}) async {
    try {
      final response = await _client.rpc(functionName, params: params);
      return response;
    } catch (e) {
      throw Exception("PUT RPC Error: $e");
    }
  }

  Future<dynamic> deleteFunction(String functionName, {required Map<String, dynamic> params}) async {
    try {
      final response = await _client.rpc(functionName, params: params);
      return response;
    } catch (e) {
      throw Exception("DELETE RPC Error: $e");
    }
  }
}
