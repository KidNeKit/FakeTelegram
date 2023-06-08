part of 'navigation_cubit.dart';

class NavigationState {
  final int index;

  const NavigationState(this.index);

  NavigationState copyWith(int index) => NavigationState(index);
}
