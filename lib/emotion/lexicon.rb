module Emotion
  class Lexicon
    def initialize word, categories
      @word = word
      @categories = categories
    end

    def self.find word
      categories = store[word.to_s]

      new word, categories if categories
    end

    def self.count
      store.count
    end

    def self.store
      @store ||= begin
        MessagePack.unpack File.read(lexicon_file)
      rescue
        store = build_store_from_raw_file
        File.open lexicon_file, 'w' do |file|
          file.write MessagePack.pack(store)
        end

        store
      end
    end

    def self.lexicon_file
      Emotion.data_file 'NRC_emotionlexicon.dot'
    end

    def self.raw_lexicon_file
      Emotion.data_file 'NRC_emotionlexicon_raw.dot'
    end

    def self.build_store_from_raw_file
      store = Hash.new
      File.open(raw_lexicon_file).each_line do |line|
        toks = line.split
        categories = toks[1..-1]
          .select { |tok| tok =~ /\A.+:1\Z/ }
          .map { |tok| tok.split(':').first.to_sym }
        word = toks.first
        store[word] = categories if categories.any?
      end

      store
    end

    private_class_method :build_store_from_raw_file, :raw_lexicon_file, :store,
      :lexicon_file
  end
end
