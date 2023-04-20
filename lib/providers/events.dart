import 'package:riverpod/riverpod.dart';

import '../index.dart';
import '../repo/events.dart';

final eventsProvider = StateNotifierProvider<EventsList, List<Event>>((ref) {
  return EventsList(const [])..load();
});
