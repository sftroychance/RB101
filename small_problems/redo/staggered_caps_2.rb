def staggered_case(str)
  up_flag = false

  str.chars.map do |char|
    if char =~ /[a-zA-Z]/
      up_flag = !up_flag
      up_flag ? char.upcase : char.downcase
    else
      char
    end
  end.join
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
