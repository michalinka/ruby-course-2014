require 'test/unit'

class TestArticle < Test::Unit::TestCase

  def setup
    @tests = []
    @test1 = Article.new("title","content bla bla bla","author")
    @test2 = Article.new("title2","content2","author2")
    @test3 = Article.new("title3","content3","author3")
    @test4 = Article.new("title4","content4","author")
    3.times{@test1.like!}
    5.times{@test4.dislike!}
    4.times{@test2.like!}
    @test = ArticleManager.new([@test1,@test2,@test3,@test4])
  end

  def test_worst_articles
    assert_equal([@test4,@test3,@test1,@test2], @test.worst_articles, "worst_articles doesn't work'")
  end

  def test_best_articles
    assert_equal([@test2,@test1,@test3,@test4], @test.best_articles, "best_articles doesn't work'")
  end

  def test_worst_article
    assert_equal(@test4,@test.worst_article,"worst_article doesn't work")
  end

  def test_best_article
    assert_equal(@test2,@test.best_article,"best_article doesn't work")
  end

  def test_most_popular_article
    assert_equal(@test4,@test.most_popular_article, "most_popular_article doesn't work")
  end

  def test_include?
    assert(@test.include?("content"), "include? doesn't work")
  end

  def test_authors
    assert_equal(["author", "author2", "author3"], @test.authors, "authors doesn't work")
  end

  def test_number_of_authors
    assert_equal(@test.number_of_authors,3,"number_of_authors doesn't work")
  end

  def test_votes
    assert_equal(@test.votes, 12, "votes doesn't work")
  end

  def test_to_s
    assert_equal(@test.to_s,

"1. Title: title
Content: content bla bla bla
Author: author

2. Title: title2
Content: content2
Author: author2

3. Title: title3
Content: content3
Author: author3

4. Title: title4
Content: content4
Author: author

","to_s doesn't work")
  end
end


