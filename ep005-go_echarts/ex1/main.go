package main

import (
	"flag"
	"math"
	"math/rand"
	"os"
	"time"

	"github.com/go-echarts/go-echarts/charts"
	"github.com/sirupsen/logrus"
)

var (
	filename    = "output.html"
	numElements = 50
	src         = rand.NewSource(time.Now().Unix())
	rng         = rand.New(src)
)

func main() {
	flag.StringVar(&filename, "o", filename, "Output filename (html)")
	flag.IntVar(&numElements, "c", numElements, "Number of data points")
	flag.Parse()

	x1Values, y1Values := getData1()

	line := charts.NewLine()
	line.AddXAxis(x1Values)
	line.AddYAxis("Sin(x)", y1Values)
	line.Title = "My Charts"

	f, err := os.Create(filename)
	if err != nil {
		logrus.Errorf("Failed to create file: %v: %v", filename, err)
		return
	}

	defer f.Close()

	err = line.Render(f)
	if err != nil {
		logrus.Errorf("Unable to render graph: %v", err)
		return
	}
}

func getData2() (x, y []float64) {
	x = make([]float64, numElements)
	for i := range x {
		x[i] = float64(i)
	}

	y = make([]float64, numElements)
	for i := range y {
		y[i] = 10 * rng.Float64()
	}

	return
}

func getData1() (x, y []float64) {
	x = make([]float64, numElements)
	for i := range x {
		x[i] = float64(i)
	}

	y = make([]float64, numElements)
	for i := range y {
		y[i] = 10 * math.Sin(x[i])
	}

	return
}
