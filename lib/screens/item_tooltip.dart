import 'package:flutter/material.dart';

import '../models/item_master.dart';

class ItemDetailPopup extends StatelessWidget {
  const ItemDetailPopup({
    super.key,
    required this.item,
    this.maxHeight,
  });

  final ItemData item;
  final double? maxHeight;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.9),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade700),
          boxShadow: const [BoxShadow(blurRadius: 10, color: Colors.black54)],
        ),
        constraints: BoxConstraints(
          maxWidth: 300,
          maxHeight: maxHeight ?? MediaQuery.of(context).size.height * 0.8,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Cost: ${item.gold.total} (${item.gold.base})',
                style: const TextStyle(color: Colors.yellow, fontSize: 13),
              ),
              const Divider(color: Colors.white24),
              Text(
                item.plaintext.isNotEmpty
                    ? item.plaintext
                    : _stripHtml(item.description),
                style: const TextStyle(color: Colors.white70, fontSize: 13),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _stripHtml(String html) {
    return html.replaceAll(RegExp(r'<[^>]*>'), '');
  }
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

            final targetWidth = renderBox?.size.width ?? 0;
            final targetHeight = renderBox?.size.height ?? 0;
            final targetCenterX = targetOffset.dx + targetWidth / 2;

            final spaceBelow =
                screenSize.height - (targetOffset.dy + targetHeight);

            // maxHeightの計算（上下に8pxずつの余白、計16pxを確保）
            final maxHeight = spaceBelow - 16.0;

            // 水平方向の調整
            // 理想的な位置はターゲットの中央
            final popupWidth = 300.0.clamp(0.0, screenSize.width - 16);
            final idealLeft = targetCenterX - popupWidth / 2;

            // 画面の端から8pxの余白を確保するようにクランプ
            final actualLeft = idealLeft.clamp(
              8.0,
              screenSize.width - popupWidth - 8.0,
            );

            // followerAnchorをtopLeft、targetAnchorをtopLeftとした時の
            // targetOffset.dxに対する相対的なオフセットを計算
            final horizontalOffset = actualLeft - targetOffset.dx;

            return Positioned(
              width: popupWidth,
              child: CompositedTransformFollower(
                link: _link,
                targetAnchor: Alignment.topLeft,
                followerAnchor: Alignment.bottomLeft,
                offset: Offset(horizontalOffset, -8.0),
                child: ItemDetailPopup(
                  item: widget.item,
                  maxHeight: maxHeight,
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
