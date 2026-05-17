package io.github.mshimi.playground.controllers;

import io.github.mshimi.jteui.base.Size;
import io.github.mshimi.jteui.base.Variant;
import io.github.mshimi.jteui.components.button.ButtonProps;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@SuppressWarnings("SpringMVCViewInspection")
@Controller
public class ButtonController {

    @GetMapping("/components/button")
    public String button(Model model) {
        // Variants
        model.addAttribute("variants", List.of(
                new ButtonProps().label("Primary").variant(Variant.PRIMARY),
                new ButtonProps().label("Secondary").variant(Variant.SECONDARY),
                new ButtonProps().label("Outline").variant(Variant.OUTLINE),
                new ButtonProps().label("Ghost").variant(Variant.GHOST),
                new ButtonProps().label("Link").variant(Variant.LINK),
                new ButtonProps().label("Success").variant(Variant.SUCCESS),
                new ButtonProps().label("Warning").variant(Variant.WARNING),
                new ButtonProps().label("Danger").variant(Variant.DANGER),
                new ButtonProps().label("Info").variant(Variant.INFO)
        ));

        // Sizes
        model.addAttribute("sizes", List.of(
                new ButtonProps().label("XS").size(Size.XS),
                new ButtonProps().label("Small").size(Size.SM),
                new ButtonProps().label("Medium").size(Size.MD),
                new ButtonProps().label("Large").size(Size.LG),
                new ButtonProps().label("Extra Large").size(Size.XL)
        ));

        // States
        model.addAttribute("states", List.of(
                new ButtonProps().label("Default").variant(Variant.PRIMARY),
                new ButtonProps().label("Loading").variant(Variant.PRIMARY).loading(true),
                new ButtonProps().label("Disabled").variant(Variant.PRIMARY).disabled(true)
        ));

        // With icon
        model.addAttribute("withIcons", List.of(
                new ButtonProps().label("Save").icon("check"),
                new ButtonProps().label("Delete").icon("x").variant(Variant.DANGER)
        ));

        // Link button (renders as <a>)
        model.addAttribute("linkButton",
                new ButtonProps().label("Go to Google").href("https://google.com").variant(Variant.LINK)
        );

        return "pages/button";
    }
}