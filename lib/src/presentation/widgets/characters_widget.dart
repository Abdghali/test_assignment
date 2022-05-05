import 'package:casino_test/src/presentation/utility/const.dart';
import 'package:casino_test/src/presentation/widgets/custom_cached_network_image.dart';
import 'package:casino_test/src/presentation/widgets/custom_column_text.dart';
import 'package:flutter/material.dart';
import '../../data/models/character.dart';
import 'character_statues.dart';

class CharactersWidget extends StatelessWidget {
  final Character? character;
  CharactersWidget({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      alignment: Alignment.topLeft,
      padding: EdgeInsets.all(8),
      child: Container(
        height: size.height / 7,
        decoration: ShapeDecoration(
          color: Color.fromARGB(120, 204, 255, 255),
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCachedNetworkImage(
              image: character!.image,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width / 1.9,
                    child: Text(
                      character!.name,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CharacterStatues(
                    liveStatues: character!.status ==  alive
                        ? LiveStatues.alive
                        : character!.status == dead
                            ? LiveStatues.dead
                            : LiveStatues.unKnown,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: size.width / 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustumTextWithCpation(
                          caption: 'Species',
                          text: character!.species,
                        ),
                        CustumTextWithCpation(
                          caption: 'Gender',
                          text: character!.gender,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
