import 'package:flutter/material.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';

class AppSubheaderedScaffold extends StatelessWidget {
  const AppSubheaderedScaffold({
    super.key,
    this.appBar,
    this.header,
    this.headerDecoration,
    this.headerSubColor,
    required this.body,
    this.isScrollable = false,
  });

  final PreferredSizeWidget? appBar;
  final Widget? header;
  final BoxDecoration? headerDecoration;
  final Color? headerSubColor;
  final Widget body;
  final bool isScrollable;

  @override
  Widget build(BuildContext context) {
    if (!isScrollable) {
      return Scaffold(
        appBar: appBar,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (header case Widget header)
              _SubheaderWidget(
                header: header,
                headerDecoration: headerDecoration,
                headerSubColor: headerSubColor,
              ),
            const SizedBox(height: 10.0),
            body
          ],
        ),
      );
    }

    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: appBar,
        body: CustomScrollView(
          clipBehavior: Clip.none,
          slivers: [
            if (header case Widget header)
              SliverLayoutBuilder(
                builder: (context, constraints) => SliverToBoxAdapter(
                  child: _SubheaderWidget(
                    header: header,
                    headerDecoration: headerDecoration,
                    overscroll: constraints.viewportMainAxisExtent - constraints.remainingPaintExtent,
                    headerSubColor: headerSubColor,
                  ),
                ),
              ),
            if (header == null) //
              const SliverToBoxAdapter(child: SizedBox(height: 10.0)),
            if (body case Column items)
              SliverList.list(
                children: items.children,
              )
            else
              SliverToBoxAdapter(
                child: body,
              )
          ],
        ),
      ),
    );
  }
}

class _SubheaderWidget extends StatelessWidget {
  const _SubheaderWidget({
    required this.header,
    this.overscroll,
    this.headerDecoration,
    this.headerSubColor,
  });
  final Widget header;
  final double? overscroll;
  final BoxDecoration? headerDecoration;
  final Color? headerSubColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned.fill(
          top: -const Radius.circular(10).y - (overscroll ?? 0.0),
          bottom: -const Radius.circular(10).y,
          child: DecoratedBox(
            decoration: headerDecoration ?? const BoxDecoration(),
          ),
        ),
        header,
        Positioned(
          left: 0,
          right: 0,
          bottom: -const Radius.circular(10).y,
          height: const Radius.circular(10).y,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: headerSubColor ?? context.palette.background.static,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
