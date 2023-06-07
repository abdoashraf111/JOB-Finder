import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../controller/data_cubit.dart';
import '../../CustomItems/custom_icons.dart';
import 'AppliedScreen.dart';
import 'HomeScreen.dart';
import 'MassageScreen.dart';
import 'ProfileScreen.dart';
import 'SavedScreen.dart';




class HomeNavigationBar extends StatefulWidget {
  HomeNavigationBar({super.key,required this.pageNumber});
int pageNumber;

  @override
  State<HomeNavigationBar> createState() => _HomeNavigationBarState();
}

class _HomeNavigationBarState extends State<HomeNavigationBar> {
  final List<Widget> pages = [
     HomeScreen(),
    MassageScreen(),
    AppliedScreen(),
    SavedScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: pages[widget.pageNumber],
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            iconSize: 20,
            selectedFontSize: 10,
            showSelectedLabels: true,
            unselectedFontSize: 10,
            currentIndex: widget.pageNumber,
            items: [
              BottomNavigationBarItem(
                label: "Home",
                backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                icon: IconButton(
                    onPressed: () {
                      // BlocProvider.of<HomeNavigationBarCubit>(context).pageNumber0();
                      setState(() {
                        widget.pageNumber=0;
                      });
                    },
                    icon: widget.pageNumber == 0
                        ? const Icon(
                            CustomIcons.home,
                          )
                        : const Icon(CustomIcons.home)),
              ),
              BottomNavigationBarItem(
                label: "Massages",
                backgroundColor: Colors.white,
                icon: IconButton(
                    onPressed: () {
                      // BlocProvider.of<HomeNavigationBarCubit>(context).pageNumber1();
                      setState(() {
                        widget.pageNumber=1;
                      });
                    },
                    icon: widget.pageNumber == 1
                        ? const Icon(CustomIcons.message)
                        : const Icon(CustomIcons.message)),
              ),
              BottomNavigationBarItem(
                label: "Applied",
                backgroundColor: Colors.white,
                icon: IconButton(
                    onPressed: () {
                      // BlocProvider.of<HomeNavigationBarCubit>(context).pageNumber2();
                      setState(() {
                        widget.pageNumber=2;
                      });
                    },
                    icon: widget.pageNumber == 2
                        ? const Icon(CustomIcons.briefcase)
                        : const Icon(CustomIcons.briefcase)),
              ),
              BottomNavigationBarItem(
                label: "Saved",
                backgroundColor: Colors.white,
                icon: IconButton(
                    onPressed: ()async {
                      // BlocProvider.of<HomeNavigationBarCubit>(context).pageNumber3();
                      await BlocProvider.of<DataCubit>(context).showFavorites();
                      setState(() {
                        widget.pageNumber=3;
                      });
                    },
                    icon: widget.pageNumber == 3
                        ? const Icon(CustomIcons.archive_minus_bold)
                        : const Icon(CustomIcons.archive_minus)),
              ),
              BottomNavigationBarItem(
                label: "Profile",
                backgroundColor: Colors.white,
                icon: IconButton(
                    onPressed: () {
                      // BlocProvider.of<HomeNavigationBarCubit>(context).pageNumber4();
                      setState(() {
                        widget.pageNumber=4;
                      });
                    },
                    icon: widget.pageNumber == 4
                        ? Icon(CustomIcons.profile)
                        : Icon(CustomIcons.profile)),
              ),
            ]),
      );}

  }

