// goroutine cancellation using context.WithTimeout()
package main

import (
	"context"
	"fmt"
	"math/rand"
	"sync"
	"time"
)

var (
	s  = rand.NewSource(time.Now().Unix())
	r  = rand.New(s)
	wg = &sync.WaitGroup{}
)

const (
	numWorkers = 3
)

func main() {
	parent := context.Background()
	t := 1 * time.Second
	ctx, cancel := context.WithTimeout(parent, t)
	defer cancel()

	// start a number of goroutines and wait for them to complete
	for i := 0; i < numWorkers; i++ {
		wg.Add(1)
		go worker(ctx, i)
	}

	wg.Wait()
}

// worker does some work for a random duration of time
func worker(ctx context.Context, id int) {
	defer wg.Done()

	d := time.Duration(r.Int31n(5000)) * time.Millisecond
	fmt.Printf("Worker %v started for %v\n", id, d)

	select {
	case <-time.After(d):
	case <-ctx.Done():
		return
	}

	fmt.Printf("Worker %v completed after %v\n", id, d)
}
