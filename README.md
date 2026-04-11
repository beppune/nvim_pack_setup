
## Os dependecies

### Lua Language Server
Windows: `winget install --id LuaLS.lua-language-server`

## Tree Sitter Cli
Windows: `winget install --id tree-sitter.tree-sitter-cli`

## Powershell tips
Edit the current Powershell profile with this
`nvim $PROFILE`

You can create "alias" in Powershell by putting functions in $PROFILE
```
function v {
    nvim @args
}
```
use '@args' to inject the all args as string so you can type:
`v file1 file2...`

## Blink.cmp
Check on how to configure lsp https://cmp.saghen.dev/installation
