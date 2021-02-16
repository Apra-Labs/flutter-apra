import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomIndexProvider =
    StateNotifierProvider<BottomActionBarNotifier>((ref) {
  return BottomActionBarNotifier(1);
});

class BottomActionBarNotifier extends StateNotifier<int> {
  BottomActionBarNotifier(int state) : super(state);

  void setBottomIndex(int i) {
    state = i;
  }
}
