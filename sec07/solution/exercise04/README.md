# Section 07 - Exercise 04 : Multiple Producers Running Concurrently

Write a complete golang application to demonstrate multiple Producers writing to the same channel concurrently. Your program _must_ also support a configurable number of concurrent consumers for the same channel. The max number of messages per producers is specified using the '-m' program option. The number of producers and consumers are specified with the '-np' and '-nc' options repectively.

## Requirements

### TODO 1 - Use the 'flag' standard package to parse the '-m', '-nc', and '-np' arguments when provided

Golang provides the 'flag' package for parsing and commandline options. Hence, you don't need to check os.Args variable directly for options. By default, 'm = 100', 'nc = 2', and 'np = 3'. The program should show usage message for an invalid value like -1 for example.

* TIP: flag.Usage() would be useful when an invalid value is provided. See the 'flag' package documentation for examples.

### TODO 2 - Create a channel for string messages at the package scope

Experiment with both unbuffered and buffered channels of different sizes. See TODO 3 & 4

### TODO 3 - Write a producer function

Your producer function does the following:

1. Takes as parameters an id
2. Generate a random number of messages between 1 to 'm' messages to the channel containg its name/id and a random number

* For example, a message from a producer might look like: "Producer 1, num: 25"

### TODO 4 - Launch 'n' producers

For each producer, give each a unique id and the shared channel

### TODO 5 - Write a consumer function

The Consumer is responsible for:

1. Extracting the producer's name/id and random number from the message.
2. Print the number of messages and the _sum_ from each producer
3. Print the total number of messages sent and total sum across producers for that consumer.
4. Conumer _MUST_ use the _range_ operator to consume messages from the channel

## Result

### Example Output

```text
Consumer 1
    Producer # 2
        Number of Elements: 51
        Sub-total: 501
    Producer # 1
        Number of Elements: 33
        Sub-total: 219
    Producer # 3
        Number of Elements: 19
        Sub-total: 214
    Total count: 103
    Total sum: 934
Consumer 2
    Producer # 3
        Number of Elements: 27
        Sub-total: 259
    Producer # 1
        Number of Elements: 20
        Sub-total: 194
    Producer # 2
        Number of Elements: 23
        Sub-total: 168
    Total count: 70
    Total sum: 621
```
