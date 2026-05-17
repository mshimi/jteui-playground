@import io.github.mshimi.jteui.components.badge.BadgeProps
@import java.util.List

@param List<BadgeProps> variants
@param List<BadgeProps> sizes
@param List<BadgeProps> withDot
@param List<BadgeProps> realWorld

@template.layout(
currentPath = "/components/badge",
pageTitle = "Badge — jteui",
content = @`

    <header class="mb-10">
        <h1 class="text-3xl font-bold text-gray-900 mb-2">Badge</h1>
        <p class="text-gray-600">Compact labels and status indicators for tags, version numbers, and state.</p>
    </header>

    <!-- Variants -->
    <section class="mb-10">
        <h2 class="text-lg font-semibold text-gray-900 mb-4">Variants</h2>
        <div class="p-6 bg-white rounded-lg border border-gray-200">
            <div class="flex flex-wrap gap-3 items-center">
                @for(var b : variants)
                    @template.jteui.components.badge.badge(props = b)
                @endfor
            </div>
        </div>
    </section>

    <!-- Sizes -->
    <section class="mb-10">
        <h2 class="text-lg font-semibold text-gray-900 mb-4">Sizes</h2>
        <div class="p-6 bg-white rounded-lg border border-gray-200">
            <div class="flex flex-wrap gap-3 items-center">
                @for(var b : sizes)
                    @template.jteui.components.badge.badge(props = b)
                @endfor
            </div>
        </div>
    </section>

    <!-- With status dot -->
    <section class="mb-10">
        <h2 class="text-lg font-semibold text-gray-900 mb-4">With status dot</h2>
        <p class="text-sm text-gray-500 mb-3">A leading dot for at-a-glance status indication.</p>
        <div class="p-6 bg-white rounded-lg border border-gray-200">
            <div class="flex flex-wrap gap-3 items-center">
                @for(var b : withDot)
                    @template.jteui.components.badge.badge(props = b)
                @endfor
            </div>
        </div>
    </section>

    <!-- Real-world examples -->
    <section class="mb-10">
        <h2 class="text-lg font-semibold text-gray-900 mb-4">Real-world examples</h2>
        <div class="p-6 bg-white rounded-lg border border-gray-200">
            <div class="flex flex-wrap gap-3 items-center">
                @for(var b : realWorld)
                    @template.jteui.components.badge.badge(props = b)
                @endfor
            </div>
        </div>
    </section>

`
)