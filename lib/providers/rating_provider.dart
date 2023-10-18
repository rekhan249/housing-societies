import 'package:flutter/material.dart';

class RatingProvider with ChangeNotifier {
  int _rating = 0;

  int get rating => _rating;
  void rate(int rating) {
    _rating = rating;
    notifyListeners();
  }
  // Center(
  //                 child: Consumer<RatingProvider>(
  //                   builder: (context, ratePro, child) => Row(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: <Widget>[
  //                       GestureDetector(
  //                         child: Icon(
  //                           Icons.star,
  //                           color: ratePro.rating >= 1
  //                               ? Colors.orange
  //                               : Colors.grey,
  //                         ),
  //                         onTap: () => ratePro.rate(1),
  //                       ),
  //                       GestureDetector(
  //                         child: Icon(
  //                           Icons.star,
  //                           color: ratePro.rating >= 2
  //                               ? Colors.orange
  //                               : Colors.grey,
  //                         ),
  //                         onTap: () => ratePro.rate(2),
  //                       ),
  //                       GestureDetector(
  //                         child: Icon(
  //                           Icons.star,
  //                           color: ratePro.rating >= 3
  //                               ? Colors.orange
  //                               : Colors.grey,
  //                         ),
  //                         onTap: () => ratePro.rate(3),
  //                       ),
  //                       GestureDetector(
  //                         child: Icon(
  //                           Icons.star,
  //                           color: ratePro.rating >= 4
  //                               ? Colors.orange
  //                               : Colors.grey,
  //                         ),
  //                         onTap: () => ratePro.rate(4),
  //                       ),
  //                       GestureDetector(
  //                         child: Icon(
  //                           Icons.star,
  //                           color: ratePro.rating >= 5
  //                               ? Colors.orange
  //                               : Colors.grey,
  //                         ),
  //                         onTap: () => ratePro.rate(5),
  //                       )
  //                     ],
  //                   ),
  //                 ),
  //               )
}
