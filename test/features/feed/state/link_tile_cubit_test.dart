import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_feed/features/feed/data/models/link.dart';
import 'package:github_feed/features/feed/presentation/state/link_tile/link_tile_cubit.dart';

void main() {
  group('LinkTileCubit', () {
    const link = Link(href: 'https://github.com/timeline/{user}', type: '');

    blocTest(
      'Creates a cubit with the correct state',
      build: () => LinkTileCubit(link: link),
      expect: () => [],
      verify: (cubit) {
        expect(cubit.linkHasRequiredParams, true);
        expect(cubit.state.params.keys.length, 1);
        expect(cubit.state.someInputParamsAreEmpty, true);
      },
    );

    blocTest(
      'Emit [LinkTileState] when onParamChanged is called',
      build: () => LinkTileCubit(link: link),
      act: (cubit) => cubit.onParamChanged('user', '1'),
      expect: () => [
        const LinkTileState(link: link, params: {'user': '1'}),
      ],
      verify: (cubit) {
        expect(cubit.state.someInputParamsAreEmpty, false);
        expect(cubit.state.updatedLink, link.copyWith(href: 'https://github.com/timeline/1'));
      },
    );
  });
}
