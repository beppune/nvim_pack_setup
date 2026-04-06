
function mod(name, opts)
   local status, res = require(name) 
   if not status then
       print(res)
       return false
   end

   if opts ~= nil and type(opts) == 'table' then
       pcall(function()
	   res:setup(opts)
       end)
       return true
   end
end
