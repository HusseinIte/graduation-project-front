import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:opticalproject/core/class/statusrequest.dart';
import 'package:opticalproject/core/functions/alertdialog.dart';

import '../constant/imgaeasset.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(AppImageAsset.loading, width: 250, height: 250))
        : statusRequest == StatusRequest.offlinefailure
            ? Center(
                child: Lottie.asset(AppImageAsset.offline,
                    width: 250, height: 250))
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    child: Lottie.asset(AppImageAsset.server,
                        width: 250, height: 250))
                : statusRequest == StatusRequest.failure
                    ? Center(
                        child: Lottie.asset(AppImageAsset.noData,
                            width: 250, height: 250, repeat: true))
                    : widget;
  }
}

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataRequest(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? CustomLoadingWidge(
            widget: widget,
          )
        : statusRequest == StatusRequest.offlinefailure
            ? CustomOfflineWidget(widget: widget)
            : statusRequest == StatusRequest.failure
                ? Center(
                    child: Lottie.asset(AppImageAsset.noData,
                        width: 250, height: 250, repeat: true))
                : statusRequest == StatusRequest.serverfailure
                    ? CustomServerFailureWidget(
                        widget: widget,
                      )
                    : widget;
  }
}

class CustomServerFailureWidget extends StatelessWidget {
  final Widget widget;
  const CustomServerFailureWidget({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      customAlertDialg();
    });

    return widget;
  }
}

class CustomOfflineWidget extends StatelessWidget {
  final Widget widget;
  const CustomOfflineWidget({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      customOfflineDialog();
    });

    return widget;
  }
}

class CustomLoadingWidge extends StatelessWidget {
  const CustomLoadingWidge({super.key, required this.widget});
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget,
        Center(
          child: Lottie.asset("assets/lottie/loading.json",
              height: 200, width: 200),
        )
      ],
    );
  }
}
