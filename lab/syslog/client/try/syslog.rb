require 'byebug'
require 'syslog/logger'

# 注： 仅default名字起作用
l = Syslog::Logger.new('default')
l0 = Syslog::Logger.new('local0', Syslog::LOG_LOCAL0)
l1 = Syslog::Logger.new('local1', Syslog::LOG_LOCAL1)

puts '==try syslog here'
byebug

puts '==done'
