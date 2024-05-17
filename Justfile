engine := "podman"

# package for linux x86_64
linux:
	fyne-cross linux -engine {{ engine }}

# package for windows x86_64
windows:
	fyne-cross windows -engine {{ engine }}

# package for android aarch64
android:
	fyne-cross android -arch=arm64 -engine {{ engine }}
