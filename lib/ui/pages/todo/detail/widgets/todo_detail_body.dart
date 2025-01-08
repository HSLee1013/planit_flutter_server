import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<String> list = ['카테고리 없음', "카테고리1", "카테고리2", "카테고리3", "카테고리4", "카테고리5"];

class TodoDetailBody extends StatefulWidget {
  @override
  State<TodoDetailBody> createState() => _TodoDetailBodyState();
}

class _TodoDetailBodyState extends State<TodoDetailBody> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    final TextEditingController title = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          Row(
            children: [
              Container(
                width: 130,
                height: 35,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: dropdownValue,
                    style: TextStyle(fontSize: 13),
                    items: list
                        .map((String value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            ))
                        .toList(),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          TextField(
            controller: title,
            obscureText: false,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "제목없음",
            ),
          ),
          Divider(height: 10),
          Row(
            children: [
              Container(
                width: 40,
                alignment: Alignment.centerLeft,
                child: Icon(CupertinoIcons.calendar),
              ),
              Text("마감일"),
              Spacer(),
              ElevatedButton(
                onPressed: () {},
                child: Text("추가"),
              ),
            ],
          ),
          Divider(height: 10),
          Row(
            children: [
              Container(
                width: 40,
                alignment: Alignment.centerLeft,
                child: Icon(Icons.watch_later),
              ),
              Text("시간&알림"),
              Spacer(),
              ElevatedButton(
                onPressed: () {},
                child: Text("추가"),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              SizedBox(width: 40),
              Text("에 알림"),
              Spacer(),
              ElevatedButton(
                onPressed: () {},
                child: Text("추가"),
              ),
            ],
          ),
          Divider(height: 10),
          Row(
            children: [
              Container(
                width: 40,
                alignment: Alignment.centerLeft,
                child: Icon(Icons.repeat),
              ),
              Text("반복"),
              Spacer(),
              ElevatedButton(
                onPressed: () {},
                child: Text("아니요"),
              ),
            ],
          ),
          Divider(height: 10),
          Row(
            children: [
              Container(
                width: 40,
                alignment: Alignment.centerLeft,
                child: Icon(Icons.event_note),
              ),
              Text("메모"),
              Spacer(),
              ElevatedButton(
                onPressed: () {},
                child: Text("추가"),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(width: 42, height: 10),
              Text(
                "메모\n추가됨",
                style: TextStyle(fontSize: 13),
              ),
            ],
          )
        ],
      ),
    );
  }
}
