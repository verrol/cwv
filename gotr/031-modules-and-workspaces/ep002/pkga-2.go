package a

import "log/slog"

func Foo() {
	slog.Info("calling a.Foo()", "value", value)
}
