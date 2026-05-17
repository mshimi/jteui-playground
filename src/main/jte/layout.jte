@import gg.jte.Content
@import java.util.List

@param Content content
@param String currentPath = ""
@param String pageTitle = "jteui playground"

!{
    // Sidebar navigation items: [label, path]
    var navItems = List.of(
        new String[]{"Home", "/"},
        new String[]{"Button", "/components/button"},
        new String[]{"Badge", "/components/badge"},
        new String[]{"Card", "/components/card"},
        new String[]{"Alert", "/components/alert"},
        new String[]{"Modal", "/components/modal"},
        new String[]{"ConfirmModal", "/components/confirm-modal"},
        new String[]{"Toast", "/components/toast"},
        new String[]{"Input", "/components/input"}
    );
}

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${pageTitle}</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/htmx.org@2"></script>
</head>
<body class="bg-gray-50 min-h-screen">

@template.jteui.provider(
withModal = true,
withToast = true,
loadAlpine = true,
content = @`
    <div class="flex min-h-screen">

        <!-- ─── Sidebar ─────────────────────────────────────── -->
        <aside class="w-64 bg-white border-r border-gray-200 shrink-0">
            <div class="sticky top-0 p-6">
                <a href="/" class="block mb-8">
                    <h1 class="text-xl font-bold text-gray-900">jteui</h1>
                    <p class="text-xs text-gray-500 mt-0.5">Component playground</p>
                </a>

                <nav>
                    <ul class="space-y-1">
                        @for(var item : navItems)
                            !{var isActive = item[1].equals(currentPath);}
                            <li>
                                <a href="${item[1]}"
                                   class="${isActive
                                            ? "block px-3 py-2 rounded-md text-sm font-medium bg-blue-50 text-blue-700"
                                            : "block px-3 py-2 rounded-md text-sm font-medium text-gray-700 hover:bg-gray-100 hover:text-gray-900"}">
                                    ${item[0]}
                                </a>
                            </li>
                        @endfor
                    </ul>
                </nav>
            </div>
        </aside>

        <!-- ─── Main content area ──────────────────────────── -->
        <main class="flex-1 min-w-0">
            <div class="max-w-5xl mx-auto p-8">
                ${content}
            </div>
        </main>

    </div>

    <!-- ─── Toast container (works on every page) ────────── -->
    @template.jteui.components.toast.toastContainer(
    props = new io.github.mshimi.jteui.components.toast.ToastContainerProps()
    .position(io.github.mshimi.jteui.base.ToastPosition.TOP_RIGHT)
    )
`
)

</body>
</html>