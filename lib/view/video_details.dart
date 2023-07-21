import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_pluton/view/detail_screen.dart';
import 'package:task_pluton/widgets/common.dart';

import '../controller/movie_controller.dart';
import '../widgets/style.dart';

class VideoDetailScreen extends StatefulWidget {
  const VideoDetailScreen({super.key});

  @override
  State<VideoDetailScreen> createState() => _VideoDetailScreenState();
}

class _VideoDetailScreenState extends State<VideoDetailScreen> {
  final MovieController movieController = Get.find<MovieController>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColorB2,
      body: Column(
        children: [
          Container(
              height: size.height * 0.55,
              width: size.width,
              child: Image.asset(
                "assets/images/img_wonder.png",
                fit: BoxFit.cover,
              )),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: VariableText(
                  text: "Watch Movies",
                  fontsize: 16,
                  weight: FontWeight.w600,
                  fontcolor: primaryGray5,
                ),
              )
            ],
          ),
          Expanded(
            child: Obx(() {
              if (movieController.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else {
                return ListView.separated(
                  itemCount: movieController.movies.length,
                  separatorBuilder: (_, index) {
                    return SizedBox(
                      width: 8,
                    );
                  },
                  padding: EdgeInsets.all(10),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    var movie = movieController.movies[index];

                    return InkWell(
                      onTap: () => Get.to(MovieDetailScreen(
                        movie: movie,
                      )),
                      child: Container(
                        width: size.width * 0.22,
                        height: size.height * 0.2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                height: size.height * 0.18,
                                width: size.width * 0.2,
                                child: Image.asset(
                                  "assets/images/img_${index % 5}.png",
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Expanded(
                              child: VariableText(
                                text: movie.title!,
                                fontsize: 12,
                                weight: FontWeight.w500,
                                fontcolor: primaryGray5,
                                max_lines: 4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
