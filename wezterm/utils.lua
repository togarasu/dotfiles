local utils = {}

utils.merge = function(...)
  que = {...}
  ret = {}
  for _,tbl in pairs(que) do
    for k,v in pairs(tbl) do
      ret[k] = v
    end
  end
  return ret
end

return utils
