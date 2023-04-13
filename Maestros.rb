
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
        nombre = FXTextField.new(hFrame1, 30)

        
        hFrame2 = FXHorizontalFrame.new(self)

        mat1= FXComboBox.new(hFrame2, 15)
        mat2= FXComboBox.new(hFrame2, 15)
        mat3= FXComboBox.new(hFrame2, 15)
        
        db =SQLite3::Database.open 'ProyRuby.db'
        query= db.prepare "select * from MateriasFK"
        data= query.execute

        begin
            for linea in data
                var= linea[0]
                mat1.appendItem( var )
                mat2.appendItem( var)
                mat3.appendItem( var)
            end

        rescue SQLite3::Exception => e
            puts "Ecepsion"
            puts e
        ensure 
            query.close if query
            db.close if db
        end
        
        
        

      
        hFrame3 = FXHorizontalFrame.new(self)
        b1 = FXButton.new(hFrame3, "Registrar nuevo maestro")
        b1.connect(SEL_COMMAND) do
            registrar_nuevo_maestro(nombre.text, mat1.text, mat2.text, mat3.text)
        end
        
       
        b2= FXButton.new(hFrame3, "Cancelar")
        b2.connect(SEL_COMMAND) do
            on_close()
        end

        b3= FXButton.new(hFrame3, "Modificar") #debe de poner nombr emaestro
        b3.connect(SEL_COMMAND) do
            modificar()
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

    def registrar_nuevo_maestro(nombre_teacher,m1, m2, m3)
        print "nombre teacher" ,nombre_teacher
        materia1_estado= "libre"
        materia2_estado= "libre"
        materia3_estado= "libre"

        begin 
            db =SQLite3::Database.open 'ProyRuby.db'
            query= db.prepare "SELECT Nombre_maestro from MateriasFK 
            where Nombre_materia= '#{m1}';"
            data= query.execute

            for linea in data
                print "linea1", linea
                nombre_maestro= linea[0]
                puts nombre_maestro

                if nombre_maestro != nil
                    materia1_estado="ocupada"
                end 
            end

        rescue SQLite3::Exception => e
            puts "Ecepsion"
            puts e
        
        end
        #===================================================================
        begin 
            db =SQLite3::Database.open 'ProyRuby.db'
            query= db.prepare "SELECT Nombre_maestro from MateriasFK 
            where Nombre_materia= '#{m2}';"
            data= query.execute

            for linea in data
                print "linea2", linea
                nombre_maestro= linea[0]
                puts nombre_maestro

                if nombre_maestro != nil
                    materia2_estado="ocupada"
                end 
            end

        rescue SQLite3::Exception => e
            puts "Ecepsion"
            puts e
        
        end
        #=====================================================================
        begin 
            db =SQLite3::Database.open 'ProyRuby.db'
            query= db.prepare "SELECT Nombre_maestro from MateriasFK 
            where Nombre_materia= '#{m3}';"
            data= query.execute

            for linea in data
                print "linea3", linea
                nombre_maestro= linea[0]
                puts nombre_maestro

                if nombre_maestro != nil
                    materia3_estado="ocupada"
                end 
            end

        rescue SQLite3::Exception => e
            puts "Ecepsion"
            puts e
        
        end
        #===================================================================
        #COMPRUEBO QUE TODOS LOS CAMPOS ESTEN LLENOS 3 MATERIAS Y EL NOMBRE DEL DOCENTE
        print "Info", materia1_estado, materia2_estado, materia3_estado, nombre_teacher
        if materia1_estado == "libre" && materia2_estado =="libre"  && materia3_estado=="libre" && (nombre_teacher != nil && nombre_teacher != "")
            begin 
                db =SQLite3::Database.open 'ProyRuby.db'
                query= db.prepare "INSERT INTO Maestros values('#{nombre_teacher}', '#{m1}', '#{m2}', '#{m3}');"
                data= query.execute
    
            rescue SQLite3::Exception => e
                puts "Ecepsion"
                puts e
            
            end

            #inserto en la tabla de materias el nombre del teacher q la imparte
            #=================================================================
            begin 
                db =SQLite3::Database.open 'ProyRuby.db'
                query= db.prepare "UPDATE MateriasFK 
                    SET Nombre_materia = '#{m1}', 
                    Nombre_maestro = '#{nombre_teacher}'
                WHERE
                    Nombre_materia = '#{m1}'"
                data= query.execute
    
            rescue SQLite3::Exception => e
                puts "Ecepsion"
                puts e
            
            end
            #====================================================================
            begin 
                db =SQLite3::Database.open 'ProyRuby.db'
                query= db.prepare "UPDATE MateriasFK 
                    SET Nombre_materia = '#{m2}', 
                    Nombre_maestro = '#{nombre_teacher}'
                WHERE
                    Nombre_materia = '#{m2}'"
                data= query.execute
    
            rescue SQLite3::Exception => e
                puts "Ecepsion"
                puts e
            
            end
            #============================================================================
            begin 
                db =SQLite3::Database.open 'ProyRuby.db'
                query= db.prepare "UPDATE MateriasFK 
                    SET Nombre_materia = '#{m3}', 
                    Nombre_maestro = '#{nombre_teacher}'
                WHERE
                    Nombre_materia = '#{m3}'"
                data= query.execute
    
            rescue SQLite3::Exception => e
                puts "Ecepsion"
                puts e
            
            end

        else
            puts "NO SE PUEDE REGISTRAR DOCENTE"
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