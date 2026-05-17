@import io.github.mshimi.jteui.components.button.ButtonProps
@import java.util.List

@param List<ButtonProps> variants
@param List<ButtonProps> sizes
@param List<ButtonProps> states
@param List<ButtonProps> withIcons
@param ButtonProps linkButton

@template.layout(
currentPath = "/components/button",
pageTitle = "Button — jteui",
content = @`

    <header class="mb-10">
        <h1 class="text-3xl font-bold text-gray-900 mb-2">Button</h1>
        <p class="text-gray-600">Primary actions and CTAs in a range of variants, sizes, and states.</p>
    </header>

    <!-- Variants -->
    <section class="mb-10">
        <h2 class="text-lg font-semibold text-gray-900 mb-4">Variants</h2>
        <div class="p-6 bg-white rounded-lg border border-gray-200">
            <div class="flex flex-wrap gap-3">
                @for(var btn : variants)
                    @template.jteui.components.button.button(props = btn)
                @endfor
            </div>
        </div>
    </section>

    <!-- Sizes -->
    <section class="mb-10">
        <h2 class="text-lg font-semibold text-gray-900 mb-4">Sizes</h2>
        <div class="p-6 bg-white rounded-lg border border-gray-200">
            <div class="flex flex-wrap items-center gap-3">
                @for(var btn : sizes)
                    @template.jteui.components.button.button(props = btn)
                @endfor
            </div>
        </div>
    </section>

    <!-- States -->
    <section class="mb-10">
        <h2 class="text-lg font-semibold text-gray-900 mb-4">States</h2>
        <div class="p-6 bg-white rounded-lg border border-gray-200">
            <div class="flex flex-wrap gap-3">
                @for(var btn : states)
                    @template.jteui.components.button.button(props = btn)
                @endfor
            </div>
        </div>
    </section>

    <!-- With icons -->
    <section class="mb-10">
        <h2 class="text-lg font-semibold text-gray-900 mb-4">With icons</h2>
        <div class="p-6 bg-white rounded-lg border border-gray-200">
            <div class="flex flex-wrap gap-3">
                @for(var btn : withIcons)
                    @template.jteui.components.button.button(props = btn)
                @endfor
            </div>
        </div>
    </section>

    <!-- Link button -->
    <section class="mb-10">
        <h2 class="text-lg font-semibold text-gray-900 mb-4">As a link (renders as &lt;a&gt;)</h2>
        <div class="p-6 bg-white rounded-lg border border-gray-200">
            @template.jteui.components.button.button(props = linkButton)
        </div>
    </section>

`
)