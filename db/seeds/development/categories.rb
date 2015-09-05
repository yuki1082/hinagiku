# encoding: utf-8

%w(仕事 生活 趣味).each do |name|
Category.create(name: name)
end 

tasks = Task.order('id').limit(5)
categories = Category.order('id')
categories[1].tasks << tasks[0]
categories[0].tasks << tasks[1]
categories[1].tasks << tasks[2]
categories[1].tasks << tasks[4]
