function _G.ReloadPlugin(name)
  for k,_ in pairs(package.loaded) do
    if k:match("^" .. name) then
      package.loaded[k] = nil
    end
  end
  return require(name)
end
