class ArticleManager
  def initialize(array)
    @array = array
  end
  def worst_articles
    @array.sort {|a,b| a.positive_votes <=> b.positive_votes}
  end
  def best_articles
    @array.sort {|a,b| b.positive_votes <=> a.positive_votes}
  end
  def worst_article
    worst_articles[0]
  end
  def best_article
    best_articles[0]
  end
  def most_popular_article
    arr = @array.sort {|a,b| b.votes <=> a.votes}
    arr[0]
  end
  def include?(pattern)
    y=false
    @array.each{|x| if x.include?(pattern) then y=true end}
    y
  end
  def authors
    tab = []
    @array.each{|x| tab = tab + [x.author]}
    tab | tab
  end
  def number_of_authors
    return authors.size
  end
  def votes
    sum = 0
    @array.each{|x| sum += x.votes}
    sum
  end
  def to_s
  s = ""
    for i in 0..@array.size - 1
      s = s + (i+1).to_s + ". " + "Title: " + @array[i].title + "\n" + "Content: " + @array[i].content + "\n" + "Author: " + @array[i].author + "\n\n"
    end
    s
  end
end
