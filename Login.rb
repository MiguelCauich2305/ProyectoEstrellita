
require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'ProyRuby.db'
)

require 'fox16'  
require_relative 'Menu'
require_relative 'Registrar'

include Fox 

class Ventana < FXMainWindow
    def initialize(app)
        @app=app
        super(app, "Log in", :width=>300, :height=>300)
        hFrame1 = FXHorizontalFrame.new(self)
        chrLabel = FXLabel.new(hFrame1, "Nombre:")
        chrTextField1 = FXTextField.new(hFrame1, 15)
        
        hFrame2 = FXHorizontalFrame.new(self)
        chrLabel = FXLabel.new(hFrame2, "Contraseña:")
        chrTextField2 = FXTextField.new(hFrame2, 10)

        hFrame3 = FXHorizontalFrame.new(self)
        b1 = FXButton.new(hFrame3, "Entrar")
        b1.connect(SEL_COMMAND) do
            Entrar(chrTextField1.text, chrTextField2.text)
        end
        

        b2= FXButton.new(hFrame3, "Cancelar")
        b2.connect(SEL_COMMAND) do
            on_close()
          end



        b4= FXButton.new(hFrame3, "Nuevo alumno")
        b4.connect(SEL_COMMAND) do
            registrar_alumno()
        end
    end


    def Entrar(nombre_obtenido, contraseña)
        begin 
            db =SQLite3::Database.open 'ProyRuby.db'
            query= db.prepare "SELECT Nombre, contra  FROM Logins"
            data= query.execute
            ban=FALSE
            
            #query= db.prepare "insert into  Logins values('#{username}', '#{contra}')"
            for linea in data
                nombrecito= linea[0]
                contrasena= linea[1]
                tipo=linea[2]
                if nombre_obtenido == nombrecito && contraseña==contrasena
                    ban=TRUE
                end
            end

            if ban == FALSE
                 FXMessageBox.error(app, MBOX_OK, 'Error', 'No hay coincidencias.')

            elsif ban == TRUE
                begin 
                    db =SQLite3::Database.open 'ProyRuby.db'
                    query= db.prepare "SELECT tipo  FROM Logins where Nombre='#{nombre_obtenido}' ";
                    data= query.execute

                    for linea in data
                        tipo_usuario= linea[0]
                    end

                rescue SQLite3::Exception => e
                    puts "Ecepsion"
                    puts e
                ensure 
                    query.close if query
                    db.close if db
                end

                if tipo_usuario== 'alumno'

                elsif tipo_usuario == 'maestro'
                    
                    menu()
                end


      
            end
            
        rescue SQLite3::Exception => e
            puts "Ecepsion"
            puts e
        ensure 
            query.close if query
            db.close if db
        end
    end

    
    
    def on_close
          getApp().exit(0)
    end

    def create
        super
        show(PLACEMENT_SCREEN)
    end 

    def registrar_maestro
        ventana=Maestros.new(@app)
        ventana.create
        ventana.show(PLACEMENT_SCREEN)
    end

    def registrar_alumno
        ventana=Registrar.new(@app)
        ventana.create
        ventana.show(PLACEMENT_SCREEN)
    end

    def menu #si es maestro se va al menu
        ventana=Menu.new(@app)
        ventana.create
        ventana.show(PLACEMENT_SCREEN)
    end


end

app = FXApp.new
Ventana.new(app)

app.create
app.run