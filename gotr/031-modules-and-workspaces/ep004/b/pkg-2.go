package b

import (
	"log/slog"

	"sc.me/verrol/awesome/thing/a"
)

func Foo() {
	slog.Info("calling b.Foo()", "value", a.GetValue())
}
