package io.github.mshimi.playground.controllers;

import io.github.mshimi.jteui.base.Size;
import io.github.mshimi.jteui.base.Variant;
import io.github.mshimi.jteui.components.badge.BadgeProps;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@SuppressWarnings("SpringMVCViewInspection")
@Controller
public class BadgeController {

    @GetMapping("/components/badge")
    public String badge(Model model) {
        model.addAttribute("variants", List.of(
                new BadgeProps().label("Primary").variant(Variant.PRIMARY),
                new BadgeProps().label("Secondary").variant(Variant.SECONDARY),
                new BadgeProps().label("Success").variant(Variant.SUCCESS),
                new BadgeProps().label("Warning").variant(Variant.WARNING),
                new BadgeProps().label("Danger").variant(Variant.DANGER),
                new BadgeProps().label("Info").variant(Variant.INFO)
        ));

        model.addAttribute("sizes", List.of(
                new BadgeProps().label("Small").size(Size.SM),
                new BadgeProps().label("Medium").size(Size.MD),
                new BadgeProps().label("Large").size(Size.LG)
        ));

        model.addAttribute("withDot", List.of(
                new BadgeProps().label("Active").variant(Variant.SUCCESS).dot(true),
                new BadgeProps().label("Pending").variant(Variant.WARNING).dot(true),
                new BadgeProps().label("Failed").variant(Variant.DANGER).dot(true),
                new BadgeProps().label("Offline").variant(Variant.SECONDARY).dot(true)
        ));

        model.addAttribute("realWorld", List.of(
                new BadgeProps().label("v0.1").variant(Variant.SECONDARY),
                new BadgeProps().label("New").variant(Variant.PRIMARY),
                new BadgeProps().label("Beta").variant(Variant.WARNING),
                new BadgeProps().label("Deprecated").variant(Variant.DANGER)
        ));

        return "pages/badge";
    }
}