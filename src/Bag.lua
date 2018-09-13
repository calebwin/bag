local Bag = {}
Bag.__index = Bag

setmetatable(Bag, {
  __call = function (cls, ...)
    return cls.new(...)
  end,
})

function Bag.new()
  local self = setmetatable({}, Bag)
  self.contents = {}
  self.size = 0
  return self
end

function Bag:add(element)
  self.contents.insert(element)
  self.size = self.size + 1
end

function Bag:isEmpty()
  return self.size == 0
end

function Bag:size()
  return self.size
end

function Bag:contains(element)
  return self.contents[element] ~= nil
end

function Bag:copy()
  bag_table = {}
  for key in pairs(self.contents) do
    bag_table.insert(self.contents[key])
  end
  return bag_table
end

return Bag