stores_list = {
    "1480" => {"name" => "South Laredo", "store_number" => "1480", "email" => "hou.01480@us.stores.mcd.com"},
    "1703" => {"name" => "SW Military", "store_number" => "1703", "email" => "hou.01703@us.stores.mcd.com"},
    "1725" => {"name" => "San Pedro", "store_number" => "1725", "email" => "hou.01725@us.stores.mcd.com"},
    "2962" => {"name" => "West Commerce", "store_number" => "2962", "email" => "hou.02962@us.stores.mcd.com"},
    "3348" => {"name" => "Southcross", "store_number" => "3348", "email" => "hou.03348@us.stores.mcd.com"},
    "3447" => {"name" => "Wurzbach", "store_number" => "3447", "email" => "hou.03447@us.stores.mcd.com"},
    "5166" => {"name" => "WW White", "store_number" => "5166", "email" => "hou.05166@us.stores.mcd.com"},
    "5623" => {"name" => "Roosevelt", "store_number" => "5623", "email" => "hou.05623@us.stores.mcd.com"},
    "6661" => {"name" => "Hill Country", "store_number" => "6661", "email" => "hou.06661@us.stores.mcd.com"},
    "7091" => {"name" => "West Houston", "store_number" => "7091", "email" => "hou.07091@us.stores.mcd.com"},
    "7850" => {"name" => "Med Center", "store_number" => "7850", "email" => "hou.07850@us.stores.mcd.com"},
    "10586" => {"name" => "Vance Jackson", "store_number" => "10586", "email" => "hou.10586@us.stores.mcd.com"},
    "10675" => {"name" => "Guilbeau", "store_number" => "10675", "email" => "hou.10675@us.stores.mcd.com"},
    "12673" => {"name" => "DeZavala", "store_number" => "12673", "email" => "hou.12673@us.stores.mcd.com"},
    "13364" => {"name" => "Zarzamora", "store_number" => "13364", "email" => "hou.13364@us.stores.mcd.com"},
    "14073" => {"name" => "Broadway", "store_number" => "14073", "email" => "hou.14073@us.stores.mcd.com"},
    "16166" => {"name" => "WM 1604", "store_number" => "16166", "email" => "hou.16166@us.stores.mcd.com"},
    "17018" => {"name" => "WM Jones Maltzburger", "store_number" => "17018", "email" => "hou.17018@us.stores.mcd.com"},
    "17726" => {"name" => "Rigsby", "store_number" => "17726", "email" => "hou.17726@us.stores.mcd.com"},
    "19116" => {"name" => "Babcock & Prue", "store_number" => "19116", "email" => "hou.19116@us.stores.mcd.com"},
    "22796" => {"name" => "O'Conner", "store_number" => "22796", "email" => "hou.22796@us.stores.mcd.com"},
    "23005" => {"name" => "Floresville", "store_number" => "23005", "email" => "hou.23005@us.stores.mcd.com"},
    "24388" => {"name" => "Converse", "store_number" => "24388", "email" => "hou.24388@us.stores.mcd.com"},
    "26150" => {"name" => "Stonecroft", "store_number" => "26150", "email" => "hou.26150@us.stores.mcd.com"},
    "28465" => {"name" => "WM Boerne", "store_number" => "28465", "email" => "hou.28465@us.stores.mcd.com"},
    "28626" => {"name" => "WM DeZavala", "store_number" => "28626", "email" => "hou.28626@us.stores.mcd.com"},
    "28632" => {"name" => "WM Rigsby", "store_number" => "28632", "email" => "hou.28632@us.stores.mcd.com"},
    "28656" => {"name" => "Ralph Fair", "store_number" => "28656", "email" => "hou.28656@us.stores.mcd.com"},
    "29841" => {"name" => "WM Converse", "store_number" => "29841", "email" => "hou.29841@us.stores.mcd.com"},
    "29844" => {"name" => "WM Vance Jackson", "store_number" => "29844", "email" => "hou.29844@us.stores.mcd.com"},
    "30378" => {"name" => "WM SW Military", "store_number" => "30378", "email" => "hou.30378@us.stores.mcd.com"},
    "31089" => {"name" => "WM Schertz", "store_number" => "31089", "email" => "hou.31089@us.stores.mcd.com"},
    "32872" => {"name" => "Somerset", "store_number" => "32872", "email" => "hou.32872@us.stores.mcd.com"},
    "34798" => {"name" => "The Rim", "store_number" => "34798", "email" => "hou.34798@us.stores.mcd.com"},
    "35416" => {"name" => "Comfort", "store_number" => "35416", "email" => "hou.35416@us.stores.mcd.com"}

}

stores_list.each do |name, store_hash|
  p = Store.create(store_hash)
  p.save
end