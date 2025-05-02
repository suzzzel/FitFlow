import 'dart:io';

import 'package:fitflow/features/auth/presentation/general/custom_text_field.dart';
import 'package:fitflow/features/general_comonents/exercise_model.dart';
import 'package:fitflow/features/search/search_ex/domain/providers/search_result_domain_provider.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/view_done_plan/edit_day_in_plan/components/exercise_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchExMainWidget extends ConsumerStatefulWidget {
  final Directory dir;
  const SearchExMainWidget({super.key, required this.dir});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SearchExMainWidgetState();
}

class _SearchExMainWidgetState extends ConsumerState<SearchExMainWidget> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: 27,
              right: 27,
              top: MediaQuery.of(context).size.height * 0.35),
          child: ListViewSearchEx(
            dir: widget.dir,
          ),
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.15,
                  left: 27,
                  right: 27),
              child: CustomTextField(
                controller: controller,
                labelText: 'Название упражнения',
                obscureText: false,
                keyboardType: TextInputType.text,
                isImputRight: true,
                onFieldSubmitted: (value) {
                  ref
                      .read(searchResultDomainProviderProvider.notifier)
                      .searchExercise(
                          nameOfExercise: controller.text, numberOfPage: 1);
                },
                suffixIcon: IconButton(
                    onPressed: () {
                      ref
                          .read(searchResultDomainProviderProvider.notifier)
                          .searchExercise(
                              nameOfExercise: controller.text, numberOfPage: 1);
                    },
                    icon: const Icon(Icons.search)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                height: 40,
                width: 100,
                color: Colors.red,
                child: const Text('filters'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ListViewSearchEx extends ConsumerWidget {
  final Directory dir;
  const ListViewSearchEx({super.key, required this.dir});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchProvider = ref.watch(searchResultDomainProviderProvider);
    return switch (searchProvider) {
      AsyncData(value: final items) ||
      AsyncLoading(value: final items?) =>
        _buildContent(items, searchProvider.isLoading, dir, ref),
      AsyncLoading() => const Center(child: CircularProgressIndicator()),
      AsyncError(
        :final error,
      ) =>
        ErrorWidget(error),
      _ => const SizedBox.shrink(),
    };
  }
}

Widget _buildContent(
    List<ExerciseModel> items, bool isLoading, Directory dir, WidgetRef ref) {
  return CustomScrollView(
    slivers: [
      SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) => _buildItem(items[index], dir),
          childCount: items.length,
        ),
      ),
      SliverToBoxAdapter(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : items.isNotEmpty
                    ? ElevatedButton(
                        onPressed: () {
                          ref
                              .read(searchResultDomainProviderProvider.notifier)
                              .newDownloadNextPage(
                                  nameOfExercise: 'жим', prevPage: 1);
                        },
                        child: const Text('Загрузить еще'),
                      )
                    : const SizedBox()),
      ),
    ],
  );
}

Widget _buildItem(ExerciseModel item, Directory dir) {
  final exIdGif = item.id.toString().padLeft(4, '0');
  final exGifFile = File('${dir.path}/exGifs/$exIdGif.gif');

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 200,
      color: Colors.orange,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ExerciseImage(exGifFile: exGifFile),
          Text(
            item.name,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}
