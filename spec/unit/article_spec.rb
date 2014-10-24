require 'test/unit'

class TestArticle < Test::Unit::TestCase

  def test_like!
    assert_block ("incorrect liking") do
      test = Article.new("x","y","z")
      3.times{test.like!}
      test.likes == 3
    end
  end

  def test_dislike!
    assert_block ("incorrect disliking") do
      test = Article.new("x","y","z")
      3.times{test.dislike!}
      test.dislikes == 3
    end
  end

  def test_positive_votes!
    assert_block ("wrong number of positive votes") do
      test = Article.new("x","y","z")
      3.times{test.like!}
      5.times{test.dislike!}
      test.positive_votes == -2
    end
  end

  def test_votes!
    assert_block ("wrong number of votes") do
      test = Article.new("x","y","z")
      3.times{test.like!}
      5.times{test.dislike!}
      test.votes == 8
    end
  end

  def test_shortened_to
    test = Article.new("x", "Nam strzelac nie kazano", "z")
    assert_equal(test.shortened_to(15), "Nam strzelac...", "incorrect shortening")
  end

  def test_include?
    test = Article.new("x", "Nam strzelac nie kazano", "z")
    assert(test.include?("nie"),"include? doesn't work'")
  end

  def test_words
    test = Article.new("x", "Nam strzelac nie kazano", "z")
    assert_equal(test.words, ["Nam", "strzelac", "nie", "kazano"], "words doesn't work'")
  end

  def test_distinct_words
    test = Article.new("x", "Nam strzelac nie kazano nie nie", "z")
    assert_equal(test.distinct_words, ["Nam", "strzelac", "nie", "kazano"], "distinct_words doesn't work'")
  end

end
