import 'package:flutter/material.dart';

import 'package:task_pluton/widgets/common.dart';
import 'package:task_pluton/widgets/style.dart';

import '../model/movie_model.dart';

class MovieDetailScreen extends StatefulWidget {
  final Movie? movie;
  MovieDetailScreen({super.key, this.movie});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        Positioned.fill(
          right: 0,
          child: Image.asset(
            "assets/images/img_king.png",
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: size.width,
          child: Image.asset(
            "assets/images/img_bg.png",
            fit: BoxFit.fitWidth,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: size.height * 0.3,
              ),
              Row(
                children: [
                  Image.asset(
                    "assets/images/img_kong.png",
                    scale: 1.5,
                  ),
                  SizedBox(
                    width: 17,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        VariableText(
                          text: widget.movie!.title!,
                          fontsize: 18,
                          weight: FontWeight.w700,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 40,
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: primaryColorW)),
                          child: Center(
                            child: VariableText(
                              text: "12",
                              fontsize: 10,
                              weight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 90,
                          height: 30,
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/icons/ic_star.png",
                                scale: 3,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Image.asset(
                                "assets/icons/ic_star.png",
                                scale: 3,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Image.asset(
                                "assets/icons/ic_star.png",
                                scale: 3,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Image.asset(
                                "assets/icons/ic_star.png",
                                scale: 3,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Image.asset(
                                "assets/icons/ic_star.png",
                                scale: 3,
                              ),
                            ],
                          ),
                        ),
                        VariableText(
                          text: "2017-Adventure",
                          fontsize: 12,
                          weight: FontWeight.w500,
                          fontcolor: primaryGray4,
                        ),
                        VariableText(
                          text: "2 hr 09 min",
                          fontsize: 12,
                          weight: FontWeight.w500,
                          fontcolor: primaryGray4,
                        ),
                        SizedBox(
                          height: 14,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 14,
              ),
              Row(
                children: [
                  VariableText(
                    text: "Directed by Jordan Vogt-Roberts",
                    fontsize: 13,
                    weight: FontWeight.w600,
                    fontcolor: primaryGray4,
                  ),
                ],
              ),
              SizedBox(
                height: 14,
              ),
              Row(
                children: [
                  VariableText(
                    text: "The Cast",
                    fontsize: 14,
                    weight: FontWeight.w600,
                    fontcolor: primaryGray6,
                  ),
                ],
              ),
              SizedBox(
                height: 14,
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: 500,
                      height: 50,
                      child: ListView.separated(
                        separatorBuilder: (_, index) {
                          return SizedBox(
                            width: 15,
                          );
                        },
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 7,
                        itemBuilder: (_, index) {
                          return Container(
                            width: 50,
                            height: 50,
                            padding: const EdgeInsets.all(0.0),
                            child: Image.asset(
                              "assets/icons/img_${index % 7}.png",
                              scale: 2,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 14,
              ),
              Row(
                children: [
                  Expanded(
                      child: VariableText(
                    text: "StoryLine",
                    fontsize: 14,
                    fontcolor: primaryGray6,
                  ))
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Expanded(
                      child: VariableText(
                    text: widget.movie!.overview,
                    fontsize: 12,
                    fontcolor: primaryGray6,
                    line_spacing: 1.3,
                    letter_spacing: 1.2,
                    weight: FontWeight.w500,
                    max_lines: 10,
                  ))
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}
