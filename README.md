<h1 align="center">Lemur</h1>
<div align="center">
	<a href="https://travis-ci.org/LPGhatguy/lemur">
		<img src="https://api.travis-ci.org/LPGhatguy/lemur.svg?branch=master" />
	</a>
	<a href="https://coveralls.io/github/LPGhatguy/lemur?branch=master">
		<img src="https://coveralls.io/repos/github/LPGhatguy/lemur/badge.svg?branch=master" />
	</a>
</div>

<div align="center">
	<strong>L</strong>ua <strong>Emu</strong>lation of <strong>R</strong>oblox APIs
</div>

<div>&nbsp;</div>

## Problem
Currently, there's no way to test Roblox code on an open-source CI system like Travis-CI or Jenkins. Lemur tries to help solve the problem by _emulating_ Roblox's tree and function semantics.

## Installation
Lemur requires:
* Lua 5.1
* LuaFileSystem (`luarocks install luafilesystem`)

## Usage
To use Lemur, create a _Habitat_ and load pieces of the filesystem into the tree:

```lua
local lemur = require("lemur")

-- Create a Habitat
local habitat = lemur.Habitat.new()
local ReplicatedStorage = habitat.game:GetService("ReplicatedStorage")

-- Load `src/roblox` into ReplicatedStorage as a set of `ModuleScript` objects
habitat:loadFromFs("src/roblox", ReplicatedStorage)

-- Locate src/roblox/CoolModule.lua from inside the habitat
local module = ReplicatedStorage.CoolModule

-- Load it!
local CoolModule = habitat:require(module)

-- Invoke a method on our Roblox module!
CoolModule.doSomething()
```

## License
Lemur is available under the MIT license. See [LICENSE.md](LICENSE.md) for details.