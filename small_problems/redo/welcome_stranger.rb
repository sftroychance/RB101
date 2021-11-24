def greeting(name, job)
  full_name = name.join(' ')
  title = job[:title] + ' ' + job[:occupation]

  puts "Hello #{full_name}!. Nice to have a #{title} around!"
end

greeting(['Troy', 'C.', 'Graves'], { title: 'Senior', occupation: 'Programmer' })
