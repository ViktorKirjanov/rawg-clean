import 'package:debouncer_widget/debouncer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rawg_clean/config/theme/app_themes.dart';
import 'package:rawg_clean/features/games/presentation/blocs/games/remote_games_bloc/remote_games_bloc.dart';

class SearchTextInput extends StatefulWidget {
  const SearchTextInput({super.key});

  @override
  State<SearchTextInput> createState() => _SearchTextInputState();
}

class _SearchTextInputState extends State<SearchTextInput> {
  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) => Debouncer(
        timeout: const Duration(milliseconds: 1000),
        action: () => context.read<RemoteGamesBloc>().add(const GetFirstPage()),
        builder: (debouncerContext, _) => Expanded(
          child: _Input(
            textEditingController: _textEditingController,
            onChanged: () {
              context.read<RemoteGamesBloc>().add(AddSearch(search: _textEditingController.text));
              Debouncer.execute(debouncerContext);
            },
          ),
        ),
      );
}

class _Input extends StatelessWidget {
  const _Input({
    required this.textEditingController,
    required this.onChanged,
  });

  final TextEditingController textEditingController;
  final void Function() onChanged;

  void _clear(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
    textEditingController.clear();
    context.read<RemoteGamesBloc>()
      ..add(const AddSearch())
      ..add(const GetFirstPage());
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<RemoteGamesBloc, RemoteGamesState>(
        buildWhen: (previous, current) => previous.search != current.search,
        builder: (context, state) => SizedBox(
          height: 60.0,
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: textEditingController,
                  autocorrect: false,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search_rounded,
                      color: AppTheme.white,
                    ),
                    hintText: 'Search ...',
                    suffixIcon: GestureDetector(
                      onTap: () => _clear(context),
                      child: state.search != null && state.search!.isNotEmpty
                          ? Container(
                              color: Colors.transparent,
                              height: 56.0,
                              width: 56.0,
                              child: const Icon(
                                Icons.close_rounded,
                                color: AppTheme.white,
                              ),
                            )
                          : const SizedBox.shrink(),
                    ),
                  ),
                  onChanged: (_) => onChanged(),
                ),
              ),
            ],
          ),
        ),
      );
}
