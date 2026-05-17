@import java.util.List

!{
    // Each card: [name, description, path]
    var componentCards = List.of(
        new String[]{"Button", "Primary actions and CTAs", "/components/button"},
        new String[]{"Badge", "Compact labels and status indicators", "/components/badge"},
        new String[]{"Card", "Content containers with header, body, footer", "/components/card"},
        new String[]{"Alert", "Inline contextual messages", "/components/alert"},
        new String[]{"Modal", "Dialog overlays for focused interactions", "/components/modal"},
        new String[]{"ConfirmModal", "Confirmation dialogs for destructive actions", "/components/confirm-modal"},
        new String[]{"Toast", "Transient notifications, Alpine & HTMX driven", "/components/toast"},
        new String[]{"Input", "Form input with validation states", "/components/input"}
    );
}

@template.layout(
currentPath = "/",
pageTitle = "jteui playground",
content = @`

    <header class="mb-12">
        <h1 class="text-4xl font-bold text-gray-900 mb-3">jteui playground</h1>
        <p class="text-lg text-gray-600 max-w-2xl">
            A component library for Java + JTE + Alpine.js + HTMX, inspired by shadcn.
            Browse the components in the sidebar, or use the cards below.
        </p>
    </header>

    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
        @for(var card : componentCards)
            <a href="${card[2]}"
               class="block p-6 bg-white rounded-lg border border-gray-200 hover:border-gray-300 hover:shadow-md transition-all">
                <h3 class="text-base font-semibold text-gray-900 mb-1">${card[0]}</h3>
                <p class="text-sm text-gray-500">${card[1]}</p>
            </a>
        @endfor
    </div>

`
)