import 'package:flutter/material.dart';
import 'package:app_dashborad/app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://vvnazyergzerjhadoaxj.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZ2bmF6eWVyZ3plcmpoYWRvYXhqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDYxNDYwMzQsImV4cCI6MjA2MTcyMjAzNH0._sC6EcodS3LR2pBXTBmksufNWs7ze6CfcFvgEQXTqv8',
  );
  runApp(const App());
}