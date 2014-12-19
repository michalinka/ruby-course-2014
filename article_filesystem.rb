class ArticleFilesystem
    ARTICLES_FOLDER = 'C:\Users\misia\Documents\GitHub\ruby-course-2014\articles_folder\\'

    def self.file_name(art)
      art.title.downcase.gsub(/ /,"_") + ".txt"
    end

    def self.file_describe(art)
      art.author + "|" + art.title + "|" + art.content + "|" + art.likes.to_s + "|" + art.dislikes.to_s
    end

    def self.write_article(art)
      f = File.open(ARTICLES_FOLDER + self.file_name(art),"w")
      f.puts self.file_describe(art)
    end

    def self.read_article(path)
      f = File.open(path)
      elements = f.gets.split("|")
      art = Article.new(elements[1],elements[2],elements[0])
      elements[3].to_i.times {art.like!}
      elements[4].to_i.times {art.dislike!}
      art
    end
end
