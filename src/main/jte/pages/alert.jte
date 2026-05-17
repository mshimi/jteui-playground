@import io.github.mshimi.jteui.components.alert.AlertProps
@import java.util.List

@param List<AlertProps> variants
@param List<AlertProps> withoutTitle
@param List<AlertProps> dismissible
@param AlertProps customIcon
@param List<AlertProps> dismissibleWithAction

@template.layout(
currentPath = "/components/alert",
pageTitle = "Alert — jteui",
content = @`

    <header class="mb-10">
        <h1 class="text-3xl font-bold text-gray-900 mb-2">Alert</h1>
        <p class="text-gray-600">Inline contextual messages with variant-driven icons.</p>
    </header>

    <!-- Variants with titles -->
    <section class="mb-10">
        <h2 class="text-lg font-semibold text-gray-900 mb-4">Variants</h2>
        <div class="p-6 bg-white rounded-lg border border-gray-200">
            <div class="space-y-3">
                @for(var a : variants)
                    @template.jteui.components.alert.alert(props = a)
                @endfor
            </div>
        </div>
    </section>

    <!-- Without titles (message only) -->
    <section class="mb-10">
        <h2 class="text-lg font-semibold text-gray-900 mb-4">Without title</h2>
        <p class="text-sm text-gray-500 mb-3">Compact alerts with just a message — useful for brief feedback.</p>
        <div class="p-6 bg-white rounded-lg border border-gray-200">
            <div class="space-y-3">
                @for(var a : withoutTitle)
                    @template.jteui.components.alert.alert(props = a)
                @endfor
            </div>
        </div>
    </section>

    <!-- Dismissible -->
    <section class="mb-10">
        <h2 class="text-lg font-semibold text-gray-900 mb-4">Dismissible</h2>
        <p class="text-sm text-gray-500 mb-3">Click the X to close. Once closed, refresh the page to see them again.</p>
        <div class="p-6 bg-white rounded-lg border border-gray-200">
            <div class="space-y-3">
                @for(var a : dismissible)
                    @template.jteui.components.alert.alert(props = a)
                @endfor
            </div>
        </div>


    </section>

    <!-- Custom icon (overrides variant default) -->
    <section class="mb-10">
        <h2 class="text-lg font-semibold text-gray-900 mb-4">Custom icon</h2>
        <p class="text-sm text-gray-500 mb-3">Override the variant's default icon with any from your IconRegistry.</p>
        <div class="p-6 bg-white rounded-lg border border-gray-200">
            @template.jteui.components.alert.alert(props = customIcon)
        </div>
    </section>

    <section class="mb-10">
        <h2 class="text-lg font-semibold text-gray-900 mb-4">Dismissible</h2>
        <p class="text-sm text-gray-500 mb-3">Click the X to close. Once closed, refresh the page to see them again.</p>
        <div class="p-6 bg-white rounded-lg border border-gray-200">
            <div class="space-y-3">
                @for(var a : dismissibleWithAction)
                    @template.jteui.components.alert.alert(props = a)
                @endfor
            </div>
        </div>


    </section>

`
)