
require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'ProyRuby.db'
)

require 'fox16'  
include Fox 

class Ventana < FXMainWindow
    def initialize(app)
        super(app, "Maestros", :width=>400, :height=>300)
        hFrame1 = FXHorizontalFrame.new(self)
        chrLabel = FXLabel.new(hFrame1, "Nombre:")
        chrTextField1 = FXTextField.new(hFrame1, 30)

        
        hFrame2 = FXHorizontalFrame.new(self)

        mat1= FXComboBox.new(hFrame2, 15)
        mat2= FXComboBox.new(hFrame2, 15)
        mat3= FXComboBox.new(hFrame2, 15)

        
        
        hFrame3 = FXHorizontalFrame.new(self)
        b1 = FXButton.new(hFrame3, "Registrar nuevo maestro")
        b1.connect(SEL_COMMAND) do
            #registrar_nuevo_maestro(chrTextField1.text, mat1, mat2, mat3)
        end
        
       
        b2= FXButton.new(hFrame3, "Cancelar")
        b2.connect(SEL_COMMAND) do
            #on_close()
        end

        b3= FXButton.new(hFrame3, "Modificar") #debe de poner nombr emaestro
        b3.connect(SEL_COMMAND) do
            #modificar()
        end
    end


    def modificar
        begin 
            db =SQLite3::Database.open 'ProyRuby.db'
            query= db.prepare "SELECT Nombre, contra  FROM Logins"
            data= query.execute
            ban=FALSE
            
            #query= db.prepare "insert into  Logins values('#{username}', '#{contra}')"
            for linea in data
                nombrecito= linea[0]
                contrasena= linea[1]
                if nombre_obtenido == nombrecito && contraseña==contrasena
                    ban=TRUE
                end
            end
            puts ban
        rescue SQLite3::Exception => e
            puts "Ecepsion"
            puts e
        ensure 
            query.close if query
            db.close if db
        end
    end

    def registrar_nuevo_maestro(nombre_obtenido,m1, m2, m3)
        begin 
            db =SQLite3::Database.open 'ProyRuby.db'
            query= db.prepare "SELECT Nombre, contra  FROM Logins"
            data= query.execute

            for linea in data
                nombrecito= linea[0]
                if nombre_obtenido == nombrecito
                    ban="Ya hay un usuario con el mismo nombre. "

                   
                else

                    begin 
                        query= db.prepare "INSERT INTO Logins values('#{nombre_obtenido}', '#{contraseña}')"
                        data= query.execute

                    rescue SQLite3::Exception => e
                        puts "Ecepsion"
                        puts e
                    

                    end
                    
                end
            end

            puts ban

        rescue SQLite3::Exception => e
            puts "Ecepsion"
            puts e
        
        end
    end
    
    def on_close
          getApp().exit(0)
    end

    def create
        super
        show(PLACEMENT_SCREEN)
    end 


end

app = FXApp.new
Ventana.new(app)

app.create
app.run