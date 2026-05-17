@import io.github.mshimi.jteui.components.divider.DividerProps
@import java.util.List

@param DividerProps plain
@param List<DividerProps> styles
@param DividerProps centerLabel
@param DividerProps leftLabel
@param DividerProps rightLabel
@param DividerProps vertical

@template.layout(
currentPath = "/components/divider",
pageTitle = "Divider — jteui",
content = @`

    <header class="mb-10">
        <h1 class="text-3xl font-bold text-gray-900 mb-2">Divider</h1>
        <p class="text-gray-600">
            Horizontal or vertical separator. Horizontal dividers can carry an
            optional label positioned left, center, or right.
        </p>
    </header>

    <section class="mb-10">
        <h2 class="text-lg font-semibold text-gray-900 mb-4">Plain</h2>
        <div class="p-6 bg-white rounded-lg border border-gray-200">
            <p class="text-sm text-gray-600">Content above.</p>
            <div class="my-4">
                @template.jteui.components.divider.divider(props = plain)
            </div>
            <p class="text-sm text-gray-600">Content below.</p>
        </div>
    </section>

    <section class="mb-10">
        <h2 class="text-lg font-semibold text-gray-900 mb-4">Styles</h2>
        <p class="text-sm text-gray-500 mb-3">SOLID (default), DASHED, DOTTED.</p>
        <div class="p-6 bg-white rounded-lg border border-gray-200 space-y-6">
            @for(var d : styles)
                @template.jteui.components.divider.divider(props = d)
            @endfor
        </div>
    </section>

    <section class="mb-10">
        <h2 class="text-lg font-semibold text-gray-900 mb-4">With label</h2>
        <p class="text-sm text-gray-500 mb-3">CENTER (default), LEFT, or RIGHT positioning.</p>
        <div class="p-6 bg-white rounded-lg border border-gray-200 space-y-8">
            @template.jteui.components.divider.divider(props = centerLabel)
            @template.jteui.components.divider.divider(props = leftLabel)
            @template.jteui.components.divider.divider(props = rightLabel)
        </div>
    </section>

    <section class="mb-10">
        <h2 class="text-lg font-semibold text-gray-900 mb-4">Vertical</h2>
        <p class="text-sm text-gray-500 mb-3">
            Vertical dividers need a flex parent so <code>self-stretch</code> can size them.
        </p>
        <div class="p-6 bg-white rounded-lg border border-gray-200">
            <div class="flex items-center gap-4 text-sm">
                <span>Item one</span>
                @template.jteui.components.divider.divider(props = vertical)
                <span>Item two</span>
                @template.jteui.components.divider.divider(props = vertical)
                <span>Item three</span>
            </div>
        </div>
    </section>

`
)
