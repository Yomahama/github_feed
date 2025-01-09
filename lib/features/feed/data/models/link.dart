import 'package:freezed_annotation/freezed_annotation.dart';

part 'link.freezed.dart';
part 'link.g.dart';

@freezed
class Link with _$Link {
  const Link._();

  const factory Link({
    @Default('') String name,
    required String href,
    required String type,
  }) = _Link;

  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);

  static final pathParamRegex = RegExp(r'\{(\w+)\}');

  List<String> getRequiredPathParameters() => pathParamRegex.allMatches(href).map((match) => match.group(1)!).toList();

  String getHrefWithParams(Map<String, String> parameters) {
    return parameters.entries.fold(href, (result, entry) => result.replaceAll('{${entry.key}}', entry.value));
  }
}
