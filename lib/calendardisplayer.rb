
class CalendarDisplayer
  @@char_per_line = 9
  @@nb_line = 4
  
  def initialize(list_of_event)
    @list_of_event = list_of_event
  end

  def horizontal_line
    puts "-" * (@@char_per_line * 8 - 1)
  end

  def day_number_line(start_day,end_day)
    line = ""
    [*start_day..end_day].each{|num| num <=30 ? line.concat("|#{num}".ljust(@@char_per_line + 1," ")) : line.concat("|" + " " * @@char_per_line)}
    puts line.concat("|")
  end

  def count_event_day(day)
    return @list_of_event.count {|event| event.start_date.day == day}
  end

  def events_at_day(day)
    return @list_of_event.select {|event| event.start_date.day == day}
  end

  def fromat_text (str)
    return str.split(" ").map!{|word| word = word.ljust(@@char_per_line," ")}.join("").ljust(@@nb_line * @@char_per_line," ")
  end

  def text_at_day(day)
    if events_at_day(day).size == 0
      return " " * (@@char_per_line * @@nb_line)
    elsif events_at_day(day).size == 1
      time_str = "#{events_at_day(day).first.start_date.strftime("%I:%M%p ")}"
      title_str = events_at_day(day).first.title
      return fromat_text(time_str.concat(title_str))
    else
      return "#{events_at_day(day).size} events scheduled".ljust(@@char_per_line * @@nb_line," ")
    end
  end

  def text_lines(start_day,end_day)
    for i in 1..@@nb_line
      line = ""
      [*start_day..end_day].each {|day| line.concat("|#{text_at_day(day)[((i-1) * @@char_per_line)..(i * @@char_per_line-1)]}")}
      puts line + "|"
    end
  end

  def display_row(start_date,end_date)
    horizontal_line()
    day_number_line(start_date,end_date)
    text_lines(start_date,end_date)
  end

  def display()
    (0..4).each {|i| display_row((i * 7 + 1),(i + 1) * 7)}
    horizontal_line()
  end

end