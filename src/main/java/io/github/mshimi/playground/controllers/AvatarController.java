package io.github.mshimi.playground.controllers;

import io.github.mshimi.jteui.base.Size;
import io.github.mshimi.jteui.base.Variant;
import io.github.mshimi.jteui.components.avatar.AvatarProps;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@SuppressWarnings("SpringMVCViewInspection")
@Controller
public class AvatarController {

    @GetMapping("/components/avatar")
    public String avatar(Model model) {
        model.addAttribute("sizes", List.of(
                new AvatarProps().fallback("JD").size(Size.XS),
                new AvatarProps().fallback("JD").size(Size.SM),
                new AvatarProps().fallback("JD").size(Size.MD),
                new AvatarProps().fallback("JD").size(Size.LG),
                new AvatarProps().fallback("JD").size(Size.XL)
        ));

        model.addAttribute("withImages", List.of(
                new AvatarProps().src("https://picsum.photos/seed/alice/100/100").alt("Alice"),
                new AvatarProps().src("https://picsum.photos/seed/bob/100/100").alt("Bob"),
                new AvatarProps().src("https://picsum.photos/seed/carol/100/100").alt("Carol"),
                new AvatarProps().src("https://picsum.photos/seed/dave/100/100").alt("Dave")
        ));

        model.addAttribute("initials", List.of(
                new AvatarProps().fallback("AM"),
                new AvatarProps().fallback("BR"),
                new AvatarProps().fallback("CK"),
                new AvatarProps().fallback("DL")
        ));

        model.addAttribute("shapes", List.of(
                new AvatarProps().fallback("JD").shape(AvatarProps.Shape.CIRCLE),
                new AvatarProps().fallback("JD").shape(AvatarProps.Shape.SQUARE)
        ));

        model.addAttribute("withStatus", List.of(
                new AvatarProps().fallback("AM").showStatus(true).statusVariant(Variant.SUCCESS),
                new AvatarProps().fallback("BR").showStatus(true).statusVariant(Variant.WARNING),
                new AvatarProps().fallback("CK").showStatus(true).statusVariant(Variant.DANGER),
                new AvatarProps().fallback("DL").showStatus(true).statusVariant(Variant.SECONDARY)
        ));

        model.addAttribute("imageWithStatus",
                new AvatarProps()
                        .src("https://picsum.photos/seed/alice/100/100")
                        .alt("Alice")
                        .size(Size.LG)
                        .showStatus(true)
                        .statusVariant(Variant.SUCCESS));

        return "pages/avatar";
    }
}
