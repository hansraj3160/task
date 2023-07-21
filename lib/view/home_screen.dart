import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_pluton/view/detail_screen.dart';
import 'package:task_pluton/widgets/common.dart';
import 'package:task_pluton/widgets/style.dart';

import '../controller/movie_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MovieController movieController = Get.find<MovieController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColorB2,
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: size.height * verticalPadding,
            horizontal: size.width * horizontalPadding),
        child: Obx(() {
          if (movieController.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else {
            return GridView.builder(
                itemCount: movieController.movies.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: size.width * 0.03,
                  mainAxisSpacing: size.height * 0.016,
                  // childAspectRatio: 0.63,
                  childAspectRatio: size.width / (size.height * 0.8),
                ),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                itemBuilder: (_, index) {
                  var movies = movieController.movies[index];
                  return InkWell(
                    onTap: () => Get.to(MovieDetailScreen(
                      movie: movies,
                    )),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                              height: size.height * 0.1,
                              width: size.width * 0.25,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    "assets/images/img_${index % 5}.png",
                                    fit: BoxFit.cover,
                                  ))),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: VariableText(
                            text: movies.title,
                            fontsize: 12,
                            max_lines: 5,
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  );
                });
          }
        }),
      ),
    );
  }
}
