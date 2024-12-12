package thing

import "log/slog"

func Foo() {
	slog.Info("calling thing.Foo()", "value", value)
}
