    import 'package:flutter/material.dart';

    class LikeButtonWidget extends StatefulWidget {
      @override
      _LikeButtonWidgetState createState() => _LikeButtonWidgetState();
    }

    class _LikeButtonWidgetState extends State<LikeButtonWidget> {
      int _likeCount = 0;
      bool _isLiked = false;

      void _toggleLike() {
        setState(() {
          if (_isLiked) {
            _likeCount--;
          } else {
            _likeCount++;
          }
          _isLiked = !_isLiked;
        });
      }

      @override
      Widget build(BuildContext context) {
        return Row(
          mainAxisSize: MainAxisSize.min, // Agar Row tidak memenuhi seluruh lebar
          children: [
            IconButton(
              icon: Icon(
                _isLiked ? Icons.favorite : Icons.favorite_border, // Ikon hati terisi atau tidak
                color: _isLiked ? Colors.red : Colors.grey, // Warna ikon berdasarkan status
              ),
              onPressed: _toggleLike, // Panggil fungsi saat tombol ditekan
            ),
            Text('$_likeCount Suka'), // Tampilkan jumlah suka
          ],
        );
      }
    }
