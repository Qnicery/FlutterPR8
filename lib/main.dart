import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/features/hotels/screens/hotels_screen.dart';

import 'features/hotels/data/history_provider.dart';
import 'features/hotels/models/booking.dart';
import 'features/hotels/models/hotel.dart';
import 'features/hotels/screens/history_screen.dart';
import 'features/hotels/screens/hotel_detail_screen.dart';
import 'features/hotels/screens/profile_screen.dart';
import 'features/hotels/screens/settings_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Booking> _history = [];

  void _addBooking(Booking booking) {
    setState(() {
      _history.add(booking);
    });
  }
  final GoRouter _router = GoRouter(
    initialLocation: '/hotels',
    routes: [
      GoRoute(
        name: 'hotels',
        path: '/hotels',
        builder: (context, state) => const HotelsScreen(),
        routes: [
          GoRoute(
            name: 'hotelDetail',
            path: 'detail',
            builder: (context, state) {
              final hotel = state.extra as Hotel;
              return HotelDetailScreen(hotel: hotel);
            },
          ),
        ],
      ),
      GoRoute(
        name: 'history',
        path: '/history',
        builder: (context, state)=> const HistoryScreen(),
      ),
      GoRoute(
        name: 'profile',
        path: '/profile',
        builder: (context, state) => const ProfileScreen(),
        routes: [
          GoRoute(
            name: 'settings',
            path: 'settings',
            builder: (context, state) => const SettingsScreen(),
          ),
        ],
      ),
    ],
  );
  @override
  Widget build(BuildContext context) {


    return HistoryProvider(
      history: _history,
      addBooking: _addBooking,
      child: MaterialApp.router(
        title: 'Бронирование отелей',
        theme: ThemeData(primarySwatch: Colors.blue),
        routerConfig: _router,
      ),
    );
  }
}

