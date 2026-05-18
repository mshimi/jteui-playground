package io.github.mshimi.playground.controllers;

import io.github.mshimi.jteui.components.dropdown.DropdownProps;
import io.github.mshimi.jteui.components.dropdown.FetchOn;
import io.github.mshimi.jteui.components.dropdown.Placement;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;
import java.util.Map;

@SuppressWarnings("SpringMVCViewInspection")
@Controller
public class DropdownController {

    @GetMapping("/components/dropdown")
    public String dropdown(Model model) {

        // ── Static dropdowns ─────────────────────────────────────────────
        model.addAttribute("basicDropdown",
                new DropdownProps().id("basic-dropdown"));

        model.addAttribute("topEndDropdown",
                new DropdownProps().id("top-end-dropdown").placement(Placement.TOP_END));

        model.addAttribute("bottomEndDropdown",
                new DropdownProps().id("bottom-end-dropdown").placement(Placement.BOTTOM_END));

        model.addAttribute("bottomStartDropdown",
                new DropdownProps().id("bottom-start-dropdown").placement(Placement.BOTTOM_START));

        model.addAttribute("nestedDropdown",
                new DropdownProps().id("nested-dropdown"));

        model.addAttribute("nestedSubDropdown",
                new DropdownProps().id("nested-sub-dropdown").placement(Placement.RIGHT_START));

        model.addAttribute("disabledDropdown",
                new DropdownProps().id("disabled-dropdown"));

        model.addAttribute("iconTriggerDropdown",
                new DropdownProps().id("icon-trigger-dropdown"));

        // ── Async dropdowns ──────────────────────────────────────────────
        model.addAttribute("asyncHtmlDropdown",
                new DropdownProps()
                        .id("async-html-dropdown")
                        .fetchUrl("/demo/dropdown/items-html")
                        .fetchOn(FetchOn.LAZY));

        model.addAttribute("asyncStringsDropdown",
                new DropdownProps()
                        .id("async-strings-dropdown")
                        .fetchUrl("/demo/dropdown/items-strings")
                        .fetchOn(FetchOn.LAZY));

        model.addAttribute("asyncObjectsDropdown",
                new DropdownProps()
                        .id("async-objects-dropdown")
                        .fetchUrl("/demo/dropdown/items-objects")
                        .fetchOn(FetchOn.LAZY));

        model.addAttribute("asyncCustomDropdown",
                new DropdownProps()
                        .id("async-custom-dropdown")
                        .fetchUrl("/demo/dropdown/items-objects")
                        .fetchOn(FetchOn.LAZY));

        model.addAttribute("asyncOpenDropdown",
                new DropdownProps()
                        .id("async-open-dropdown")
                        .fetchUrl("/demo/dropdown/items-live")
                        .fetchOn(FetchOn.OPEN));

        model.addAttribute("customLoadingDropdown",
                new DropdownProps()
                        .id("custom-loading-dropdown")
                        .fetchUrl("/demo/dropdown/items-slow")
                        .fetchOn(FetchOn.LAZY));

        return "pages/dropdown";
    }

    // ── Demo data endpoints ──────────────────────────────────────────────

    @GetMapping("/demo/dropdown/items-html")
    public ResponseEntity<String> itemsHtml() throws InterruptedException {
        Thread.sleep(600);
        var html = """
                <a href="/edit" role="menuitem" class="block px-3 py-1.5 text-sm text-gray-700 hover:bg-gray-50">Edit</a>
                <a href="/duplicate" role="menuitem" class="block px-3 py-1.5 text-sm text-gray-700 hover:bg-gray-50">Duplicate</a>
                <hr class="my-1 border-gray-100"/>
                <button role="menuitem" class="block w-full text-left px-3 py-1.5 text-sm text-red-600 hover:bg-red-50">Delete</button>
                """;
        return ResponseEntity.ok().contentType(MediaType.TEXT_HTML).body(html);
    }

    @GetMapping("/demo/dropdown/items-strings")
    public ResponseEntity<List<String>> itemsStrings() throws InterruptedException {
        Thread.sleep(600);
        return ResponseEntity.ok(List.of("Edit", "Duplicate", "Archive", "Delete"));
    }

    @GetMapping("/demo/dropdown/items-objects")
    public ResponseEntity<List<Map<String, Object>>> itemsObjects() throws InterruptedException {
        Thread.sleep(600);
        return ResponseEntity.ok(List.of(
                Map.of("label", "Edit",      "href",  "/edit"),
                Map.of("label", "Duplicate", "href",  "/duplicate"),
                Map.of("label", "Archive",   "value", "archive"),
                Map.of("label", "Delete",    "value", "delete", "destructive", true)
        ));
    }

    @GetMapping("/demo/dropdown/items-live")
    public ResponseEntity<List<Map<String, Object>>> itemsLive() {
        var ts = System.currentTimeMillis();
        return ResponseEntity.ok(List.of(
                Map.of("label", "Action A — " + ts % 10000),
                Map.of("label", "Action B — " + ts % 10000),
                Map.of("label", "Refresh to see timestamp change")
        ));
    }

    @GetMapping("/demo/dropdown/items-slow")
    public ResponseEntity<List<String>> itemsSlow() throws InterruptedException {
        Thread.sleep(2000);
        return ResponseEntity.ok(List.of("Slow Item 1", "Slow Item 2", "Slow Item 3"));
    }
}
