
require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'ProyRuby.db'
)

require 'fox16'  
include Fox 

class Registrar < FXMainWindow
    def initialize(app)
        @app=app
        super(app, "Registro de alumno", :width=>300, :height=>300)
        hFrame1 = FXHorizontalFrame.new(self)
        chrLabel = FXLabel.new(hFrame1, "Número de control:")
        chrTextField1 = FXTextField.new(hFrame1, 9)
        
        hFrame2 = FXHorizontalFrame.new(self)
        chrLabel = FXLabel.new(hFrame2, "Contraseña:")
        chrTextField2 = FXTextField.new(hFrame2, 10)

        hFrame3 = FXHorizontalFrame.new(self)
        b2= FXButton.new(hFrame3, "Cancelar")
        b2.connect(SEL_COMMAND) do
            on_close()
          end

        b3= FXButton.new(hFrame3, "Aceptar")
        b3.connect(SEL_COMMAND) do
            Nuevo_user(chrTextField1.text, chrTextField2.text)
        end
    end


    def Nuevo_user(nombre_obtenido, contraseña)
        b=TRUE
        begin 
            db =SQLite3::Database.open 'ProyRuby.db'
            query= db.prepare "SELECT Nombre, contra  FROM Logins"
            data= query.execute

            for linea in data
                nombrecito= linea[0]
                if nombre_obtenido == nombrecito
                    b=FALSE
                   
                end
            end

        rescue SQLite3::Exception => e
            puts "Ecepsion"
            puts e
        
        end

        if b== TRUE

            begin 
                query= db.prepare "INSERT INTO Logins values('#{nombre_obtenido}', '#{contraseña}', 'alumno')"
                data= query.execute
                FXMessageBox.information(app, MBOX_OK, 'Exito', 'Usuario registrado.')

            rescue SQLite3::Exception => e
                FXMessageBox.information(app, MBOX_OK, 'Exito', e)

            end
            
        elsif b= FALSE 
            FXMessageBox.error(app, MBOX_OK, 'Error', 'Ya hay un usuario con el mismo nombre.')

        end

        

            

        
    end
    
    def on_close
        getApp().exit(0)
    end



end

