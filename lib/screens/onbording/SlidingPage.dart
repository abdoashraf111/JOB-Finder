import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joobfinder/screens/onbording/pageview.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../CustomItems/CustomButton.dart';
import '../Signin/Signin.dart';
import 'Cubit/onbording_cubit.dart';

class SlidingPage extends StatelessWidget {
  SlidingPage({super.key});
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnbordingCubit,OnbordingState>(
      builder: (context, state) =>
       Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              PageView(
                controller: _pageController,
                onPageChanged: (value) {
                   BlocProvider.of<OnbordingCubit>(context).changePage(value: value);
                },
                children: [
                  Pageviews(
                      text1: "Find a job, and ",
                      text2: "start building ",
                      text3: "your career from now on",
                      smalltext:
                          "Explore over 25,924 available job roles and upgrade your operator now.",
                      image: "lib/images/Background.png"),
                  Pageviews(
                      text1: "Hundreds of jobs are waiting for you to ",
                      text2: "join together",
                      text3: "",
                      smalltext:
                          "Immediately join us and start applying for the job you are interested in.",
                      image: "lib/images/Background 2.png"),
                  Pageviews(
                      text1: "Get the best ",
                      text2: "choice for the job ",
                      text3: "you've always dreamed of",
                      smalltext:
                          "The better the skills you have, the greater the good job opportunities for you.",
                      image: "lib/images/Background 3.png"),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Image.asset("lib/images/Logo1.png"),
                        // SizedBox(width:MediaQuery.of(context).size.width/2),
                        const Spacer(
                          flex: 1,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (context) => SignIn(),
                            ));
                          },
                          child: const Text("Skip", style: TextStyle(fontSize: 16)),
                        ),
                      ],
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    SmoothPageIndicator(
                        effect: CustomizableEffect(
                            dotDecoration: DotDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: const Color(0xffADC8FF)),
                            activeDotDecoration: DotDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(8))),
                        controller: _pageController,
                        count: 3),
                    const SizedBox(
                      height: 36,
                    ),
                    CustomButton(
                      text: BlocProvider.of<OnbordingCubit>(context).numPage == 2 ? "Get Start" : "Next",
                      fun: () {
                        if (BlocProvider.of<OnbordingCubit>(context).numPage == 2) {
                          // BlocProvider.of<SignInCubit>(context).sharePref();
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => SignIn(),
                          ));
                        } else {
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.linear);
                        }
                      },
                      buttoncolor: const Color(0xff3366FF),
                      textcolor: Colors.white,
                    ),
                    const SizedBox(
                      height: 56,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
