@param String name
@param String email

<div id="profile-card" class="p-6 bg-white rounded-lg border border-gray-200">
    <div class="flex items-start justify-between mb-4">
        <div class="flex items-center gap-4">
            <div class="h-14 w-14 rounded-full bg-blue-100 text-blue-700 font-bold text-xl
                        inline-flex items-center justify-center select-none shrink-0">
                ${name.isBlank() ? "?" : String.valueOf(name.charAt(0)).toUpperCase()}
            </div>
            <div>
                <p class="text-base font-semibold text-gray-900">${name}</p>
                <p class="text-sm text-gray-500">${email}</p>
            </div>
        </div>
        <button type="button"
                @click="$store.modals.show('edit-profile-modal')"
                class="inline-flex items-center justify-center gap-2 font-medium rounded-md
                       transition-colors focus-visible:outline-none border border-gray-300
                       bg-transparent hover:bg-gray-100 px-3 py-1.5 text-sm shrink-0">
            Edit profile
        </button>
    </div>
    <dl class="space-y-1 text-sm border-t border-gray-100 pt-3">
        <div class="flex gap-3">
            <dt class="w-16 text-gray-500 shrink-0">Role</dt>
            <dd class="text-gray-900">Administrator</dd>
        </div>
        <div class="flex gap-3">
            <dt class="w-16 text-gray-500 shrink-0">Status</dt>
            <dd class="text-green-600 font-medium">Active</dd>
        </div>
    </dl>
</div>
