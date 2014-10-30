 require 'test/unit'

class TestArticle < Test::Unit::TestCase

  def setup
    @test = Article.new("title","Content of the article. Content content content content.","author")
    3.times{@test.like!}
    5.times{@test.dislike!}
  end

  def test_like!
    assert_equal(3, @test.likes, "incorrect liking")
  end

  def test_dislike!
    assert_equal(@test.dislikes,5,"incorrect disliking")
  end

  def test_positive_votes
    assert_equal(@test.positive_votes,-2,"wrong number of positive votes")
  end

  def test_votes
    assert_equal(@test.votes,8,"wrong number of votes")
  end

  def test_shortened_to
    assert_equal(@test.shortened_to(15), "Content of t...", "incorrect shortening")
  end

  def test_include?
    assert(@test.include?("article"),"include? doesn't work'")
  end

  def test_words
    assert_equal(@test.words, ["Content", "of", "the", "article.", "Content", "content", "content", "content."], "words doesn't work")
  end

  def test_distinct_words
    assert_equal(@test.distinct_words, ["Content", "of", "the", "article.", "content", "content."], "distinct_words doesn't work")
  end

end
