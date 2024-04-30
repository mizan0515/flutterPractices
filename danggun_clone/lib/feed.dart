import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class feed extends StatefulWidget {
  const feed({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl; // 이미지를 담을 변수

  @override
  State<feed> createState() => _feedState();
}

class _feedState extends State<feed> {
  // 좋아요 여부
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // CilpRRect 를 통해 이미지에 곡선 border 생성
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          // 이미지
          child: Image.network(
            widget.imageUrl,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'M1 아이패드 프로 11형(3세대) 와이파이 128G 팝니다.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  softWrap: false,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 2),
                Text(
                  '봉천동 · 6분 전',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black45,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '100만원',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        print("object");

                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      child: Row(
                        children: [
                          Icon(
                            isFavorite
                                ? CupertinoIcons.heart_fill
                                : CupertinoIcons.heart,
                            color: isFavorite ? Colors.pink : Colors.black54,
                            size: 16,
                          ),
                          Text(
                            '1',
                            style: TextStyle(color: Colors.black54),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
