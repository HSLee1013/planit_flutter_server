import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planit/ui/widgets/dialogs/category_dialog.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  // 범주 - 상태 관리
  bool _isCategory = false;

  // 범주 - 하위 카테고리
  List<String> _subCategory = ['카테고리 1', '카테고리 2', '카테고리 3'];

  void _showInputCategoryDialog(BuildContext context) {
    TextEditingController categoryController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) => CategoryDialog(
        categoryController: categoryController,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      color: Colors.white,
      child: Column(
        children: [
          // 로고
          Container(
            width: 170,
            height: 170,
            decoration: BoxDecoration(
              // color: Colors.blue[100], // 배경 색
              image: DecorationImage(
                image: AssetImage('assets/planit.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Planit',
            style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30),
          // 범주
          // GestureDetector 사용자 제스처 인식
          GestureDetector(
            onTap: () {
              setState(() {
                // 범주 클릭 시 토글 방식 적용
                _isCategory = !_isCategory;
              });
            },
            child: Container(
              margin: EdgeInsets.only(top: 25.0, left: 12), // 간격 띄우기
              child: Row(
                children: [
                  Icon(CupertinoIcons.rectangle_grid_2x2_fill),
                  SizedBox(width: 8.0),
                  Text("범주"),
                  Icon(
                    _isCategory
                        ? Icons.arrow_drop_up // 하위 카테고리 보일 때
                        : Icons.arrow_drop_down, // 하위 카테고리 안 보일 때
                    size: 20.0, // 화살표 크기 설정
                  ),
                ],
              ),
            ),
          ),
          // 범주 클릭 시 하위 카테고리 보이게
          if (_isCategory)
            Padding(
              // 하위 항목의 왼쪽 정렬
              padding: const EdgeInsets.only(left: 40.0, top: 10),
              child: Column(
                // 카테고리 목록 표시
                children: _subCategory.map((category) {
                  return Container(
                    margin: EdgeInsets.only(top: 8.0), // 간격
                    child: Row(
                      children: [
                        Icon(CupertinoIcons.circle_fill), // 아이콘
                        SizedBox(width: 8.0), // 아이콘과 텍스트 간격
                        Text(category), // 텍스트
                      ],
                    ),
                  );
                }).toList(), // 리스트의 모든 항목을 렌더링
              ),
            ),
          // 새로 만들기
          Container(
            margin: EdgeInsets.only(top: 25.0, left: 12),
            child: Row(
              children: [
                Icon(CupertinoIcons.plus),
                SizedBox(width: 8.0),
                InkWell(
                    onTap: () {
                      _showInputCategoryDialog(context);
                    },
                    child: Text("새로 만들기")),
              ],
            ),
          ),
          // 비밀번호 변경
          Container(
            margin: EdgeInsets.only(top: 25.0, left: 12),
            child: Row(
              children: [
                Icon(CupertinoIcons.gear),
                SizedBox(width: 8.0),
                InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/change-password");
                    },
                    child: Text("비밀번호 변경")),
              ],
            ),
          ),
          // 로그아웃
          Container(
            margin: EdgeInsets.only(top: 25.0, left: 12),
            child: Row(
              children: [
                Icon(CupertinoIcons.square_arrow_left),
                SizedBox(width: 8.0),
                InkWell(
                    onTap: () {
                      // gvm.logout();
                    },
                    child: Text("로그아웃")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
