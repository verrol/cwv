package b

import (
	"log/slog"

	"sc.me/verrol/awesome/thing/v2/a"
)

func Foo() {
	slog.Info("calling b.Foo()", "value", a.GetValue())
}
