// import 'package:casino_test/src/presentation/bloc/main_state.dart';
// import 'package:casino_test/src/presentation/widgets/character_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

// import '../../data/models/character.dart';
// import '../bloc/main_bloc.dart';
// import '../bloc/main_event.dart';

// class SuccessfulCharactersWidget extends StatefulWidget {
//   SuccessfulMainPageState myState;
  
//   SuccessfulCharactersWidget({Key? key, required this.myState})
//       : super(key: key);

//   @override
//   State<SuccessfulCharactersWidget> createState() =>
//       _SuccessfulCharactersWidgetState();
// }

// class _SuccessfulCharactersWidgetState
//     extends State<SuccessfulCharactersWidget> {
//   static const _pageSize = 20;
//   final PagingController<int, Character> _pagingController =PagingController(firstPageKey: 0);
//  late final MainPageBloc _counterBloc;
//   Future<void> _fetchPage(int pageKey,context) async {
//        //  _counterBloc = BlocProvider.of<MainPageBloc>(context);
//         //  _counterBloc.add(GetTestDataOnMainPageEvent(2));


//     print("fetch data __________");
//     print(pageKey/20);
//      try {
//       final newItems =  widget.myState.characters;
//       final isLastPage = newItems.length < _pageSize;
//       if (isLastPage) {
//         _pagingController.appendLastPage(newItems);
//       } else {
//         final nextPageKey = pageKey + newItems.length as int;
//         _pagingController.appendPage(newItems, nextPageKey);
//       }
//     } catch (error) {
//       _pagingController.error = error;
//     }  }

//   @override
//   void initState() {
//     _pagingController.addPageRequestListener((pageKey) {
//       _fetchPage(pageKey,context);
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) => PagedListView<int, Character>(
//         pagingController: _pagingController,
//         builderDelegate: PagedChildBuilderDelegate<Character>(
//           itemBuilder: (context, item, index) =>
//               CharacterWidget(character: item),
//         ),
//       );

//   @override
//   void dispose() {
//     _pagingController.dispose();
//     super.dispose();
//   }
// }
