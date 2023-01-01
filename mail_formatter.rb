# Refactorizando proyecto email de scratch(educative.io)

class Email

  attr_reader :subject, :from, :date 

  def initialize(subject, date, from)
    @subject, @date, @from = subject, date, from 
  end

end


# Formatenado salida
def format_mail
  email = Email.new('Tarea Ruby', '2022-1-11', 'Roberto')
  puts "Date:    #{email.date}"
  puts "From:    #{email.from}"
  puts "Subject: #{email.subject}"
end

#format_mail 


class EmailHash

  attr_reader :subject 

  def initialize(subject, headers)
    @subject, @headers = subject, headers
  end

  def date
    @headers[:date]
  end

  def from 
    @headers[:from]
  end
end

puts 
def format_email_hash
  email_hash = EmailHash.new('Tarea Javascript', {:date => '2022-1-11', :from => 'Florencia'})
  puts "Date:     #{email_hash.date}"
  puts "From:     #{email_hash.from}"
  puts "Subject:  #{email_hash.subject}"
  
end

#format_email_hash


class Mailbox 
  attr_reader :name 

  def initialize(name, emails)
    @name, @emails = name, emails 
  end

  def emails
    @emails 
  end

end

puts 
def format_mailbox
  emails = [
    EmailHash.new("Homework this week", { :date => "2022-29-10", :from => "Ferdous"}),
    EmailHash.new("Keep on coding! :)", { :date => "2022-29-10", :from => "Dajana"}),
    EmailHash.new("Re: Homework this week", { :date => "2022-29-10", :from => "Ariane"})
  ]
  mailbox = Mailbox.new('Work_space', emails)

  puts "Tarea: #{mailbox.name}"
  mailbox.emails.each do |mail|
    puts "Date:     #{mail.date}"
    puts "From:     #{mail.from}"
    puts "Subject:  #{mail.subject}"
    puts "\n"
  end
end

#format_mailbox

class MailboxTextFormatter 

  #attr_reader :mailbox 

  def initialize(mailbox)
    @mailbox = mailbox 
  end

  def format
    data = [
      separator, 
      format_row(['Date', 'From', 'Subject']),
      separator,
      row.collect {|cell| format_row(cell)},
      separator
    ]
    data.join("\n")
  end

  def emails 
    @mailbox.emails # Recibimos el array pasado a mailbox
  end

  def row # fila: guardamos los datos en un array 
    emails.collect {|email| [email.date, email.from, email.subject]}
  end

  def column # columnas ordenamos los valores del arreglo [fechas, from, tareas] 
    row.transpose 
  end

  def column_width # Obtenemos la longitud de cada elemento en el array 
    column.map {|column| column.max_by {|cell| cell.size}.size}
  end

  def separator # usamos el número de longitud para crear el separador +----+----+--------+
    "+#{column_width.map {|width| '-' * (width + 2)}.join('+')}+"
  end

  def format_row(row) # de cero a longitud de row que es 3(-1 = 2) 
    cells = 0.upto(row.size - 1).map do |indx|
      row[indx].ljust(column_width[indx]) # ajustamos el ancho 
    end
    "| #{cells.join(" | ")} |"
  end

end


def format_mail_formatter
  emails = [
    EmailHash.new("Homework this week", { :date => "2014-12-01", :from => "Ferdous"}),
    EmailHash.new("Keep on coding! :)", { :date => "2014-12-01", :from => "Dajana"}),
    EmailHash.new("Re: Homework this week", { :date => "2014-12-02", :from => "Ariane"})
  ]

  mailbox_2 = Mailbox.new('Tareas de Formateado: ', emails)

  mailbox_text_formatter = MailboxTextFormatter.new(mailbox_2)

  puts 'Row: '
  p mailbox_text_formatter.row 
  puts 
  puts 'Column: '
  p mailbox_text_formatter.column
  puts 
  puts 'Column_width: '
  p mailbox_text_formatter.column_width
  puts 
  puts 'Separator: '
  p mailbox_text_formatter.separator 
  puts 
  puts 'Format_row: '
  p mailbox_text_formatter.format_row(['Date', 'From', 'Subject'])
  puts 
  puts "Formatter"
  puts mailbox_text_formatter.format 
end

format_mail_formatter