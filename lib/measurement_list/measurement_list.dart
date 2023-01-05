import 'package:alankara/models/user_models.dart';
import 'package:alankara/provider/list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MeasurementList extends StatefulWidget {



  @override
  State<MeasurementList> createState() => _MeasurementListState();
}

class _MeasurementListState extends State<MeasurementList> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _controller;
  var taskItem;
  int counter = 0;
  late DynamicList listClass;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _formKey = GlobalKey();
    _controller = TextEditingController();
    taskItem = Provider.of<ListProvider>(context, listen: false);
    listClass = DynamicList(taskItem.list);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          children: [
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.5,
              child: Form(
                key: _formKey,
                child: TextFormField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  onSaved: (val) {
                    taskItem.addItem(val);
                  },
                  validator: (val) {
                    if (val!.length > 0) {
                      return null;
                    } else {
                      return "Add a Measurement";
                    }
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan),
                      borderRadius: BorderRadius.circular(5.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan),
                      borderRadius: BorderRadius.circular(5.5),
                    ),
                    labelText: "Add Measurement here",
                    labelStyle: TextStyle(
                      color: Colors.cyan,
                    ),
                  ),
                ),

              ),
            ),
            IconButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                }
              },
              icon: Icon(
                Icons.add_circle_outline,
                color: Colors.cyan,
                size: 35,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),

        Consumer<ListProvider>(builder: (context, provider, listTile) {
          return SizedBox(


            child: ListView.builder(
              shrinkWrap: true,
              itemCount: listClass.list.length,
              itemBuilder: buildList,
            ),
          );
        }),

      ],
    );
  }

  Widget buildList(BuildContext context, int index) {
    counter++;
    return Dismissible(
      key: Key(counter.toString()),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        taskItem.deleteItem(index);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 15, right: 170),
        child: Container(


          height: 50,
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(5.5),
            border: Border.all(
              color: Colors.cyan,
              width: 2,
            ),
          ),
          child: ListTile(
            title: Text(listClass.list[index].toString()),
          ),
        ),
      ),
    );
  }
}
