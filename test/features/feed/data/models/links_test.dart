import 'package:flutter_test/flutter_test.dart';
import 'package:github_feed/features/feed/data/models/link.dart';
import 'package:github_feed/features/feed/data/models/links.dart';

main() {
  test('Transforms values from snake case to title case', () {
    const links = Links(
      links: {
        'url_one': Link(href: 'url1', type: ''),
        'url_two': Link(href: 'url2', type: ''),
      },
    );

    final values = links.values;

    expect(values, hasLength(2));
    expect(values[0].name, 'Url One');
    expect(values[1].name, 'Url Two');
  });
}
