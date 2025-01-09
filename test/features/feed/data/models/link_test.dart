import 'package:flutter_test/flutter_test.dart';
import 'package:github_feed/features/feed/data/models/link.dart';

main() {
  group('Link object', () {
    test('Gets multiple path parameters from url', () {
      const link = Link(href: 'https://github.com/{user}/{repo}/discussions/categories/{category}', type: '');

      final params = link.getRequiredPathParameters();

      expect(params, ['user', 'repo', 'category']);
    });

    test('Gets no path parameters from url', () {
      const link = Link(href: 'https://github.com/timeline', type: '');

      final params = link.getRequiredPathParameters();

      expect(params, params);
    });

    test('Returns correct url with replaced required parameters', () {
      const link = Link(href: 'https://github.com/{user}/{repo}/discussions/categories/{category}', type: '');

      final params = {
        'user': '1',
        'repo': '2',
        'category': '3',
      };

      final actual = link.getHrefWithParams(params);

      const expected = 'https://github.com/1/2/discussions/categories/3';
      expect(actual, expected);
    });

    test('Returns same url if no or incorrect are params given', () {
      const link = Link(href: 'https://github.com/{user}/{repo}/discussions/categories/{category}', type: '');

      final params = {
        "{'user'}": '1',
        '': '',
      };

      final actual = link.getHrefWithParams(params);

      expect(actual, link.href);
    });
  });
}
