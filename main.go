package main

import (
	"fmt"
	"math/rand"

	"fyne.io/fyne/v2"
	"fyne.io/fyne/v2/app"
	"fyne.io/fyne/v2/container"
	"fyne.io/fyne/v2/layout"
	"fyne.io/fyne/v2/theme"
	"fyne.io/fyne/v2/widget"

	"github.com/atotto/clipboard"
)

func main() {
	a := app.New()
	w := a.NewWindow("Fake IP Go-nerator")
	w.Resize(fyne.NewSize(400, 300))

	text := widget.NewLabel(ip())
	box1 := container.New(layout.NewHBoxLayout(), layout.NewSpacer(), text, layout.NewSpacer())

	// clipboard.Unsupported = true

	// TODO: add android support
	if clipboard.Unsupported != true {
		copyButton := widget.NewToolbar(
			widget.NewToolbarAction(theme.ContentCopyIcon(), func() {
				clipboard.WriteAll(text.Text)
			}),
		)
		box1 = container.New(layout.NewHBoxLayout(), layout.NewSpacer(), text, copyButton, layout.NewSpacer())
	}

	randIpButton := widget.NewButton("generate new IP", func() {
		text.SetText(ip())
	})
	randIpButton.Importance = widget.HighImportance
	box2 := container.New(layout.NewHBoxLayout(), layout.NewSpacer(), randIpButton, layout.NewSpacer())

	w.SetContent(container.New(layout.NewVBoxLayout(), layout.NewSpacer(), box1, box2, layout.NewSpacer()))
	w.ShowAndRun()
}

// returns a fake IPv4
func ip() string {

	return fmt.Sprintf("%d.%d.%d.%d", rand.Intn(255), rand.Intn(255), rand.Intn(255), rand.Intn(255))
}
