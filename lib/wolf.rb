def wolf(stockprices)
  array = stockprices.combination(2).to_a
  i = 0
  stock_hash = {}
  array.map { |x,y| stock_hash[[x,y]] = y - x}

  all_combos =  stock_hash.sort_by{|k,v| v}.to_h.keys
  best_combo = all_combos[all_combos.length-1]

  sellDay = stockprices.index(best_combo[1])
  buyDay = stockprices.index(best_combo[0])

  if(sellDay < buyDay)
    stockprices[sellDay] = 0
    sellDay = stockprices.index(best_combo[1])
  end

  {buy_day: buyDay, sell_day: sellDay}
end
