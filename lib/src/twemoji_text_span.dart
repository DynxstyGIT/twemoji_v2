import 'package:flutter/material.dart';
import 'package:twemoji_v2/twemoji.dart';

/// The [TwemojiTextSpan] widget extends [TextSpan]
/// widget and it can be used in a [RichText] widget
/// and it also renders text with twitter emojis
class TwemojiTextSpan extends TextSpan {
  TwemojiTextSpan({
    TextStyle? style,
    required String text,
    List<TextSpan>? children,
    double emojiFontMultiplier = 1,
    this.twemojiFormat = TwemojiFormat.svg,
  }) : super(
          style: style,
          children: _parse(style, text, twemojiFormat, emojiFontMultiplier)
            ..addAll(children ?? []),
        );

  /// The format of the emoji image it can be [TwemojiFormat.png]
  /// 72*72 png or [TwemojiFormat.svg] svg by default.
  final TwemojiFormat twemojiFormat;

  static List<InlineSpan> _parse(
    TextStyle? _style,
    String text,
    TwemojiFormat twemojiFormat,
    double emojiFontMultiplier,
  ) {
    final spans = <InlineSpan>[];
    final textStyle = _style ?? const TextStyle();

    final emojiStyle = textStyle.copyWith(
      fontSize: (textStyle.fontSize ?? 14) * emojiFontMultiplier,
    );
    text.splitMapJoin(
      TwemojiUtils.emojiRegex,
      onMatch: (m) {
        final emojiStr = m.input.substring(m.start, m.end);
        spans.add(
          WidgetSpan(
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: emojiStyle.letterSpacing ?? 1,
                    vertical: emojiStyle.height ?? 2),
                child: Twemoji(
                  emoji: emojiStr,
                  twemojiFormat: twemojiFormat,
                  height: emojiStyle.fontSize,
                  width: emojiStyle.fontSize,
                )),
          ),
        );
        return '';
      },
      onNonMatch: (s) {
        spans.add(TextSpan(
          text: s,
          style: _style,
        ));
        return '';
      },
    );

    return spans;
  }
}
