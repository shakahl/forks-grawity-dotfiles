# $IRBRC - irb startup script
# vim: ft=ruby
require 'irb/completion'
require 'irb/ext/save-history'
require 'pp'

def _fmt(fmt, text)
	"\001\e[m#{fmt}\002#{text}\001\e[m\002"
end

def _prompt(prefmt, charfmt, char)
	_fmt(prefmt, "%N") + " " + _fmt(charfmt, char) + " "
end

IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.cache/irb.history"

IRB.conf[:PROMPT][:my] = {
	PROMPT_I: _prompt("\e[32m",     "\e[1;32m",    ">"),
	PROMPT_N: _prompt("\e[38;5;8m", "\e[1;32m",    "·"),
	PROMPT_S: _prompt("\e[38;5;8m", "\e[38;5;14m", "%l"),
	PROMPT_C: _prompt("\e[32m",     "\e[1;32m",    "c"),

	RETURN: "\e[38;5;11m" + "=>" + "\e[m" + " %s\n",
}
IRB.conf[:PROMPT_MODE] = :my
