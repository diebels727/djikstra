# Djikstra

A simple gem that implements a shortest path graph traversal algorithm for directed acyclic graphs.  Input graphs are formatted with each line as follows:

```bash
[start vertex,end vertex,weight]
```

For example, a file with the contents:

```
[A,B,1]
[A,C,3]
[B,C,2]
```

Represents a graph with three edges.

## Installation

Add this line to your application's Gemfile:

    gem 'djikstra'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install djikstra

## Usage

```bash
djikstra <file name> <start vertex> <end vertex>
````


