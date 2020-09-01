# frozen_string_literal: true

require 'streamio-ffmpeg'
require 'optparse'

@options = {
  input: './input/selfie.mp4',
  output: './output'
}

OptionParser.new do |opts|
  opts.on('-iPATH', '--input=PATH', 'Video input file') do |v|
    @options[:input] = v
  end
  opts.on('-oPATH', '--output=PATH', 'Output directory') do |v|
    @options[:output] = v
  end
end.parse!

movie = FFMPEG::Movie.new(@options[:input])

movie.screenshot("#{@options[:output]}/screenshot_%d.jpg",
                 { vframes: 20, frame_rate: '1/1' },
                 validate: false,
                 quality: 1)
