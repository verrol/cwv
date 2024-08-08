// https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events
// https://www.w3schools.com/html/html5_serversentevents.asp

package main

import (
	"bytes"
	"encoding/json"
	"fmt"
	"math/rand"
	"net/http"
	"time"

	log "github.com/sirupsen/logrus"
)

var (
	counter     int
	clients     map[string]*Client
	clientsList []string
)

type (
	Client struct {
		name   string
		events chan *DashBoard
	}
	Currency float64
	Item     struct {
		Name     string   `json:"name,omitempty"`
		Quantity int      `json:"quantity,omitempty"`
		Price    Currency `json:"price,omitempty"`
	}
	Store struct {
		Items map[string]Item `json:"items,omitempty"`
	}
	DashBoard struct {
		Users         uint       `json:"users,omitempty"`
		UsersLoggedIn uint       `json:"users_logged_in,omitempty"`
		Inventory     *Store     `json:"inventory,omitempty"`
		ChartOne      []int      `json:"chart_one,omitempty"`
		ChartTwo      []Currency `json:"chart_two,omitempty"`
	}
)

func main() {
	clients = make(map[string]*Client)
	go updateDashboard()
	// register static files handle '/index.html -> client/index.html'
	http.Handle("/", http.FileServer(http.Dir("client")))
	// register RESTful handler for '/sse/dashboard'
	http.HandleFunc("/sse/dashboard", dashbaordHandler)
	log.Fatal(http.ListenAndServe(":8080", nil))
}

func dashbaordHandler(w http.ResponseWriter, r *http.Request) {
	log.Infof("Client: %v", r.RemoteAddr)
	client := clients[r.RemoteAddr]
	if nil == client {
		client = addClient(r.RemoteAddr)
	}

	w.Header().Set("Content-Type", "text/event-stream")
	w.Header().Set("Cache-Control", "no-cache")
	w.Header().Set("Connection", "keep-alive")

	timeout := time.After(1 * time.Second)
	select {
	case ev := <-client.events:
		var buf bytes.Buffer
		enc := json.NewEncoder(&buf)
		enc.Encode(ev)
		fmt.Fprintf(w, "data: %v\n\n", buf.String())
		fmt.Printf("data: %v\n", buf.String())
	case <-timeout:
		fmt.Fprintf(w, ": nothing to sent\n\n")
	}

	if f, ok := w.(http.Flusher); ok {
		f.Flush()
	}
}
func addClient(s string) *Client {
	c := &Client{name: s, events: make(chan *DashBoard, 10)}
	clients[s] = c
	clientsList = append(clientsList, s)
	return c
}
func updateDashboard() {
	for {
		inv := updateInventory()
		db := &DashBoard{
			Users:         uint(rand.Uint32()),
			UsersLoggedIn: uint(rand.Uint32() % 200),
			Inventory:     inv,
			ChartOne:      []int{2, 35, 634, 93, 390432},
			ChartTwo:      []Currency{3.59, 6.09, 563.90},
		}

		client := getClient()
		if nil != client {
			client.events <- db
		}
	}
}
func getClient() *Client {
	if 0 == len(clientsList) {
		return nil
	}

	r := rand.Int() % len(clientsList)
	s := clientsList[r]
	return clients[s]
}
func updateInventory() *Store {
	inv := &Store{}
	inv.Items = make(map[string]Item)
	a := Item{Name: "Books", Price: 33.59, Quantity: int(rand.Int31() % 53)}
	inv.Items["book"] = a
	a = Item{Name: "Bicycles", Price: 190.89, Quantity: int(rand.Int31() % 232)}
	inv.Items["bicycle"] = a
	a = Item{Name: "Water Bottles", Price: 10.02, Quantity: int(rand.Int31() % 93)}
	inv.Items["wbottle"] = a
	a = Item{Name: "RC Car", Price: 83.19, Quantity: int(rand.Int31() % 73)}
	inv.Items["rccar"] = a
	return inv
}
