#SUBLIME TRICKS

[get the subl command line tool running](https://www.sublimetext.com/docs/2/osx_command_line.html)

##special settings
###navigate to "sublimetext2/preferences/settings-user"

copy and past the good sauce below... into the file located above...

**Save on focus lost**

	{
		"save_on_focus_lost": true
	}

###navigate to "sublimetext2/preferences/keybindings-user" 

and past the following inside the brackets [ ]

**switch panes from home row keys hjkl**

```
  // vim pane navigation
  { "keys": ["ctrl+h"], "command": "travel_to_pane", "args": {"direction": "left"}},
  { "keys": ["ctrl+j"], "command": "travel_to_pane", "args": {"direction": "down"}},
  { "keys": ["ctrl+k"], "command": "travel_to_pane", "args": {"direction": "up"}},
  { "keys": ["ctrl+l"], "command": "travel_to_pane", "args": {"direction": "right"}},  

```

**indent, unindent, reindent**

```
  // indent and unindent
  { 
    "keys": ["tab"],
    "command": "indent",
    "context": [
      { "key": "text", "operator": "regex_contains", "operand": "\n" }
    ]
  },
  { 
    "keys": ["shift+tab"],
    "command": "unindent",
    "context": [
      { "key": "text", "operator": "regex_contains", "operand": "\n" }
    ]
  },

  // reindent
  { "keys": ["command+f12"], "command": "reindent"}
```

your file should look like this now

```
[
  // vim pane navigation
  { "keys": ["ctrl+h"], "command": "travel_to_pane", "args": {"direction": "left"}},
  { "keys": ["ctrl+j"], "command": "travel_to_pane", "args": {"direction": "down"}},
  { "keys": ["ctrl+k"], "command": "travel_to_pane", "args": {"direction": "up"}},
  { "keys": ["ctrl+l"], "command": "travel_to_pane", "args": {"direction": "right"}},
  
  // indent and unindent
  { 
    "keys": ["tab"],
    "command": "indent",
    "context": [
      { "key": "text", "operator": "regex_contains", "operand": "\n" }
    ]
  },
  { 
    "keys": ["shift+tab"],
    "command": "unindent",
    "context": [
      { "key": "text", "operator": "regex_contains", "operand": "\n" }
    ]
  },

  // reindent
  { "keys": ["command+f12"], "command": "reindent"}
]
```