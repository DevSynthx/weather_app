import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/ui/screen/search_screen.dart';
import 'floating search/src/floating_search_bar.dart';
import 'floating search/src/floating_search_bar_actions.dart';
import 'floating search/src/floating_search_bar_transition.dart';
import 'floating search/src/widgets/circular_button.dart';

class SearchBar extends HookConsumerWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingSearchBar(
      backdropColor: Colors.transparent,
      elevation: 0,
      transition: CircularFloatingSearchBarTransition(),

      onQueryChanged: (query) {},

      onSubmitted: (query) {
        if (query.isEmpty) {
          return;
        } else {
          showModalBottomSheet(
              backgroundColor: Colors.transparent,
              // backgroundColor: const Color(0xff8862FC),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30.0),
                ),
              ),
              context: context,
              builder: (context) {
                return BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                  child: SearchPage(
                    cityName: query,
                  ),
                );
              });
        }
      },

      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: const Icon(Icons.place),
            onPressed: () {},
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],

      // backdropColor: Colors.transparent,
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      builder: (BuildContext context, Animation<double> transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
        );
        //  SizedBox(
        //   height: 100,
        //   child: ListView.builder(
        //       shrinkWrap: true,
        //       itemCount: cities.length,
        //       itemBuilder: (context, index) {
        //         final place = cities[index];
        //         return Text(place.name.toString());
        //       }),
        // );
      },
    );
  }
}
