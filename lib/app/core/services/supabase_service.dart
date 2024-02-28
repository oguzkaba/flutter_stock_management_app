// ignore_for_file:  sort_constructors_first
// ignore_for_file: public_member_api_docs

import 'dart:async';

import 'package:supabase_flutter/supabase_flutter.dart';

abstract class ISupabaseService {
  final _supabase = Supabase.instance.client;

  ///Authentication operations
  Future<AuthResponse> signinWithEmail({
    required String email,
    required String password,
  });
  StreamSubscription<AuthState> onAuthStateChange(
    void Function(AuthState state) callback,
  );
  Future<UserResponse> updateUser({required UserAttributes userAttributes});
  Future<void> signOut();

  ///Database operations
  Future<List<dynamic>> fetchData({required String table});
  Future<void> insertData({required String table, required Object model});
  Future<void> deleteData({
    required String table,
    required String filterColumn,
    required Object filterValue,
  });
  Future<void> updateData({
    required String table,
    required Map<dynamic, dynamic> newModel,
    required String filterColumn,
    required Object filterValue,
  });

  ///Realtime operations
  SupabaseStreamFilterBuilder subscribeToData({
    required String table,
  });
}

class SupabaseService extends ISupabaseService {
  static SupabaseService? _instance;
  // ignore: prefer_constructors_over_static_methods
  static SupabaseService get instance => _instance ??= SupabaseService._();

  SupabaseService._();

  User? get user => _supabase.auth.currentUser;

  @override
  Future<List<dynamic>> fetchData({required String table}) async {
    //await signinWithEmail(email: 'oguzkaba1987@gmail.com', password: '523252');
    return await _supabase.from(table).select();
  }

  @override
  Future<void> insertData({
    required String table,
    required Object model,
  }) async {
    await _supabase.from(table).insert(model);
  }

  @override
  Future<void> updateData({
    required String table,
    required Map<dynamic, dynamic> newModel,
    required String filterColumn,
    required Object filterValue,
  }) async {
    await _supabase.from(table).update(newModel).eq(filterColumn, filterValue);
  }

  @override
  Future<void> deleteData({
    required String table,
    required String filterColumn,
    required Object filterValue,
  }) async {
    await _supabase.from(table).delete().eq(filterColumn, filterValue);
  }

  @override
  Future<AuthResponse> signinWithEmail({
    required String email,
    required String password,
  }) async {
    return _supabase.auth.signInWithPassword(email: email, password: password);
  }

  @override
  Future<UserResponse> updateUser({
    required UserAttributes userAttributes,
  }) async {
    return _supabase.auth.updateUser(
      userAttributes,
    );
  }

  @override
  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }

  @override
  SupabaseStreamFilterBuilder subscribeToData({
    required String table,
  }) {
    return _supabase.from(table).stream(primaryKey: ['id']);
  }

  @override
  StreamSubscription<AuthState> onAuthStateChange(
    void Function(AuthState state) callback,
  ) {
    return _supabase.auth.onAuthStateChange.listen(callback);
  }
}
