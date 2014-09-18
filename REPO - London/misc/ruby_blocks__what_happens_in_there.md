# Ruby Blocks - What happens in there?

- Our own block:

```
def hiya
  yield
end
hiya { puts "hiya" }
```

- ensuring a block is given:

```
def hiya
  if block_given?
    yield
  else
    puts "no block given :-("
  end
end

hiya { puts "hiya" }
```

- Block parameters:

```
def talk_to_fred
  yield "fred"
end  

talk_to_fred { |i| puts "hiya, #{i}" }
```

- This is what powers enumerable - each element is yielded to the block, and different enumerable methods do different things with the result

```
  %w(Fred Wilma Barney).each { |name| print name, " " }
```
