#!/usr/bin/ruby

debug = true
acti = "activities"
mod = "intra"
sub_rep = '/delivarables/'
project = 'libft'

day = "J0"
today = Time.new
day += today.day == '14' ? "0" : "1"

year = "2014"
rep = `echo $HOME`.chomp + sub_rep
login = `echo $USER`.chomp


git_url = "vogsphere@vogsphere.42.fr:#{mod}/#{year}/#{acti}/#{project}/#{login}"
puts git_url if debug

if debug == true
	puts "acti = #{acti}"
	puts "rep = #{rep}"
	puts "rep + day = #{rep}#{day}"
else
	if File.exists? rep + day + "/.git"
		`git init #{rep}`
		`cd ~/#{rep}#{day} ; remote add origin git_url`
	end

	puts "Are you sure you have only the file you want to push everything inside #{rep}#{day}? (no garbage, no tmp file remaining) [y/n]"
	rep = STDIN.gets.chomp
	if rep == "y"
		system("cd #{rep}#{day}; git add .; git commit -m 'push #{Time.new.strftime("%H%M%S")}'; git push origin master")
	else
		puts "doing strictly nothing"
	end
end