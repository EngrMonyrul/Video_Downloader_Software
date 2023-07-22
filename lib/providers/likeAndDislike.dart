import 'package:flutter/foundation.dart';

class LikeDislikeProvider with ChangeNotifier {
  int _likeCount = 0;
  int _dislikeCount = 0;
  bool _liked = false;

  int get likeCount => _likeCount;
  int get dislikeCount => _dislikeCount;
  bool get liked => _liked;

  void setLiked() {
    if (_liked == false) {
      _likeCount++;
      _dislikeCount--;
    }
    _liked = true;
    notifyListeners();
  }

  void setDislike() {
    if (_liked == true) {
      _dislikeCount++;
      _likeCount--;
    }
    _liked = false;
    notifyListeners();
  }
}
