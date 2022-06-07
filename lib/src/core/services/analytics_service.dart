import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:liberty_fashion/src/core/utils/utils.dart';

abstract class AnalyticsService {
  Future setUserProperties({required String userId});

  Future logLogin();

  Future logSignup();

  FirebaseAnalyticsObserver get firebaseAnalyticsObserver;

  Future setCurrentScreen(
      {required String screenName, required String screenClassOverride});

  Future logEvent(
      {required String eventName, Map<String, dynamic>? parameters});
}

class AnalyticsServiceImpl extends AnalyticsService {
  final FirebaseAnalytics _firebaseAnalytics = FirebaseAnalytics.instance;

  FirebaseAnalyticsObserver _getAnalyticsObserver() =>
      FirebaseAnalyticsObserver(analytics: _firebaseAnalytics);

  @override
  FirebaseAnalyticsObserver get firebaseAnalyticsObserver =>
      _getAnalyticsObserver();

  @override
  Future logEvent(
      {required String eventName, Map<String, dynamic>? parameters}) async {
    try {
      await _firebaseAnalytics.logEvent(
          name: eventName, parameters: parameters);
      logger.i("eventName $eventName logged");
    } catch (_) {}
  }

  @override
  Future logLogin() async {
    try {
      await _firebaseAnalytics.logLogin();
    } catch (_) {}
  }

  @override
  Future logSignup() async {
    try {
      await _firebaseAnalytics.logSignUp(signUpMethod: 'email');
    } catch (_) {}
  }

  @override
  Future setCurrentScreen(
      {required String screenName, required String screenClassOverride}) async {
    try {
      await _firebaseAnalytics.setCurrentScreen(
          screenName: screenName, screenClassOverride: screenClassOverride);
    } catch (_) {}
  }

  @override
  Future setUserProperties({required String userId}) async {
    try {
      await _firebaseAnalytics.setUserId(id: userId);

      /// Use this to set other user properties
      // await _firebaseAnalytics.setUserProperty(name: name, value: value)
    } catch (_) {}
  }
}
