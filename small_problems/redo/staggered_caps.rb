def staggered_case(str, start_with_downcase = false)
  str.chars.each_with_index.map do |char, idx|
    if start_with_downcase
      idx.odd? ? char.upcase : char.downcase
    else
      idx.even? ? char.upcase : char.downcase
    end
  end.join

end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
p staggered_case('I Love Launch School!', true) == 'i lOvE LaUnCh sChOoL!'
p staggered_case('ALL_CAPS', true) == 'aLl_cApS'
p staggered_case('ignore 77 the 444 numbers', true) == 'iGnOrE 77 tHe 444 nUmBeRs'
