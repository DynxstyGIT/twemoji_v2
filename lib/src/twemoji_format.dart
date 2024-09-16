/// Specifies the way the twemojis get rendered.
enum TwemojiFormat {
  /// Uses the corresponding SVG.
  svg,

  /// Similar to [svg], but gets the SVG-file from
  /// https://abs.twimg.com/emoji/v2/svg
  @Deprecated('This is no longer supported, as X (formerly Twitter) no longer'
      ' maintains Twemoji. Use [svg] or [png] instead.')
  networkSvg,

  /// Utilizes the 72x72px PNGs.
  png,
}
