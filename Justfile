id := "io.github.2kool4idkwhat.fake-ip-gonerator"

# I don't own `luna_2kool4idkwhat.dev` domain, I just needed some ID
# because android doesn't like `io.github.2kool4idkwhat` because
# `2kool4idkwhat` stars with a number. smh.
android_id := "dev.luna_2kool4idkwhat.fake_ip_gonerator_gui"

engine := "podman"

# package for linux x86_64
linux:
	fyne-cross linux -engine {{ engine }}

# package for windows x86_64
windows:
	fyne-cross windows -engine {{ engine }}

# package for android aarch64
android:
	fyne-cross android -arch=arm64 -app-id {{ android_id }} -engine {{ engine }}
