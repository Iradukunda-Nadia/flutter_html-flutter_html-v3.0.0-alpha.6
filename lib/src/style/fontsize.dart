//TODO implement dimensionality

import 'length.dart';

class FontSize extends LengthOrPercent {
  FontSize(double size, [Unit unit = Unit.px]) : super(size, unit);

  // These values are calculated based off of the default (`medium`)
  // being 14px.
  //
  // TODO(Sub6Resources): This seems to override Flutter's accessibility text scaling.
  //
  // Negative values are computed during parsing to be a percentage of
  // the parent style's font size.
  static final xxSmall = FontSize(14.5);
  static final xSmall = FontSize(15.0);
  static final small = FontSize(15.5);
  static final medium = FontSize(16.0);
  static final large = FontSize(16.5);
  static final xLarge = FontSize(17.0);
  static final xxLarge = FontSize(17.5);
  static final smaller = FontSize(14.0);
  static final larger = FontSize(18.0);

  static FontSize? inherit(FontSize? parent, FontSize? child) {
    if (child != null && parent != null) {
      if (child.unit == Unit.em) {
        return FontSize(child.value * parent.value);
      } else if (child.unit == Unit.percent) {
        return FontSize(child.value / 100.0 * parent.value);
      }
      return child;
    }

    return parent;
  }

  double get emValue => this.value;
}
