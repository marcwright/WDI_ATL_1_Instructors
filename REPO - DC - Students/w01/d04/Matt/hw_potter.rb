require "pry"

potter_chars = []
all = []
  f = File.new("potter.csv", "r")
    f.each_line do |line|
      potter_data = line.chomp.split(",")

      potter_chars.push({:mentions => potter_data[0], :name => potter_data[1], :house => potter_data[2]})


      # puts potter_chars
    end

    # list all names
    all_names = potter_chars.map do |names|
      names[:name]
    end

    all_houses = potter_chars.map do |houses|
      houses[:house]
    end

    all_mentions = potter_chars.map do |mentions|
      mentions[:mentions]
    end

    all << all_names
    all << all_houses
    all << all_mentions

    # find characters mentioned more than 500x
    plus_500 = potter_chars.select do |num|
      num[:mentions].to_i > 500
    end
    puts plus_500

    # list all houses
    houses_list = potter_chars.map do |houses|
      houses[:house]
    end
    puts houses_list.uniq

    binding.pry

    # find all names that are only 1 word
    long_names = all_names.include?(" ") do |long|

    end

    # find characters with one word names
    one_name = potter_chars.select do |name|
      all[0].select('Weasley')
    end

    one = all.select do |al|
      al.has_value?("Weasley")
    end


    huff_names = potter_chars.map do |huff|
      huff[:house].index('Hufflepuff')
    end

    all = potter_chars.map do |all|
      all[:name]
    end

    binding.pry
  f.close
