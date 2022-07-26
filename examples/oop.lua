Character = {
  name = "",
  life =  0,
  pos_x = 0,
  pos_y = 0
}

function Character:move(new_x, new_y)
  print("Character "..self.name.." moved from ["..self.x..", "..self.y.."] to ["..new_x..", "..new_y.."]")
  self.x, self.y = new_x, new_y
end

function Character:attack()
  print("Character "..self.name.." attacked!")
end

function Character:new(t)
  t = t or {}
  setmetatable(t, self)
  self.__index = self
  return t
end

function Character:dump_info()
  print("  -> name: "..self.name)
  print("  -> life: "..self.life)
  print("  -> pos_x: "..self.pos_x)
  print("  -> pos_x: "..self.pos_y)
end

pikachu = Character:new({
  name = "Pikachu",
  life = 100,
  pos_x = 10,
  pos_y = 20
})

function qualquer()
  print("eita rapaz nao e que da certo")
end

pikachu:attack()
pikachu:dump_info()

custom_arr = {}
char_names = {"Pikachu", "Jack", "Charmander", "Bob", "Patrick"}

for idx, val in pairs(char_names) do
  custom_arr[idx] = Character:new({
    name = val,
    life = idx * 100,
    pos_x = 0,
    pos_y = 0
  })
  custom_arr[idx]:attack()
end

