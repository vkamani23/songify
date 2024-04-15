import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:songify/generated/assets.dart';
import 'package:songify/src/app/constants/colors.dart';
import 'package:songify/src/features/songs/presentation/components/songs_provider.dart';
import 'package:songify/src/features/songs/presentation/widgets/main_listing_screen.dart';

class SongListScreen extends ConsumerWidget {
  const SongListScreen({super.key});
  static const routeName = '/home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final songs = ref.watch(songsStateNotifier.select((value) => value.songs));
    return Scaffold(
      backgroundColor: ColorConstants.greenMatte,
      body: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
                floating: true,
                pinned: false,
                snap: false,
                elevation: 0,
                flexibleSpace: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned.fill(
                      child: Lottie.asset(
                        Assets.animationsSongify,
                        repeat: true,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
                backgroundColor: ColorConstants.greenMatte,
                expandedHeight: 150,
                leading: null,
                automaticallyImplyLeading: false,
              ),
            ];
          },
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: ColorConstants.greenMatte,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        constraints: const BoxConstraints(
                          maxWidth: 250,
                          minWidth: 200,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.12),
                              blurRadius: 12.0, // soften the shadow
                              spreadRadius: 8.0, //extend the shadow
                              offset: const Offset(
                                14.0, // Move to right 5  horizontally
                                14.0, // Move to bottom 5 Vertically
                              ),
                            ),
                          ],
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(12.0),
                            topLeft: Radius.circular(12.0),
                          ),
                        ),
                        child: TabBar(
                          indicatorColor: Theme.of(context).indicatorColor,
                          padding: EdgeInsets.zero,
                          indicatorPadding: EdgeInsets.zero,
                          labelPadding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 0,
                          ),
                          unselectedLabelColor: Colors.black45,
                          indicatorWeight: 1,
                          indicatorSize: TabBarIndicatorSize.label,
                          labelColor: ColorConstants.greenMatte,
                          unselectedLabelStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          labelStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                          tabs: const [
                            Tab(
                              text: "All Songs",
                            ),
                            Tab(
                              text: "Favourites",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  removeBottom: true,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(32.0),
                      ),
                    ),
                    child: TabBarView(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          child: MainSongListScreen(songs: songs),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          child: MainSongListScreen(
                            songs: songs
                                .where((element) => element.isFavourite)
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                    // songs.when(
                    //   data: (data) {
                    //     return ;
                    //   },
                    //   error: (error, st) {
                    //     debugPrintStack(stackTrace: st);
                    //     return Center(
                    //       child: Text(
                    //         error.toString(),
                    //         style: Theme.of(context)
                    //             .textTheme
                    //             .bodyMedium
                    //             ?.copyWith(color: Colors.red),
                    //       ),
                    //     );
                    //   },
                    //   loading: () {
                    //     return const Center(
                    //       child: CircularProgressIndicator(),
                    //     );
                    //   },
                    // ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
