import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../CustomItems/Custom_job.dart';
import '../../CustomItems/Custom_Credit.dart';
import '../../CustomItems/custom_icons.dart';
import '../../controller/data_cubit.dart';
import '../JobDetails/job_Details.dart';
import 'SearchScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 24, left: 24),
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                   Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Hi, ${BlocProvider.of<DataCubit>(context).modelSign.user!.name}👋",
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold)),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text("Create a better future for yourself here",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey)),
                        ],
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      const CircleAvatar(
                        radius: 25,
                        backgroundColor: Color(0xffD1D5DB),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 24,
                          child: Icon(Icons.recycling_outlined),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  InkWell(
                    onTap: () {
                      // showSearch(context: context, delegate: search());
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SearchScreen(),
                      ));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(13),
                        child: Row(
                          children: [
                            Icon(CustomIcons.search_normal),
                            SizedBox(
                              width: 14,
                            ),
                            Text("Search....",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.grey)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Text("Suggested Job",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      const Spacer(
                        flex: 1,
                      ),
                      TextButton(
                          onPressed: () {}, child: const Text("View all")),
                    ],
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(
                    width: 24,
                  ),
                  CustomCredit(
                    colorBack: const Color(0xff091A7A),
                    colorText: Colors.white,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  CustomCredit(
                    colorBack: const Color(0XffF4F4F5),
                    colorText: Colors.black,
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24, left: 24),
              child: Column(children: [
                const SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    const Text("Recent Job",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const Spacer(
                      flex: 1,
                    ),
                    TextButton(onPressed: () {}, child: const Text("View all")),
                  ],
                ),
                const SizedBox(height: 8),
                BlocBuilder<DataCubit, DataState>(builder: (context, state) {
                    return SizedBox(
                      height: 226,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 2,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => JobDetails(index: index),
                          )),
                          child: CustomJob(index: index,),
                        ),
                      ),
                    );

                }),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
