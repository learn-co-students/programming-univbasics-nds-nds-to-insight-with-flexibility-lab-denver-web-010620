vm =[
    [
      [
      {:name=>"Vanilla Cookies", :price=>3}, 
      {:name=>"Pistachio Cookies", :price=>3}, 
      {:name=>"Chocolate Cookies", :price=>3}, 
      {:name=>"Chocolate Chip Cookies", :price=>3}
      ], 

      [
      {:name=>"Tooth-Melters", :price=>12}, 
      {:name=>"Tooth-Destroyers", :price=>12}, 
      {:name=>"Enamel Eaters", :price=>12}, 
      {:name=>"Dentist's Nighmare", :price=>20}
      ],
      
      [
      {:name=>"Gummy Sour Apple", :price=>3}, 
      {:name=>"Gummy Apple", :price=>5}, 
      {:name=>"Gummy Moldy Apple", :price=>1}
      ]
    ], 
    [
      [
      {:name=>"Grape Drink", :price=>1}, 
      {:name=>"Orange Drink", :price=>1}, 
      {:name=>"Pineapple Drink", :price=>1}
      ],

      [
      {:name=>"Mints", :price=>13}, 
      {:name=>"Curiously Toxic Mints", :price=>1000}, 
      {:name=>"US Mints", :price=>99}
      ]
    ]
  ]


=begin
def extract_item_on_spinner(nds, row_index, column_index, depth)
  h = nds[row_index][column_index][depth]
#  puts h
end
=end

def list_contents_of_spinner(a,nds,x,y,spinner_depth)
  i=0
  while i < spinner_depth do
    a << nds[x][y][i]
    i += 1
  end
  return a
end

def build_master_list(nds)
  x=0
  master_list = []
  while x < nds.length do
    y=0
    while y < nds[x].length do
      list_contents_of_spinner(master_list,nds,x,y,nds[x][y].length)
      y+=1
    end
    x+=1
  end
  return master_list
end
        

def count_by_snack_price(master_list)
  h = {}
  i=0
  while i < master_list.length do
    h[master_list[i][:price]] = h.fetch(master_list[i][:price],0) + 1
    i += 1
  end
  return h
end

def print_snack_costs(h)
  a = []
  h.each_key{|key| a << key}
  a.sort!
  puts "snack cost     count"
  puts "--------------------"
  i=0
  while i < a.length do
    puts "#{a[i]}       #{h[a[i]]}"
    i+=1
  end
end

list = build_master_list(vm)
snack_costs = count_by_snack_price(list)
print_snack_costs(snack_costs)




    
    
    
    