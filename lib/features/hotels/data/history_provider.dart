import 'package:flutter/material.dart';
import '../models/booking.dart';

class HistoryProvider extends InheritedWidget {
  final List<Booking> history;
  final void Function(Booking) addBooking;

  const HistoryProvider({
    super.key,
    required this.history,
    required this.addBooking,
    required super.child,
  });

  static HistoryProvider of(BuildContext context) {
    final HistoryProvider? result =
    context.dependOnInheritedWidgetOfExactType<HistoryProvider>();
    assert(result != null, 'No HistoryProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(HistoryProvider oldWidget) =>
      history.length != oldWidget.history.length;
}
