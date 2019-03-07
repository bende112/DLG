require 'json'

def baseUrl()
  return ENV['base_url']
end

def actionDropdownSelector(column, value)
  columnIndex = all('.content table thead tr th')
                    .map {|x| x.text.downcase}
                    .find_index(column.downcase)

  rowIndex = all(".content table tbody tr")
                 .map {|x| x.all('td')}
                 .map {|x| x[columnIndex]}
                 .map {|x| x.text}
                 .find_index(value)

  return '.content table tbody tr:nth-of-type(' + (rowIndex + 1).to_s + ') '
end

def assert_all_match(resultDate1, resultDate2)
  within("#pagecontent") do
    all('.resultDate').first
    all('.resultDate-bold').last

    list_1_string = resultDate1.to_s
    list_2_string = resultDate2.to_s

    if list_1_string == list_2_string
      print 'assert_all_match: both lists match'
      return
    end
  end
end
