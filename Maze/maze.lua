local Node = {}
function Node:new(x, y)
  local obj = {
    x = x,
    y = y,
    edges = {}
  }

  self.__index = self
  return setmetatable(obj, self)
end

function Node:addEdge(edge)
  table.insert(self.edges, edge)
end

function Node:__tostring()
  return "<" .. self.x .. ", " .. self.y .. ">"
end

local Edge = {}
function Edge:new(node1, node2)
  local obj = {
    node1 = node1,
    node2 = node2
  }

  self.__index = self
  return setmetatable(obj, self)
end

function Edge:__tostring()
  return self.node1 .. " -- " .. self.node2
end

local Graph = {}
function Graph:new()
  local obj = {
    nodes = {},
    edges = {}
  }

  self.__index = self
  return setmetatable(obj, self)
end

function Graph:newNode(x, y)
  local node = Node:new(x, y)
  table.insert(self.nodes, node)
  return node
end

function Graph:newEdge(node1, node2)
  local edge = Edge:new(node1, node2)
  node1:addEdge(edge)
  node2:addEdge(edge)
  table.insert(self.edges, edge)
  return edge
end

-- Create the different nodes of the maze
local graph = Graph:new()
graph:newNode(0, 0)
graph:newNode(0, 1)
graph:newNode(0, 2)
graph:newNode(0, 3)
graph:newNode(0, 4)
graph:newNode(1, 0)
graph:newNode(1, 1)
graph:newNode(1, 2)
graph:newNode(1, 3)
graph:newNode(1, 4)
graph:newNode(2, 0)
graph:newNode(2, 1)
graph:newNode(2, 2)
graph:newNode(2, 3)
graph:newNode(2, 4)
graph:newNode(3, 0)
graph:newNode(3, 1)
graph:newNode(3, 2)
graph:newNode(3, 3)
graph:newNode(3, 4)
graph:newNode(4, 0)
graph:newNode(4, 1)
graph:newNode(4, 2)
graph:newNode(4, 3)
graph:newNode(4, 4)
local start = graph:newNode(-1, 2)
local goal = graph:newNode(5, 2)

-- Create the corresponding edges
graph:newEdge(graph.nodes[2], graph.nodes[3])
graph:newEdge(graph.nodes[4], graph.nodes[5])
graph:newEdge(graph.nodes[8], graph.nodes[9])
graph:newEdge(graph.nodes[9], graph.nodes[10])
graph:newEdge(graph.nodes[12], graph.nodes[13])
graph:newEdge(graph.nodes[17], graph.nodes[18])
graph:newEdge(graph.nodes[18], graph.nodes[19])
graph:newEdge(graph.nodes[21], graph.nodes[22])
graph:newEdge(graph.nodes[22], graph.nodes[23])
graph:newEdge(graph.nodes[23], graph.nodes[24])
graph:newEdge(graph.nodes[24], graph.nodes[25])
graph:newEdge(graph.nodes[1], graph.nodes[6])
graph:newEdge(graph.nodes[2], graph.nodes[7])
graph:newEdge(graph.nodes[3], graph.nodes[26])
graph:newEdge(graph.nodes[5], graph.nodes[10])
graph:newEdge(graph.nodes[6], graph.nodes[11])
graph:newEdge(graph.nodes[7], graph.nodes[12])
graph:newEdge(graph.nodes[8], graph.nodes[13])
graph:newEdge(graph.nodes[10], graph.nodes[15])
graph:newEdge(graph.nodes[11], graph.nodes[16])
graph:newEdge(graph.nodes[14], graph.nodes[19])
graph:newEdge(graph.nodes[15], graph.nodes[20])
graph:newEdge(graph.nodes[16], graph.nodes[21])
graph:newEdge(graph.nodes[17], graph.nodes[22])
graph:newEdge(graph.nodes[20], graph.nodes[25])
graph:newEdge(graph.nodes[23], graph.nodes[27])

function printList(list)
  local text = "{"
  for i, v in ipairs(list) do
    if i ~= 1 then
      text = text .. ", "
    end
    text = text .. tostring(v)
  end
  print(text .. "}")
end

function has(item, list)
  for i, elem in ipairs(list) do
    if elem == item then
      return true
    end
  end
  return false
end

function otherSide(edge, node)
  if edge.node1 == node then
    return edge.node2
  else
    return edge.node1
  end
end

function solve(graph, start, goal)
  -- TODO: You'll have to fill in this function
  local path = {}
  local current = start
  local blocked = {}

  while current ~= goal do
    local next = nil
    for i, edge in ipairs(current.edges) do
      local node = otherSide(edge, current)
      if not has(node, blocked) && not has(node, path) then
        next = node
        break
      end
    end
    
      
    if next == nil then
      table.insert(blocked, current)
      current = table.remove(path)
    else
      table.insert(path, next)
      current = next
    end
  end
  
  return path

end

local solution = solve(graph, start, goal)
printList(solution)