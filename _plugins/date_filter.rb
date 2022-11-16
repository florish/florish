module DateFilter
  MONTHS = %w(januari februari maart april mei juni juli augustus september oktober november december)

  def nl_long_date(input)
    input.strftime("%-d") + " " + MONTHS[input.strftime("%m").to_i - 1] + " " + input.strftime("%Y")
  end
end

Liquid::Template.register_filter(DateFilter)
