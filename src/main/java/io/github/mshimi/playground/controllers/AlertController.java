package io.github.mshimi.playground.controllers;

import io.github.mshimi.jteui.base.Action;
import io.github.mshimi.jteui.base.Alpine;
import io.github.mshimi.jteui.base.Variant;
import io.github.mshimi.jteui.components.alert.AlertProps;
import io.github.mshimi.jteui.htmx.HtmxSwap;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@SuppressWarnings("SpringMVCViewInspection")
@Controller
public class AlertController {

    @GetMapping("/components/alert")
    public String alert(Model model) {
        model.addAttribute("variants", List.of(
                new AlertProps().variant(Variant.SUCCESS).title("Profile saved").message("Your changes have been saved successfully."),
                new AlertProps().variant(Variant.INFO).title("New version available").message("Refresh the page to update to the latest version."),
                new AlertProps().variant(Variant.WARNING).title("Session expiring").message("Your session will expire in 5 minutes. Save your work."),
                new AlertProps().variant(Variant.DANGER).title("Connection lost").message("We couldn't reach the server. Retrying...")
        ));

        model.addAttribute("withoutTitle", List.of(
                new AlertProps().variant(Variant.SUCCESS).message("Email sent successfully."),
                new AlertProps().variant(Variant.WARNING).message("Some fields are incomplete."),
                new AlertProps().variant(Variant.DANGER).message("Failed to save changes."),
                new AlertProps().variant(Variant.INFO).message("3 unread notifications.")
        ));

        model.addAttribute("dismissible", List.of(
                new AlertProps().variant(Variant.INFO).title("Heads up").message("This alert can be dismissed.").dismissible(true),
                new AlertProps().variant(Variant.DANGER).title("Action required").message("Click the X to dismiss this warning.").dismissible(true)
        ));

        model.addAttribute("customIcon",
                new AlertProps().variant(Variant.INFO).title("Update available").message("Click to download the latest version.").icon("download")
        );

        model.addAttribute("dismissibleWithAction", List.of(
                // Alpine-only dismissal feedback
                new AlertProps()
                        .variant(Variant.INFO)
                        .title("Quick feedback")
                        .message("Dismissing this shows a confirmation toast.")
                        .dismissible(true)
                        .onDismiss(Alpine.toastInfo("Notification cleared")),

                // Server-side dismissal recording
                new AlertProps()
                        .variant(Variant.WARNING)
                        .title("Server-recorded dismissal")
                        .message("Dismissing this POSTs to /test/notification-dismissed.")
                        .dismissible(true)
                        .onDismissAction(Action.create()
                                .hxPost("/test/notification-dismissed")
                                .hxSwap(HtmxSwap.NONE))
                        .onDismiss(Alpine.toastSuccess("Server notified"))
        ));

        return "pages/alert";
    }
}