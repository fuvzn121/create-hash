class Bot
  def initialize(cmd)
    @command = cmd[:command]
    @data = cmd[:data]
  end

  def command()
    return @command
  end

  def data()
    return @data
  end

  def hash()
    return @hash
  end

  def generateHash()
    cmdAry = @command.split("")
    dtAry = @data.split("")

    str1 = ""
    str2 = ""

    cmdAry.each do |i|
      str1 += i.ord.to_s
    end

    dtAry.each do |i|
      str2 += i.ord.to_s
    end

    if str1.length > 22 then
      str1 = scientificNotation(str1)
      str1 = str1[2, 16] + str1[20, 2]
    end

    if str2.length > 22 then
      str2 = scientificNotation(str2)
      str2 = str2[2, 16] + str2[20, 2]
    end

    num1 = str1.match(/0*([0-9]+)/ )[0].to_s
    num2 = str2.match(/0*([0-9]+)/ )[0].to_s

    sum = num1.to_i + num2.to_i

    @hash = format("%x", sum)
  end


  # Convert the number into scientific notation with 16 digits after "."
  # If power of e is greater than 20, get the number between "." and "e"
  # Else return the number itself
  def scientificNotation(num)
    data = "%.16e" % num
    result = (data.split("e+")[1].to_i() > 20) ? (data): (num)
    return result
  end

end
