import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

commonTextFormField(
    {required String hintText,
      required String labelText,
      int? maxLines = 1,
      GestureTapCallback? onTap,
      bool readOnly = false,
      double? width,
      bool suffixIcon = false,

      TextEditingController? controller}) {
  return Container(
    width: width,
    child: TextFormField(
      maxLines: maxLines,
      readOnly: readOnly,
      onTap: onTap,
      controller: controller,
      cursorColor: Color(0xff007AFF),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 0),
        suffixIcon: suffixIcon
            ? const Icon(CupertinoIcons.arrowtriangle_down_circle,
            color: Color(0xff007AFF))
            : null,
        labelText: labelText,
        labelStyle: GoogleFonts.openSans(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Colors.black,
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.openSans(
          fontWeight: FontWeight.normal,
          fontSize: 15,
          color: Colors.black54,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            color: const Color(0xff007AFF),
            width: 0.5,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            color: const Color(0xff007AFF),
            width: 1,
          ),
        ),
        enabledBorder:
        OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(0.5),
            width: 1,
          ),
        ),
      ),
    ),
  );
}


class RoundButton extends StatelessWidget {
  final bool loading;
  final String title;
  final VoidCallback onTap ;
  final double borderRadius;
  final double fontsize;
  final double? width;
  final double height;
  final double padding;
  final Color btnColor;
  final Color loaderColor;
  final Color textColor;
  final FontWeight fontweight;
  RoundButton({Key? key,
    required this.title,
    required this.onTap,
    this.loading= false,
    this.borderRadius=30,
    this.padding=0,
    this.fontsize=20,
    this.width,
    this.height=60,
    this.btnColor= const Color(0xff007AFF),
    this.fontweight=FontWeight.normal,
    this.textColor= Colors.white,
    this.loaderColor= Colors.white,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      radius: 50,
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              gradient:  LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomRight,
                  colors: [
                    btnColor,
                    btnColor
                  ])),
          width: width,
          height: height,
          alignment: Alignment.center,
          child: Padding(
            padding:  EdgeInsets.all(padding??0),
            child: Center(child : loading ?  CircularProgressIndicator(strokeWidth: 2,color: loaderColor,): Text(title, style: TextStyle(fontFamily: "OpenSans",
              color: textColor, fontSize: fontsize, fontWeight:fontweight,),),
            ),)
      ),
    );

    InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          height: 50,
          decoration: BoxDecoration(color: Colors.deepPurple,borderRadius: BorderRadius.circular(10),),
          child: Center(child : loading ?  CircularProgressIndicator(strokeWidth: 3,):
          Text(title,style: TextStyle(color: Colors.white),),
          ),
        ),
      ),
    );
  }
}
