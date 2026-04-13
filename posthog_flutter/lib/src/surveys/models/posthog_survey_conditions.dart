import 'package:flutter/foundation.dart';

/// Conditions for displaying a survey, such as URL matching or CSS selector targeting
@immutable
class PostHogSurveyConditions {
  factory PostHogSurveyConditions.fromDict(Map<String, dynamic> dict) {
    return PostHogSurveyConditions(
      url: dict['url'] as String?,
      urlMatchType: dict['urlMatchType'] as String?,
      selector: dict['selector'] as String?,
      deviceTypes: (dict['deviceTypes'] as List?)?.cast<String>(),
      deviceTypesMatchType: dict['deviceTypesMatchType'] as String?,
      seenSurveyWaitPeriodInDays:
          dict['seenSurveyWaitPeriodInDays'] as int?,
      events: dict['events'] != null
          ? Map<String, dynamic>.from(dict['events'] as Map)
          : null,
      actions: dict['actions'] != null
          ? Map<String, dynamic>.from(dict['actions'] as Map)
          : null,
    );
  }

  const PostHogSurveyConditions({
    this.url,
    this.urlMatchType,
    this.selector,
    this.deviceTypes,
    this.deviceTypesMatchType,
    this.seenSurveyWaitPeriodInDays,
    this.events,
    this.actions,
  });

  /// Target URL for the survey
  final String? url;

  /// The match type for the URL condition (e.g. "exact", "regex", "icontains")
  final String? urlMatchType;

  /// CSS selector for identifying where the survey should be displayed
  final String? selector;

  /// Device types the survey should be shown on
  final List<String>? deviceTypes;

  /// The match type for device type conditions
  final String? deviceTypesMatchType;

  /// Minimum wait period in days before showing the survey again
  final int? seenSurveyWaitPeriodInDays;

  /// Event-based conditions for displaying the survey
  final Map<String, dynamic>? events;

  /// Action-based conditions for displaying the survey
  final Map<String, dynamic>? actions;
}
