import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../core/assets_svg_images.dart';
import '../../../core/basic_of_every_game.dart';
import '../../../core/phonetics_color.dart';
import '../../../cubit/current_game_phonetics_cubit.dart';
import '../manager/click_the_sound_cubit.dart';
import '../widgets/stroked_text_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClickTheSoundGame extends StatelessWidget {
  const ClickTheSoundGame({super.key});

  @override
  Widget build(BuildContext context) {
    final isInteracting =
        context.read<CurrentGamePhoneticsCubit>().state.stateOfAvatar;
    return BlocConsumer<ClickTheSoundCubit, ClickTheSoundInitial>(
      listener: (context, state) {},
      builder: (context0, stateOfGame) {
        context.read<CurrentGamePhoneticsCubit>().saveTheStringWillSay(
            stateOfStringIsWord: false,
            stateOfStringWillSay: stateOfGame.gameData.mainLetter ?? '');
        return Container(
          margin: const EdgeInsets.only(bottom: 30, top: 50, left: 70),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
          width: MediaQuery.of(context).size.width - 265,
          height: MediaQuery.of(context).size.width < 760
              ? MediaQuery.of(context).size.height * 0.7
              : MediaQuery.of(context).size.height * 0.65,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border:
                Border.all(color: AppColorPhonetics.darkBorderColor, width: 8),
          ),
          child: StaggeredGridView.count(
            crossAxisCount: MediaQuery.of(context).size.width < 760 ? 11 : 12,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: MediaQuery.of(context).size.width < 760 ? 5 : 3,
            crossAxisSpacing: MediaQuery.of(context).size.width < 760 ? 8 : 11,
            staggeredTiles: stateOfGame.finalListOfPosition ?? [],
            children: List.generate(
              (stateOfGame.gameData.gameLetters?.length ?? 0),
              (index) => Center(
                child: _buildBubbleWidget(
                  letter: stateOfGame.gameData.gameLetters?[index].letter ?? '',
                  viewModel: context.read<ClickTheSoundCubit>(),
                  index: index,
                  onPress: isInteracting != null &&
                          isInteracting != BasicOfEveryGame.stateOIdle
                      ? null
                      : () async {
                          if (stateOfGame.gameData.gameLetters?[index].letter ==
                              stateOfGame.gameData.mainLetter) {
                            await context
                                .read<CurrentGamePhoneticsCubit>()
                                .animationOfCorrectAnswer();

                            await context
                                .read<ClickTheSoundCubit>()
                                .incrementCorrectAnswerCount(index);
                            await context
                                .read<CurrentGamePhoneticsCubit>()
                                .addStarToStudent(
                                    stateOfCountOfCorrectAnswer:
                                        ((stateOfGame.correctIndexes?.length ??
                                            0)),
                                    mainCountOfQuestion: stateOfGame
                                            .gameData.numOfLetterRepeat ??
                                        0);
                            if ((stateOfGame.correctIndexes?.length ?? 0) ==
                                stateOfGame.gameData.numOfLetterRepeat) {
                              Future.delayed(const Duration(seconds: 2),
                                  () async {
                                // context
                                //     .read<CurrentGamePhoneticsCubit>()
                                //     .sendStars(
                                //         gamesId: [stateOfGame.gameData.id ?? 0],
                                //         actionOfStars: (int countOfStars,
                                //             List<int> listOfIds) {
                                //           // context
                                //           //     .read<JourneyBarCubit>()
                                //           //     .sendStars(
                                //           //         gamesId: listOfIds,
                                //           //         countOfStar: countOfStars);
                                //         });
                                Navigator.of(context).pop();
                              });
                            }
                          } else {
                            context
                                .read<CurrentGamePhoneticsCubit>()
                                .addWrongAnswer();
                            Future.delayed(const Duration(seconds: 2),
                                () async {
                              await context
                                  .read<ClickTheSoundCubit>()
                                  .sayTheLetter();
                            });
                          }
                          context
                              .read<CurrentGamePhoneticsCubit>()
                              .backToMainAvatar();
                        },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBubbleWidget({
    required String letter,
    required VoidCallback? onPress,
    required int index,
    required ClickTheSoundCubit viewModel,
  }) {
    return SizedBox(
      width: 64,
      height: 64,
      child: InkWell(
        onTap: viewModel.state.correctIndexes?.contains(index) ?? false
            ? null
            : onPress,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              viewModel.state.correctIndexes?.contains(index) ?? false
                  ? AppSvgImages.bubbleDisabled
                  : AppSvgImages.bubble,
              width: 64,
              height: 64,
            ),
            // if (viewModel.state.isInteracting && viewModel.state.selectedItem == index &&  viewModel.state.correctIndexes?.contains(index) == false)
            //   Image.asset(
            //     AppImagesPhonetics.bubbleSelected,
            //     fit: BoxFit.cover,
            //   ),
            StrokedText(
              fontSize: 37,
              text: letter,
              isDisabled:
                  viewModel.state.correctIndexes?.contains(index) ?? false,
            ),
          ],
        ),
      ),
    );
  }
}
