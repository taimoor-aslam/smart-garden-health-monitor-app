import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final bool isPassword;
  final String label;
  final double height;
  final IconData mIcon;
  final Function getVal;
  final String errText;

  InputField(this.isPassword, this.label, this.mIcon, this.height, this.errText,
      this.getVal);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  final TextEditingController textEditingController =
      new TextEditingController();
  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    textEditingController.addListener(_returnVal);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _returnVal listener.
    textEditingController.dispose();
    super.dispose();
  }

  void _returnVal() {
    // print(textEditingController.text);
    widget.getVal(textEditingController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Color(0xffefefef),
        // height: this.height,
        child: new Theme(
          data: new ThemeData(
            primaryColor: Colors.teal,
            primaryColorDark: Color(0xffefefef),
          ),
          child: TextField(
            controller: textEditingController,
            // onSubmitted: (String val) {
            //   this.widget.getVal(textEditingController.text);
            //   print("in inputfield" + textEditingController.text);
            // },
            decoration: InputDecoration(
              prefixIcon: Icon(widget.mIcon, color: Color(0xffefefef)),
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(30.0),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xffefefef),
                ),
                borderRadius: BorderRadius.circular(30.0),
              ),
              labelText: this.widget.label,
              labelStyle: TextStyle(
                fontFamily: 'FredokaOne',
                color: Color(0xffefefef),
              ),
              fillColor: Colors.teal,
              filled: true,
              errorText: widget.errText != null && widget.errText.isNotEmpty
                  ? widget.errText
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
