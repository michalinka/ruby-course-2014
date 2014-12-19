class ArticleManager
  def initialize(articles)
    @articles = articles
  end

  def worst_articles
    @articles.sort {|a,b| a.positive_votes <=> b.positive_votes}
  end

  def best_articles
    @articles.sort {|a,b| b.positive_votes <=> a.positive_votes}
  end

  def worst_article
    worst_articles.first
  end

  def best_article
    best_articles.first
  end

  def most_popular_article
    sorted = @articles.sort {|a,b| b.votes <=> a.votes}
    sorted.first
  end

  def include?(pattern)
    @articles.any? {|x| x.include?(pattern)}
  end

  def authors
    @articles.map{|x| x.author}.uniq
  end

  def number_of_authors
    authors.size
  end

  def votes
    sum = 0
    @articles.each{|x| sum += x.votes}
    sum
  end

  def to_s
    s = ""
    for i in 0..@articles.size - 1
      s = s + (i+1).to_s + ". " + "Title: " + @articles[i].title + "\n" + "Content: " + @articles[i].content + "\n" + "Author: " + @articles[i].author + "\n\n"
    end
    s
  end

  def load_articles(path)
    Dir.foreach(path) {|file| if file != '.' && file != '..' then @articles += [ArticleFilesystem.read_article(path + '\\' + file)] end}
  end
end

