# encoding: utf-8

alice = User.find_by_login_name("alice")
bob = User.find_by_login_name("bob")
names = [
"切手を買う",
"報告書を書く",
"家賃を払う",
"猫の餌を買う",
"燃えないゴミを出す",
]

description = "これは説明です"

5.times do |n|
	Task.create(name: names[n], description: description,
		due_date: (n-2).days.from_now, done: n.zero?, owner_id: alice.id)
end 

200.times do |n|
Task.create(:name => "Task #{n}", :description => description,
:due_date => (n + 3).days.from_now, :done => false, owner_id: bob.id)
end