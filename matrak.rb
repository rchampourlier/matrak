# Matrak tracks the app you're using and the file opened (if any),
# as well as the time you're idle, to help you fill you worklogs.

active_app_command = 'osascript ' \
                     '-e \'tell application "System Events"\' ' \
                     '-e \'set app_name to name of the first process whose frontmost is true\' ' \
                     '-e \'end tell\''

idle_time_command = 'ioreg -c IOHIDSystem | perl -ane \'if (/Idle/) {$idle=(pop @F)/1000000000; print $idle,"\n"; last}\''

active_document_command = 'osascript ./applescripts/current_document.scpt'

begin
  active_app = `#{active_app_command}`
  idle_time = `#{idle_time_command}`
  active_document = `#{active_document_command}`

  puts "active: #{active_app}"
  puts "active document: #{active_document}"
  puts "idle: #{idle_time}"
  sleep 5
end while(true)
