local text = "Hello World!" -- this won't be seen from outside of the API because it is localized

function hello () -- this will be seen from outside the API because it is not localized
  print(text)
end