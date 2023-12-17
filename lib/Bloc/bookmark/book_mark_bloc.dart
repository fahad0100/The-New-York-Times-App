import 'dart:async';

import 'package:assessment2023/data/models/news_model.dart';

import 'package:bloc/bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meta/meta.dart';

part 'book_mark_event.dart';
part 'book_mark_state.dart';

class BookMarkBloc extends Bloc<BookMarkEvent, BookMarkState> {
  BookMarkBloc() : super(BookMarkInitial()) {
    on<LoadBookMarkEvent>(load);
  }

  FutureOr<void> load(
      LoadBookMarkEvent event, Emitter<BookMarkState> emit) async {
    final box = GetStorage();

    final List readLocalBookmark = await box.read('newsBookMark');
    final List<NewsModel> allBookMarkNews =
        readLocalBookmark.map((e) => NewsModel.fromJson(e)).toList();
    // print(allBookMarkNews);
    emit(SuccessState(dataNews: allBookMarkNews));
  }
}
