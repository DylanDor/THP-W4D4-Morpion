class Display

    attr_accessor :name1, :name2

    def start_text
        puts puts puts
        puts " 🌸 BIENVENUE DANS THP The MORPION 💩 ".bold
        puts "   POUR CE JEU IL FAUT DEUX JOUEURS".bold
        puts
        puts "JOUEUR 1 : QUEL EST TON NOM ?"
        print " > ".green.bold
        @name1 = gets.chomp
        puts "JOUEUR 2 : QUEL EST TON NOM ?"
        print " > ".green.bold
        @name2 = gets.chomp
    end

    def new_round_text
        puts
        puts " VOULEZ VOUS REJOUER ?"
        puts " ✅ PUTS (Y) FOR YES ".green + " ❌ PUTS (N) FOR NO ".red
        puts
        print " > ".bold.green
    end

    def case_choice_text
        puts
        puts " DANS QUELLE CASE VEUX TU JOUER ? "
        print " > ".green.bold
    end
end