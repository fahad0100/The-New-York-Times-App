import 'package:assessment2023/Blocs/nav_bloc/nav_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavScreen extends StatelessWidget {
  const NavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<NavBlocBloc>();
    return BlocBuilder<NavBlocBloc, NavBlocState>(
      builder: (context, state) {
        if (state is SuccessState) {
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: state.index,
                // selectedItemColor: Colors.black,
                useLegacyColorScheme: false,
                enableFeedback: false,
                type: BottomNavigationBarType.shifting,
                unselectedItemColor: Colors.grey.withOpacity(0.5),
                onTap: (index) {
                  bloc.add(ChangeEvent(index: index));
                },
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.newspaper,
                      ),
                      label: "News"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.bookmark), label: "Bookmarks")
                ]),
            body: bloc.screen[state.index],
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
