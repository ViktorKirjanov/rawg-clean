import 'package:debouncer_widget/debouncer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rawg_clean/config/theme/app_themes.dart';
import 'package:rawg_clean/features/games/presentation/blocs/games/remote_bloc/remote_games_bloc.dart';

class SearchTextInput extends StatelessWidget {
  SearchTextInput({super.key});

  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) => Debouncer(
        timeout: const Duration(milliseconds: 1000),
        action: () {
          // context.read<SearchBloc>()
          //   ..add(SearchProducts(_textEditingController.text))
          //   ..add(const GetFirstPage());
        },
        builder: (debouncerContext, _) => Expanded(
          child: _Input(
            textEditingController: _textEditingController,
            onChanged: () => Debouncer.execute(debouncerContext),
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

  @override
  Widget build(BuildContext context) => BlocBuilder<RemoteGamesBloc, RemoteGamesState>(
        // buildWhen: (previous, current) => previous.search != current.search,
        builder: (context, state) => SizedBox(
          height: 60.0,
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: textEditingController,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: AppTheme.white,
                    ),
                    hintText: 'Search ...',
                  ),
                  onChanged: (_) => onChanged(),
                ),
              ),
            ],
          ),
        ),
      );
}
