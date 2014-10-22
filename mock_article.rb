class MockArticle < Article
  WORD_LIST = ["jablko", "gruszka", "sliwka", "brzoskwinia","arbuz", "morela", "agrest", "porzeczka", "malina", "truskawka"]

  def initialize
    super(generate_title,generate_content,generate_author)
    likes = random_number
    dislikes = random_number
  end

  def random_number
    Random.rand(101)
  end

  def generate_author
    first_name = WORD_LIST[random_number % 10].capitalize
    second_name = WORD_LIST[random_number % 10].capitalize
    new_author = first_name + " " + second_name
  end

  def generate_title
    how_many = random_number % 5
    new_title = WORD_LIST[random_number % 10].capitalize
    how_many.times {new_title += " " + WORD_LIST[random_number%10]}
    new_title
  end

  def generate_sentence
    how_many = random_number % 6 + 4
    new_sentence = WORD_LIST[random_number % 10].capitalize
    how_many.times {new_sentence += " " + WORD_LIST[random_number%10]}
    new_sentence += "."
  end

  def generate_content
    how_many = random_number % 5 + 1
    new_content = ""
    how_many.times {new_content += generate_sentence + " "}
    new_content.chop
  end
end
