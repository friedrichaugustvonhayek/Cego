-- Global variable
globalVar = "I'm global"

function myFunction()
  -- Creating a local variable with the same name as the global one
  local globalVar = "I'm local"
  print(globalVar)  -- This will print "I'm local"
end

myFunction()
print(globalVar)  -- This will print "I'm global" because the global variable is not affected by the local one inside the function

