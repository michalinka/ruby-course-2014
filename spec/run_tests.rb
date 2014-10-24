require 'test/unit'


my_root = File.dirname(File.absolute_path(__FILE__))
Dir.glob(my_root + '/unit/*_spec.rb') {|file| require file}
