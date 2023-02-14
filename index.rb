
@agenda = [
  {nome: "Renan", telefone: 66999264440},
  {nome: "Rose", telefone: 66996556856}
]

def all_contacts
  puts "----------------------------------------------"
  @agenda.each do |contato|
      puts "#{contato[:nome]} - #{contato[:telefone]}"
    end
    puts "---------------------------------------------"
end

def add_contacts
  print "Nome: "
  nome = gets.chomp
  print "Telefone: "
  telefone = gets.chomp

  @agenda << {nome: nome, telefone: telefone}
end

def view_contacts
  
  print "Qual o nome deseja:"
  nome = gets.chomp

  @agenda.each do |contato|
    if contato[:nome].downcase.include?(nome.downcase)
      puts "\n#{contato[:nome]} - #{contato[:telefone]}"
      break
    end
    if contato[:nome].downcase != (nome.downcase)
      puts "\nUsuário não encontrado"
      break
    end
end
puts "---------------------------------------------"
end

def edit_contacts
  print "Qual o nome deseja alterar:"
  nome = gets.chomp

  @agenda.each do |contato|
    if contato[:nome].downcase == (nome.downcase)

    print "Nome para editar (se quiser manter o mesmo nome, aperte enter)"
    nome_salvo = contato[:nome]
    
    contato[:nome] = gets.chomp
    contato[:nome] = contato[:nome].empty? ? nome_salvo : contato[:nome]

    print "Telefone para editar (se quiser manter o mesmo telefone, aperte enter)"
    telefone_salvo = contato[:telefone]
    
    contato[:telefone] = gets.chomp
    contato[:telefone] = contato[:telefone].empty? ? telefone_salvo : contato[:telefone]

  end
end
end


def remove_contacts
 puts"Qual o contato que deseja remover?"
 nome = gets.chomp

puts"Deseja realmente excluir o Contato ? digite 1 para SIM ou 2 para cancelar"
  confirm = gets.chomp.to_i
case 

when confirm == 1
  @agenda.each do |contato| 
   if contato[:nome].downcase == (nome.downcase)
     index = @agenda.index(contato)
     @agenda.delete_at(index)
     puts"Contanto excluído"
     break
   end
   end
 end
end
loop do

  puts "1. Contatos\n2. Adicionar Contato\n3. Ver Contato\n4. Editar Contato\n5. Remover Contato\n0. Sair"  
  codigo = gets.chomp.to_i
  
  case 

when codigo == 0
  puts "Até mais!"
  break

when codigo == 1
  all_contacts
when codigo == 2
  add_contacts
when codigo == 3 
  view_contacts
when codigo == 4
  edit_contacts
when codigo == 5
  remove_contacts
else
  puts "Função não existe, por favor, digite um dos números sugeridos"
end

end
