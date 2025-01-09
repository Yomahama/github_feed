import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github_feed/features/feed/data/models/link.dart';

part 'link_tile_cubit.freezed.dart';
part 'link_tile_state.dart';

class LinkTileCubit extends Cubit<LinkTileState> {
  LinkTileCubit({required Link link}) : super(_getInitialState(link));

  static LinkTileState _getInitialState(Link link) {
    final params = link.getRequiredPathParameters();
    final paramsMap = {for (var e in params) e: ''};

    return LinkTileState(link: link, params: paramsMap);
  }

  void onParamChanged(String key, String value) {
    final updatedParams = Map<String, String>.from(state.params)..[key] = value.trim();
    emit(state.copyWith(params: updatedParams));
  }

  bool get linkHasRequiredParams => state.params.keys.isNotEmpty;
}
