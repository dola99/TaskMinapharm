import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:minapharm_task/feature/home/Movie/Data/model/movie_model.dart';

class MoviesContainer extends StatelessWidget {
  final List<Movie> moviesList;
  const MoviesContainer({
    required this.moviesList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: .40.h),
        itemCount: moviesList.length,
        itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Container(
                    width: 150.w,
                    height: 150.w,
                    child: Image.network(
                      moviesList[index].image,
                      fit: BoxFit.fill,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return SizedBox(
                          child: Center(
                              child: CircularProgressIndicator(
                            backgroundColor: Colors.white,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Colors.blue),
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          )),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [Icon(Icons.broken_image)]),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                    child: Center(
                      child: Text(
                        moviesList[index].title,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  )
                ],
              ),
            ));
  }
}
