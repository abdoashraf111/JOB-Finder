import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../CustomItems/CustomWorker.dart';
import '../CustomItems/CustomButton.dart';
import '../CustomItems/custom_icons.dart';
import '../controller/data_cubit.dart';
import 'ApplyJob.dart';
import 'HomeScreen/HomeScreen.dart';

class JobDetails extends StatelessWidget {
  JobDetails({Key? key, required this.index}) : super(key: key);
  int index;

  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataCubit, DataState>(
      builder: (context, state) {

        var job = BlocProvider.of<DataCubit>(context).modelJob.data![index];
        int groupValue = BlocProvider.of<DataCubit>(context).groupValue;
        List likes = BlocProvider.of<DataCubit>(context).likes;

        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.of(context).pop(MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ));
                            },
                          ),
                          const Spacer(),
                          const Text("Job Details",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500)),
                          const Spacer(),
                          IconButton(
                              onPressed: () async {
                                if (likes[index] == false) {
                                  await BlocProvider.of<DataCubit>(context)
                                      .addFavorites(jobId: job.id!.toInt());
                                }
                                else if (likes[index]==true){
                                  await BlocProvider.of<DataCubit>(context).showFavorites();
                                  var x=BlocProvider.of<DataCubit>(context).getIdToDelete( index: index);
                                  await BlocProvider.of<DataCubit>(context).deleteFavorites(jobId:x!.toInt() );

                                }
                              },
                              icon: likes[index] == true
                                  ? const Icon(
                                      CustomIcons.archive_minus_bold,
                                      color: Colors.blue,
                                    )
                                  : const Icon(CustomIcons.archive_minus))
                        ],
                      ),
                      Center(
                        child: SizedBox(
                          height: 150,
                          width: 220,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Image.asset("lib/images/Zoom Logo.png"),
                              Text(job.name.toString(),
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500)),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                "${job.compName.toString()} . ${job.location!.split(",")[3].toString()} . ${job.location!.split(",").last.toString()}",
                                style: const TextStyle(fontSize: 12),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 26,
                                    width: 65,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100)),
                                      color: Color.fromRGBO(214, 228, 255, 1),
                                    ),
                                    child: Center(
                                        child: Text(job.jobTimeType.toString(),
                                            style: const TextStyle(
                                                color: Colors.blue,
                                                fontSize: 12))),
                                  ),
                                  const Spacer(
                                    flex: 1,
                                  ),
                                  Container(
                                    height: 26,
                                    width: 65,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100)),
                                      color: Color.fromRGBO(214, 228, 255, 1),
                                    ),
                                    child: const Center(
                                        child: Text("Onsite",
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 12))),
                                  ),
                                  const Spacer(
                                    flex: 1,
                                  ),
                                  Container(
                                    height: 26,
                                    width: 65,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100)),
                                      color: Color.fromRGBO(214, 228, 255, 1),
                                    ),
                                    child: Center(
                                        child: Text(job.jobLevel.toString(),
                                            style: const TextStyle(
                                                color: Colors.blue,
                                                fontSize: 12))),
                                  ),
                                  const Spacer(
                                    flex: 1,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CupertinoSlidingSegmentedControl(
                          backgroundColor: const Color(0xffF4F4F5),
                          thumbColor: const Color(0xff091A7A),
                          padding: const EdgeInsets.all(4),
                          groupValue: groupValue,
                          children: {
                            0: SizedBox(
                              width: 200,
                              height: 50,
                              child: Center(
                                  child: Text(
                                "Desicription",
                                style: TextStyle(
                                    color: groupValue == 0
                                        ? Colors.white
                                        : Colors.black),
                              )),
                            ),
                            1: SizedBox(
                              width: 200,
                              height: 50,
                              child: Center(
                                  child: Text(
                                "Company",
                                style: TextStyle(
                                    color: groupValue == 1
                                        ? Colors.white
                                        : Colors.black),
                              )),
                            ),
                            2: SizedBox(
                              width: 200,
                              height: 50,
                              child: Center(
                                  child: Text(
                                "People",
                                style: TextStyle(
                                    color: groupValue == 2
                                        ? Colors.white
                                        : Colors.black),
                              )),
                            ),
                          },
                          onValueChanged: (value) {
                            BlocProvider.of<DataCubit>(context)
                                .groupchange(value!);
                            if (value == 0) {
                              _controller.jumpToPage(0);
                            }
                            if (value == 1) {
                              _controller.jumpToPage(1);
                            }
                            if (value == 2) {
                              _controller.jumpToPage(2);
                            }
                          }),
                      const SizedBox(
                        height: 27,
                      ),
                      Expanded(
                        child: PageView(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: _controller,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Job Description",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(job.jobDescription.toString(),
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400)),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text("Skill Required",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(job.jobSkill.toString(),
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Contact Us",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 70,
                                      width: 157,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(color: Colors.grey),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text("Email",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey)),
                                            Text(job.compEmail.toString(),
                                                style: TextStyle(fontSize: 14)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Container(
                                      height: 70,
                                      width: 157,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(color: Colors.grey),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Website",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey)),
                                            Text(job.compWebsite.toString(),
                                                style: TextStyle(fontSize: 14)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                const Text("About Company",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(job.aboutComp.toString(),
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        const Text("6 Employees For",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500)),
                                        Text(job.jobType.toString(),
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey)),
                                      ],
                                    ),
                                    const Spacer(),
                                    Container(
                                      width: 150,
                                      height: 38,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        border: Border.all(color: Colors.grey),
                                      ),
                                      child: Row(
                                        children: [
                                          const Text("      UI/UX Designer",
                                              style: TextStyle(fontSize: 12)),
                                          IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.arrow_downward,
                                                size: 12,
                                              ))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 28,
                                ),
                                Expanded(
                                  child: ListView.separated(
                                    separatorBuilder: (context, index) =>
                                        const Column(
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Divider(
                                          height: 20,
                                          color: Colors.grey,
                                        ),
                                      ],
                                    ),
                                    itemCount: 10,
                                    itemBuilder: (context, index) =>
                                        const CustomWorkers(),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 40,
                    left: 0,
                    right: 0,
                    child: CustomButton(
                        text: "Apply now",
                        fun: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ApplyJob(),
                              ));
                        },
                        buttoncolor: Colors.blue,
                        textcolor: Colors.white),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
