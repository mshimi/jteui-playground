@import io.github.mshimi.jteui.components.dropdown.DropdownProps
@import io.github.mshimi.jteui.components.button.ButtonProps
@import io.github.mshimi.jteui.base.Variant

@param DropdownProps basicDropdown
@param DropdownProps topEndDropdown
@param DropdownProps bottomEndDropdown
@param DropdownProps bottomStartDropdown
@param DropdownProps nestedDropdown
@param DropdownProps nestedSubDropdown
@param DropdownProps disabledDropdown
@param DropdownProps iconTriggerDropdown
@param DropdownProps asyncHtmlDropdown
@param DropdownProps asyncStringsDropdown
@param DropdownProps asyncObjectsDropdown
@param DropdownProps asyncCustomDropdown
@param DropdownProps asyncOpenDropdown
@param DropdownProps customLoadingDropdown

!{
    var itemClasses = "block w-full text-left px-3 py-1.5 text-sm text-gray-700 hover:bg-gray-50 focus:bg-gray-50 focus:outline-none";
    var destructiveClasses = "block w-full text-left px-3 py-1.5 text-sm text-red-600 hover:bg-red-50 focus:bg-red-50 focus:outline-none";
    var linkClasses = "block px-3 py-1.5 text-sm text-gray-700 hover:bg-gray-50 focus:bg-gray-50 focus:outline-none";
    var dividerClasses = "my-1 border-gray-100";
    var groupLabelClasses = "px-3 py-1 text-xs font-semibold text-gray-400 uppercase tracking-wide";
}

@template.layout(
currentPath = "/components/dropdown",
pageTitle = "Dropdown — jteui",
content = @`

    <header class="mb-10">
        <h1 class="text-3xl font-bold text-gray-900 mb-2">Dropdown</h1>
        <p class="text-gray-600 max-w-2xl">
            Flexible dropdown menus with Floating UI positioning, full keyboard navigation,
            and optional async data loading. Items are pure content — put anything inside.
        </p>
    </header>

    <%-- ── 1. Basic dropdown ───────────────────────────────────────────── --%>
    <section class="mb-12">
        <h2 class="text-lg font-semibold text-gray-900 mb-1">Basic dropdown</h2>
        <p class="text-sm text-gray-500 mb-4">Links, buttons, dividers, destructive action. Keyboard: Arrow keys to navigate, Escape to close.</p>
        <div class="flex items-start gap-4 p-6 bg-gray-50 rounded-lg border border-gray-200">
            @template.jteui.components.dropdown.dropdown(
                props = basicDropdown,
                trigger = @`
                    @template.jteui.components.button.button(props = new ButtonProps().label("Actions ▾"))
                `,
                content = @`
                    <div class="${groupLabelClasses}">File</div>
                    <a href="#" role="menuitem" class="${linkClasses}">Edit</a>
                    <a href="#" role="menuitem" class="${linkClasses}">Duplicate</a>
                    <hr class="${dividerClasses}"/>
                    <div class="${groupLabelClasses}">Account</div>
                    <button role="menuitem" class="${itemClasses}">Settings</button>
                    <button role="menuitem" class="${itemClasses}">Export…</button>
                    <hr class="${dividerClasses}"/>
                    <button role="menuitem" class="${destructiveClasses}">Delete</button>
                `
            )
        </div>
    </section>

    <%-- ── 2. Placement variants ───────────────────────────────────────── --%>
    <section class="mb-12">
        <h2 class="text-lg font-semibold text-gray-900 mb-1">Placement variants</h2>
        <p class="text-sm text-gray-500 mb-4">Floating UI auto-flips when there is not enough space in the preferred direction.</p>
        <div class="flex flex-wrap items-center gap-4 p-6 bg-gray-50 rounded-lg border border-gray-200">
            @template.jteui.components.dropdown.dropdown(
                props = bottomStartDropdown,
                trigger = @`<button class="px-3 py-1.5 text-sm border border-gray-300 rounded-md bg-white hover:bg-gray-50">bottom-start ▾</button>`,
                content = @`
                    <button role="menuitem" class="${itemClasses}">Item one</button>
                    <button role="menuitem" class="${itemClasses}">Item two</button>
                    <button role="menuitem" class="${itemClasses}">Item three</button>
                `
            )
            @template.jteui.components.dropdown.dropdown(
                props = bottomEndDropdown,
                trigger = @`<button class="px-3 py-1.5 text-sm border border-gray-300 rounded-md bg-white hover:bg-gray-50">bottom-end ▾</button>`,
                content = @`
                    <button role="menuitem" class="${itemClasses}">Item one</button>
                    <button role="menuitem" class="${itemClasses}">Item two</button>
                    <button role="menuitem" class="${itemClasses}">Item three</button>
                `
            )
            @template.jteui.components.dropdown.dropdown(
                props = topEndDropdown,
                trigger = @`<button class="px-3 py-1.5 text-sm border border-gray-300 rounded-md bg-white hover:bg-gray-50">top-end ▴</button>`,
                content = @`
                    <button role="menuitem" class="${itemClasses}">Item one</button>
                    <button role="menuitem" class="${itemClasses}">Item two</button>
                    <button role="menuitem" class="${itemClasses}">Item three</button>
                `
            )
        </div>
    </section>

    <%-- ── 3. Nested submenu ───────────────────────────────────────────── --%>
    <section class="mb-12">
        <h2 class="text-lg font-semibold text-gray-900 mb-1">Nested submenu</h2>
        <p class="text-sm text-gray-500 mb-4">A child dropdown inside a content slot. Each level has its own isolated Alpine scope.</p>
        <div class="flex items-start gap-4 p-6 bg-gray-50 rounded-lg border border-gray-200">
            @template.jteui.components.dropdown.dropdown(
                props = nestedDropdown,
                trigger = @`
                    @template.jteui.components.button.button(props = new ButtonProps().label("More options ▾"))
                `,
                content = @`
                    <button role="menuitem" class="${itemClasses}">Edit</button>
                    <button role="menuitem" class="${itemClasses}">Duplicate</button>
                    <hr class="${dividerClasses}"/>
                    @template.jteui.components.dropdown.dropdown(
                        props = nestedSubDropdown,
                        trigger = @`
                            <button role="menuitem" class="${itemClasses} flex items-center justify-between gap-6 w-full">
                                Share <span class="text-gray-400">›</span>
                            </button>
                        `,
                        content = @`
                            <button role="menuitem" class="${itemClasses}">Copy link</button>
                            <button role="menuitem" class="${itemClasses}">Email…</button>
                            <button role="menuitem" class="${itemClasses}">Export PDF</button>
                        `
                    )
                    <hr class="${dividerClasses}"/>
                    <button role="menuitem" class="${destructiveClasses}">Delete</button>
                `
            )
        </div>
    </section>

    <%-- ── 4. Trigger variants ─────────────────────────────────────────── --%>
    <section class="mb-12">
        <h2 class="text-lg font-semibold text-gray-900 mb-1">Trigger variants</h2>
        <p class="text-sm text-gray-500 mb-4">Any element works as the trigger — icon button, avatar, plain text link.</p>
        <div class="flex flex-wrap items-center gap-6 p-6 bg-gray-50 rounded-lg border border-gray-200">
            <%-- Icon-only button --%>
            @template.jteui.components.dropdown.dropdown(
                props = iconTriggerDropdown,
                trigger = @`
                    <button class="p-1.5 rounded-md text-gray-500 hover:bg-gray-200 focus:outline-none" aria-label="Options">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                            <path d="M6 10a2 2 0 11-4 0 2 2 0 014 0zM12 10a2 2 0 11-4 0 2 2 0 014 0zM16 12a2 2 0 100-4 2 2 0 000 4z"/>
                        </svg>
                    </button>
                `,
                content = @`
                    <button role="menuitem" class="${itemClasses}">View details</button>
                    <button role="menuitem" class="${itemClasses}">Edit</button>
                    <hr class="${dividerClasses}"/>
                    <button role="menuitem" class="${destructiveClasses}">Remove</button>
                `
            )
        </div>
    </section>

    <%-- ── 5. Disabled items ───────────────────────────────────────────── --%>
    <section class="mb-12">
        <h2 class="text-lg font-semibold text-gray-900 mb-1">Disabled items</h2>
        <p class="text-sm text-gray-500 mb-4">Items with <code class="bg-gray-100 px-1 rounded text-xs">disabled</code> are skipped by keyboard navigation automatically.</p>
        <div class="flex items-start gap-4 p-6 bg-gray-50 rounded-lg border border-gray-200">
            @template.jteui.components.dropdown.dropdown(
                props = disabledDropdown,
                trigger = @`
                    @template.jteui.components.button.button(props = new ButtonProps().label("With disabled items ▾").variant(Variant.OUTLINE))
                `,
                content = @`
                    <button role="menuitem" class="${itemClasses}">Edit</button>
                    <button role="menuitem" disabled class="${itemClasses} opacity-40 cursor-not-allowed">Publish (requires approval)</button>
                    <button role="menuitem" class="${itemClasses}">Archive</button>
                    <button role="menuitem" disabled aria-disabled="true" class="${itemClasses} opacity-40 cursor-not-allowed">Export (unavailable)</button>
                    <hr class="${dividerClasses}"/>
                    <button role="menuitem" class="${destructiveClasses}">Delete</button>
                `
            )
        </div>
    </section>

    <%-- ── 6. Async — HTML response ────────────────────────────────────── --%>
    <section class="mb-12">
        <h2 class="text-lg font-semibold text-gray-900 mb-1">Async — HTML response</h2>
        <p class="text-sm text-gray-500 mb-4">
            <code class="bg-gray-100 px-1 rounded text-xs">fetchOn=LAZY</code> — items load on first open, cached after.
            Server returns <code class="bg-gray-100 px-1 rounded text-xs">text/html</code>, injected directly.
        </p>
        <div class="flex items-start gap-4 p-6 bg-gray-50 rounded-lg border border-gray-200">
            @template.jteui.components.dropdown.dropdown(
                props = asyncHtmlDropdown,
                trigger = @`
                    @template.jteui.components.button.button(props = new ButtonProps().label("Load HTML items ▾"))
                `
            )
        </div>
    </section>

    <%-- ── 7. Async — JSON strings ────────────────────────────────────── --%>
    <section class="mb-12">
        <h2 class="text-lg font-semibold text-gray-900 mb-1">Async — JSON strings (default renderer)</h2>
        <p class="text-sm text-gray-500 mb-4">
            Server returns <code class="bg-gray-100 px-1 rounded text-xs">["Edit","Duplicate","Archive","Delete"]</code>.
            The default renderer turns each string into a button.
        </p>
        <div class="flex items-start gap-4 p-6 bg-gray-50 rounded-lg border border-gray-200">
            @template.jteui.components.dropdown.dropdown(
                props = asyncStringsDropdown,
                trigger = @`
                    @template.jteui.components.button.button(props = new ButtonProps().label("Load string items ▾"))
                `
            )
        </div>
    </section>

    <%-- ── 8. Async — JSON objects (default renderer) ─────────────────── --%>
    <section class="mb-12">
        <h2 class="text-lg font-semibold text-gray-900 mb-1">Async — JSON objects (default renderer)</h2>
        <p class="text-sm text-gray-500 mb-4">
            Objects with <code class="bg-gray-100 px-1 rounded text-xs">label</code>, optional <code class="bg-gray-100 px-1 rounded text-xs">href</code>, and <code class="bg-gray-100 px-1 rounded text-xs">destructive</code>.
            Default renderer renders links where href is present, buttons otherwise.
        </p>
        <div class="flex items-start gap-4 p-6 bg-gray-50 rounded-lg border border-gray-200">
            @template.jteui.components.dropdown.dropdown(
                props = asyncObjectsDropdown,
                trigger = @`
                    @template.jteui.components.button.button(props = new ButtonProps().label("Load object items ▾"))
                `
            )
        </div>
    </section>

    <%-- ── 9. Async — custom itemTemplate ─────────────────────────────── --%>
    <section class="mb-12">
        <h2 class="text-lg font-semibold text-gray-900 mb-1">Async — custom itemTemplate</h2>
        <p class="text-sm text-gray-500 mb-4">Same JSON endpoint, caller supplies an <code class="bg-gray-100 px-1 rounded text-xs">itemTemplate</code> slot to override rendering.</p>
        <div class="flex items-start gap-4 p-6 bg-gray-50 rounded-lg border border-gray-200">
            @template.jteui.components.dropdown.dropdown(
                props = asyncCustomDropdown,
                trigger = @`
                    @template.jteui.components.button.button(props = new ButtonProps().label("Custom template ▾").variant(Variant.OUTLINE))
                `,
                itemTemplate = @`
                    <template x-for="(item, index) in items" :key="index">
                        <button role="menuitem"
                                class="flex items-center gap-3 w-full text-left px-3 py-2 text-sm hover:bg-gray-50 focus:bg-gray-50 focus:outline-none"
                                :class="item.destructive ? 'text-red-600' : 'text-gray-700'"
                                @click="open = false">
                            <span class="h-2 w-2 rounded-full shrink-0"
                                  :class="item.destructive ? 'bg-red-400' : 'bg-green-400'"></span>
                            <span x-text="item.label"></span>
                        </button>
                    </template>
                `
            )
        </div>
    </section>

    <%-- ── 10. Async — fetchOn=OPEN ────────────────────────────────────── --%>
    <section class="mb-12">
        <h2 class="text-lg font-semibold text-gray-900 mb-1">Async — fetchOn=OPEN (live data)</h2>
        <p class="text-sm text-gray-500 mb-4">Items reload on every open. The timestamp in each label changes each time you open the dropdown.</p>
        <div class="flex items-start gap-4 p-6 bg-gray-50 rounded-lg border border-gray-200">
            @template.jteui.components.dropdown.dropdown(
                props = asyncOpenDropdown,
                trigger = @`
                    @template.jteui.components.button.button(props = new ButtonProps().label("Live data ▾").variant(Variant.OUTLINE))
                `
            )
        </div>
    </section>

    <%-- ── 11. Custom loading state ────────────────────────────────────── --%>
    <section class="mb-12">
        <h2 class="text-lg font-semibold text-gray-900 mb-1">Custom loading state</h2>
        <p class="text-sm text-gray-500 mb-4">Override the default spinner with a <code class="bg-gray-100 px-1 rounded text-xs">loading</code> slot. This endpoint takes 2 s to respond.</p>
        <div class="flex items-start gap-4 p-6 bg-gray-50 rounded-lg border border-gray-200">
            @template.jteui.components.dropdown.dropdown(
                props = customLoadingDropdown,
                trigger = @`
                    @template.jteui.components.button.button(props = new ButtonProps().label("Slow fetch ▾").variant(Variant.OUTLINE))
                `,
                loading = @`
                    <div class="flex flex-col items-center gap-2 px-4 py-4 text-sm text-blue-500">
                        <svg class="animate-spin h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                            <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"/>
                            <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8v8z"/>
                        </svg>
                        <span class="font-medium">Fetching from server…</span>
                    </div>
                `
            )
        </div>
    </section>

`
)
