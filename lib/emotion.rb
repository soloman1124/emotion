require "emotion/version"
require "emotion/lexicon"
require "msgpack"

module Emotion
  def self.data_path
    @data_path ||= File.expand_path '../../data', __FILE__
  end

  def self.data_file file_name
    File.join data_path, file_name
  end
end
