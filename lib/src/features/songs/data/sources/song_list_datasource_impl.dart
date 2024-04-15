import 'package:songify/generated/assets.dart';
import 'package:songify/src/core/models/song.dart';
import 'package:songify/src/features/songs/data/sources/song_list_datasource.dart';

class SongListDatasourceImpl implements SongListDatasource {
  @override
  Future<List<Song>> getSongs() async {
    // TODO: Get this from firestore
    // TODO: Get user favourites and add them here
    return Future.value(
      [
        Song(
          id: '00000001',
          title: "On Repeat",
          artist: ["Marcus P."],
          audioUrl: Assets.audioOnrepeat,
          posterUrl: Assets.imagesOnRepeat,
          isFavourite: false,
          durationInSecs: 136,
        ),
        Song(
          id: '00000002',
          title: "Cozy Coffeehouse",
          artist: ["Lunar Years"],
          audioUrl: Assets.audioCozycoffeehouse,
          posterUrl: Assets.imagesCozyCoffeehouse,
          isFavourite: false,
          durationInSecs: 110,
        ),
        Song(
          id: '00000003',
          title: "Unbreakable Resolve",
          artist: ["Lunar Years"],
          audioUrl: Assets.audioUnbreakableresolve,
          posterUrl: Assets.imagesUnbreakableResolve,
          isFavourite: false,
          durationInSecs: 124,
        ),
        Song(
          id: '00000004',
          title: "Dreams",
          artist: ["Benjamin Tissot"],
          audioUrl: Assets.audioDreams,
          posterUrl: Assets.imagesDreams,
          isFavourite: false,
          durationInSecs: 210,
        ),
        Song(
          id: '00000005',
          title: "Rainy Day",
          artist: ["Yunior Arronte"],
          audioUrl: Assets.audioRainyday,
          posterUrl: Assets.imagesRainyDay,
          isFavourite: false,
          durationInSecs: 261,
        ),
        Song(
          id: '00000006',
          title: "Sleepless",
          artist: ["Diffie Bosman"],
          audioUrl: Assets.audioSleepless,
          posterUrl: Assets.imagesSleepless,
          isFavourite: false,
          durationInSecs: 154,
        ),
        Song(
          id: '00000007',
          title: "Melancholy Lull",
          artist: ["Vital"],
          audioUrl: Assets.audioMelancholylull,
          posterUrl: Assets.imagesMelancholyLull,
          isFavourite: false,
          durationInSecs: 136,
        ),
        Song(
          id: '00000008',
          title: "Sunset Reverie",
          artist: ["Tomas Novoa"],
          audioUrl: Assets.audioSunsetreverie,
          posterUrl: Assets.imagesSunsetReverie,
          isFavourite: false,
          durationInSecs: 198,
        ),
        Song(
          id: '00000009',
          title: "Event Horizon",
          artist: ["Lunar Years"],
          audioUrl: Assets.audioEventhorizon,
          posterUrl: Assets.imagesEventHorizon,
          isFavourite: false,
          durationInSecs: 156,
        ),
        Song(
          id: '00000010',
          title: "Refract",
          artist: ["Diffie Bosman"],
          audioUrl: Assets.audioRefract,
          posterUrl: Assets.imagesRefract,
          isFavourite: false,
          durationInSecs: 296,
        ),
      ],
    );
  }
}

// On Repeat - Marcus P. ->
// Unbreakable Resolve - Lunar Years -> M0LD9P3FGQ8OVQK6
// Cozy Coffeehouse - Lunar Years -> 0EMNKUTXCGOIGA5O
// Dreams - Benjamin Tissot -> WJVEK9R3FWDZBTLS
// Rainy Day - Yunior Arronte -> E8TQEMI2KGI54M0W
// Sleepless - Diffie Bosman -> WH3TUEWQ7TSGY5SG
// Melancholy Lull - Vital -> 5I2E1LXYZFWWU1TP
// Sunset Reverie - Tomas Novoa -> ZDLNVDNMDIB8A04A
// Event Horizon - Lunar Years -> FDZ7KDMUXMQDGGBD
// Refract - Diffie Bosman -> RDC3XRK0WSKBXYWG
