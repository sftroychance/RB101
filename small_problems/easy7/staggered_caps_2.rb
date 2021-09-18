# Modify the method from the previous exercise so it ignores non-alphabetic
# characters when determining whether it should uppercase or lowercase each
# letter. The non-alphabetic characters should still be included in the return
# value; they just don't count when toggling the desired case.
#
# Example:
#
# staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
# staggered_case('ALL CAPS') == 'AlL cApS'
# staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

def staggered_case(string, include_nonalpha: false)
  alt_flag = true

  string.downcase.chars.each do |char|
    if char =~ /[A-Za-z]/
      if alt_flag
        char.upcase!
        alt_flag = false
      else
        alt_flag = true
      end
    elsif include_nonalpha
      alt_flag = !alt_flag
    end
  end.join
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

p staggered_case('ignore 77 the 444 numbers', include_nonalpha: true) == 'IgNoRe 77 ThE 444 NuMbErS'
