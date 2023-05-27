import 'dart:async';

import 'package:clean_arc_with_riverpod/presentation/onboarding/onboarding_event.dart';

import 'onboarding_state.dart';

class OnboardingViewModel{

  OnboardingViewModel();

  OnboardingState _state = OnboardingState();

  OnboardingState get state => _state;

  final _eventController = StreamController<OnboardingEvent>();

  Stream<OnboardingEvent> get eventStream => _eventController.stream;

  void onEvent(OnboardingEvent event) {
    event.when(onboarding: (_)=> _setOnboarded(onboarded: true));
  }

  void _setOnboarded({required bool onboarded}){
    _state = state.copyWith(isOnboarded : onboarded);
  }
}