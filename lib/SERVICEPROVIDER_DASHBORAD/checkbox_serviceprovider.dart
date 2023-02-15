import 'package:flutter/material.dart';
import 'package:on_demand_home_service/SERVICEPROVIDER_DASHBORAD/multi_select_model.dart';

class MultiSelect extends StatefulWidget {
  final List<MultiSelectModel> items;
  final String? myTitle;
  const MultiSelect({Key? key,required this.items,required this.myTitle}) : super(key: key);

  @override
  State<MultiSelect> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {

  // this variable holds the selected items
  final List<MultiSelectModel> _selectedItems = [];

  // This function is triggered when a checkbox is checked or unchecked
  void _itemChange(bool isSelected, MultiSelectModel item) {
    setState(() {
      for(MultiSelectModel model in widget.items) {
        if(model.id == item.id) {
          item.isChecked = isSelected;
          if (isSelected) {
            if(!_selectedItems.contains(item)) {
              _selectedItems.add(item);
            }
          } else {
            _selectedItems.remove(item);
          }
        } else {
          model.isChecked =false;
        }
      }
    });
  }

  // this function is called when the Cancel button is pressed
  void _cancel() {
    Navigator.pop(context);
  }

// this function is called when the Submit button is tapped
  void _submit() {
    Navigator.pop(context, _selectedItems);
  }

  @override
  void initState() {
    super.initState();
    for(MultiSelectModel model in widget.items) {
      if(model.isChecked!) {
        _itemChange(model.isChecked!,model);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.myTitle.toString()),
      content: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: ListBody(
          children: widget.items
              .map((item) => CheckboxListTile(
            value: _selectedItems.contains(item),
            title: Text(item.title!),
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (isChecked) => _itemChange(isChecked!,item),
          )).toList(),
        ),
      ),
      actions: [
        TextButton(
          style: ElevatedButton.styleFrom(
            padding:
            const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 8.0),
          ),
          onPressed: _cancel,
          child: const Text("Cancel",),
        ),
        TextButton(
          onPressed: _submit,
          style: ElevatedButton.styleFrom(
            padding:
            const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 8.0),
          ),
          child: const Text("Submit",),
        ),
      ],
    );
  }
}