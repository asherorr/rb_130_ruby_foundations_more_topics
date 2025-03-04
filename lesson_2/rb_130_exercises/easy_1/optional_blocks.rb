def compute
  return "Does not compute." unless block_given?
  yield
end

compute { 5 + 3 } == 8
compute { 'a' + 'b' } == 'ab'
compute == 'Does not compute.'