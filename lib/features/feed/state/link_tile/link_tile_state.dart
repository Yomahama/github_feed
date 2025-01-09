part of 'link_tile_cubit.dart';

@freezed
class LinkTileState with _$LinkTileState {
  const LinkTileState._();
  const factory LinkTileState({
    required Link link,
    required Map<String, String> params,
  }) = _LinkTileState;

  bool get someInputParamsAreEmpty => params.entries.any((value) => value.value.isEmpty);

  Link get updatedLink => link.copyWith(href: link.getHrefWithParams(params));
}
