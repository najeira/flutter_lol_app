import 'package:flutter/material.dart';

import '../models/item_master.dart';

class ItemDetailPopup extends StatelessWidget {
  const ItemDetailPopup({
    super.key,
    required this.item,
  });

  final ItemData item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: const BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        border: Border.fromBorderSide(
          BorderSide(color: Colors.white54),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 10.0,
            color: Colors.black54,
          ),
        ],
      ),
      constraints: const BoxConstraints(
        maxWidth: 300.0,
      ),
      child: _ItemDetailBody(
        item: item,
      ),
    );
  }
}

class _ItemDetailBody extends StatelessWidget {
  const _ItemDetailBody({
    super.key,
    required this.item,
  });

  final ItemData item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final texts = _stripHtml(item.description);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.name,
          style: theme.textTheme.labelLarge,
        ),
        const Divider(
          height: 12.0,
          color: Colors.white24,
        ),
        for (final text in texts)
          Padding(
            padding: _padding(text.kind),
            child: Text(
              text.text,
              style: _textStyle(text.kind, theme.textTheme),
            ),
          ),
      ],
    );
  }

  static EdgeInsetsGeometry _padding(String kind) {
    if (kind.startsWith("passive")) {
      return EdgeInsets.only(top: 8.0);
    } else if (kind.startsWith("active")) {
      return EdgeInsets.only(top: 8.0);
    }
    return EdgeInsets.zero;
  }

  static TextStyle? _textStyle(String kind, TextTheme textTheme) {
    if (kind.startsWith("passive")) {
      return textTheme.labelMedium?.copyWith(
        color: Colors.yellowAccent,
      );
    } else if (kind.startsWith("active")) {
      return textTheme.labelMedium?.copyWith(
        color: Colors.orangeAccent,
      );
    }

    if (kind.isNotEmpty) {
      return textTheme.bodyMedium?.copyWith(
        color: Colors.greenAccent,
      );
    }

    return textTheme.bodyMedium?.copyWith(
      height: 1.2,
    );
  }
}

class _ItemText {
  const _ItemText({
    required this.text,
    required this.kind,
  });

  final String text;
  final String kind;
}

class ItemTooltip extends StatefulWidget {
  const ItemTooltip({
    super.key,
    required this.child,
    required this.item,
  });

  final Widget child;

  final ItemData item;

  @override
  State<ItemTooltip> createState() => _ItemTooltipState();
}

class _ItemTooltipState extends State<ItemTooltip> {
  final _overlayController = OverlayPortalController();
  final _link = LayerLink();

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _overlayController.show(),
      onExit: (_) => _overlayController.hide(),
      child: CompositedTransformTarget(
        link: _link,
        child: OverlayPortal(
          controller: _overlayController,
          overlayChildBuilder: (context) {
            final screenSize = MediaQuery.sizeOf(context);

            final renderBox = this.context.findRenderObject() as RenderBox?;
            final targetOffset =
                renderBox?.localToGlobal(Offset.zero) ?? Offset.zero;

            final targetWidth = renderBox?.size.width ?? 0.0;
            final targetHeight = renderBox?.size.height ?? 0.0;
            final targetCenterX = targetOffset.dx + targetWidth / 2.0;

            // スペースの広い方に表示する
            final spaceBelow =
                screenSize.height - (targetOffset.dy + targetHeight);
            final showBelow = spaceBelow > targetOffset.dy;

            // 水平方向の調整
            final maxWidth = screenSize.width - 16.0;
            final popupWidth = 300.0.clamp(0.0, maxWidth);
            final idealLeft = targetCenterX - (popupWidth / 2.0);

            // 画面の端から8pxの余白を確保するようにクランプ（水平方向のみ）
            final actualLeft = idealLeft.clamp(
              8.0,
              screenSize.width - popupWidth - 8.0,
            );

            final offsetX = actualLeft - targetOffset.dx;
            final offsetY = showBelow ? 8.0 : -8.0;

            return Positioned(
              width: popupWidth,
              child: CompositedTransformFollower(
                link: _link,
                targetAnchor: showBelow
                    ? Alignment.bottomLeft
                    : Alignment.topLeft,
                followerAnchor: showBelow
                    ? Alignment.topLeft
                    : Alignment.bottomLeft,
                offset: Offset(offsetX, offsetY),
                child: ItemDetailPopup(
                  item: widget.item,
                ),
              ),
            );
          },
          child: widget.child,
        ),
      ),
    );
  }
}

final _htmlRegExp = RegExp(r'<[^>]*>');

final _stripHtmlCache = <String, List<_ItemText>>{};

List<_ItemText> _stripHtml(String html) {
  return _stripHtmlCache.putIfAbsent(
    html,
    () => _parseHtml(html),
  );
}

List<_ItemText> _parseHtml(String html) {
  final texts = <_ItemText>[];

  final sections = html.split("<br>");

  bool stats = true;
  for (final section in sections) {
    if (section.isEmpty) {
      stats = false;
      continue;
    }

    if (stats) {
      final text = section.replaceAll(_htmlRegExp, " ").trim();
      final parts = text.split(" ");
      final kind = parts.length >= 2 ? parts[0] : "";
      texts.add(
        _ItemText(
          text: text,
          kind: kind,
        ),
      );
    } else {
      final text = section.replaceAll(_htmlRegExp, "").trim();
      if (section.endsWith("</passive>")) {
        texts.add(
          _ItemText(
            text: text,
            kind: "passive",
          ),
        );
      } else if (section.startsWith("</active>")) {
        texts.add(
          _ItemText(
            text: text,
            kind: "active",
          ),
        );
      } else if (text.isNotEmpty) {
        texts.add(
          _ItemText(
            text: text,
            kind: "",
          ),
        );
      }
    }
  }
  return texts;
}
