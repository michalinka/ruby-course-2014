class Article
  def initialize(title, content, author)
    @title, @content, @author = title, content, author
    @likes = @dislikes = 0
    @created_at = Time.now()
  end

  attr_accessor :title, :content, :author
  def like!
    @likes += 1
  end

  def dislike!
    @dislikes += 1
  end

  def positive_votes
    @likes - @dislikes
  end

  def votes
    @likes + @dislikes
  end

  def shortened_to(limit)
    @content.slice(0, limit-3) + "..."
  end

  def include?(word)
    @content.include?(word)
  end

  def words
    @content.split
  end

  def distinct_words
    words | words
  end
end
