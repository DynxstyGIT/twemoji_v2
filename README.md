# twemoji_v2 - Twemoji for Flutter!
> Originally maintained by [hadi-codes](https://github.com/hadi-codes), extended to support Twemoji 15.1.0!

Based on [jdecked's fork of twemoji (v15.1.0)](https://github.com/jdecked/twemoji)

<img src="https://raw.githubusercontent.com/jasonlessenich/twemoji_v2/main/art/1.png" width=270>

## Usage

### Display a Single Emoji

Use the **Twemoji** Widget to display individual emojis.

```dart
Twemoji(
  emoji: '🍕',
  height: 50,
  width: 50,
)
```

### Render Text with Emojis

The **TwemojiText** Widget allows you to render text with embedded Twemoji.

```dart
TwemojiText(
  text: 'Flutter is awesome 🎉',
)
```

### Rich Text with Emojis

Combine the **TwemojiTextSpan** with **RichText** to create rich text content with emojis.

```dart
RichText(
  text: TwemojiTextSpan(
  text: 'Text 🍕🍔🌭🍿🧂🥓🥨🥐🍞🥞🥞',
  style: Theme.of(context).textTheme.headline6,
  ),
)
```
