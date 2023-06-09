
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joobfinder/screens/Signin/Cubit/sign_in_cubit.dart';
import 'package:joobfinder/screens/forgotpassword/newpassword/new_pass_word_cubit.dart';
import 'package:joobfinder/screens/onbording/Cubit/onbording_cubit.dart';
import 'package:joobfinder/screens/onbording/SplashScreen.dart';
import 'CustomItems/Custom_Card/custom_card_cubit.dart';
import 'Services/sharedprefeances.dart';
import 'controller/data_cubit.dart';

void main() async{
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await MyCache.init();

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) =>SignInCubit() ,),
          BlocProvider(create: (context) =>OnbordingCubit() ,),
          BlocProvider(create:(context) => NewPassWordCubit(),),
          BlocProvider(create:(context) => CustomCardCubit(),),
          BlocProvider(create: (context) => DataCubit()..getJob()..showFavorites(),),

        ],
        child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home:
        // SlidingPage(),
        //     SignIn(),
        //     ApplyDone(),
        // CreateAccount2(),
        SplashScreen(),
        //   SearchScreen(),
        // JobDetails(),
        // HomeNavigationBar() ,
      ),
    );
  }
}
