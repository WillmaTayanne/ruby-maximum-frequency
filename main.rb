class AnalisadorLinha
  
  def initialize (number, lineValue)
    @number = number
    @lineValue = lineValue
  end

  def number
    return @number
  end

  def analysisFrequency
    words = {}
    wordsSplit = @lineValue.split(/ /)

    @lineValue = @lineValue.rstrip
    @frequency = 0
    @wordsInLine = []
    
    wordsSplit.each do |word|
      if word != ""
        if !words.has_key?(word)
          words[word] = 1
        else
          words[word] = words[word]+1
          if @frequency < words[word]
            @frequency = words[word]
          end
        end
      end
    end

    words.each_key do |key|
      if words[key] == @frequency
        @wordsInLine << key
      end
    end
  end

  def getDebug
    return "Word most often: '#{@wordsInLine}' | Word frequency: #{@frequency}"
  end
end

analisadorLinhas = []
File.open("teste.txt").each do |lineValue|
  analisadorLinhas.push AnalisadorLinha.new($., lineValue)
end

analisadorLinhas.each do |a|
  a.analysisFrequency
  puts "#{a.number} | #{a.getDebug}"
end