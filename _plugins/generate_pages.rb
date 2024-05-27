module Jekyll
  class PageGenerator < Generator
    safe true

    def generate(site)
      generate_tag_pages(site)
      generate_category_pages(site)
    end

    private

    def generate_tag_pages(site)
      if site.layouts.key?('tag')
        site.tags.keys.each do |tag|
          site.pages << TagPage.new(site, site.source, File.join('tags', tag), tag)
        end
      end
    end

    def generate_category_pages(site)
      if site.layouts.key?('category')
        site.categories.keys.each do |category|
          site.pages << CategoryPage.new(site, site.source, File.join('categories', category), category)
        end
      end
    end
  end

  class TagPage < Page
    def initialize(site, base, dir, tag)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'tag.html')
      self.data['tag'] = tag
      self.data['title'] = "Posts tagged as #{tag}"
    end
  end

  class CategoryPage < Page
    def initialize(site, base, dir, category)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'category.html')
      self.data['category'] = category
      self.data['title'] = "Posts in category #{category}"
    end
  end
end
