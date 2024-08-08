# Dart Async Support

## References

1. https://api.dartlang.org/stable/2.2.0/dart-async/Future-class.html
2. https://webdev.dartlang.org/articles/performance/event-loop
3. https://codingwithjoe.com/dart-fundamentals-async-await/
4. https://www.dartlang.org/articles/language/await-async
5. https://www.dartlang.org/articles/language/beyond-async

6. https://www.dartlang.org/guides/language/language-tour#asynchrony-support (optional)
7. https://www.dartlang.org/tutorials/language/futures (optional)

## Fun facts about Future


> 1. The function that you pass into Future’s then() method executes immediately when the Future completes. (The function isn’t enqueued, it’s just called.)
> 2. If a Future is already complete before then() is invoked on it, then a task is added to the microtask queue, and that task executes the function passed into then().
> 3. The Future() and Future.delayed() constructors don’t complete immediately; they add an item to the event queue.
> 4. The Future.value() constructor completes in a microtask, similar to #2.
> 5. The Future.sync() constructor executes its function argument immediately and (unless that function returns a Future) completes in a microtask, similar to #2.
