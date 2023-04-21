
require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'ProyRuby.db'
)

require 'fox16'  
include Fox 

class Maestros < FXMainWindow
    def initialize(app)
        super(app, "Maestros", :width=>400, :height=>300)
        hFrame1 = FXHorizontalFrame.new(self)
        chrLabel = FXLabel.new(hFrame1, "Nombre:")
        nombre = FXTextField.new(hFrame1, 30)

        hFramea = FXHorizontalFrame.new(self)
        textoNombre = FXText.new(hFramea, :opts => TEXT_WORDWRAP|LAYOUT_FILL,
            :width=>130, :height=>30,:x=>380, :y=>200)


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
            modificar(textoNombre.text, mat1.text, mat2.text, mat3.text)
        end

       


        #BOTON DE BUSCAR Y MOSTRAR EL NOMBRE DEL MAESTRO
        botonBuscar1 = FXButton.new(hFrame3,"Buscar maestro")
        botonBuscar1.connect(SEL_COMMAND) do |sender, sel, data|
            ban="NO EXISTE"

            begin  
                db =SQLite3::Database.open 'ProyRuby.db'
                query= db.prepare "SELECT Nombre_maestro from Maestros ;"
                data= query.execute

                for linea in data
                    nombre_maestro= linea[0]

                    if nombre_maestro == nombre.text
                        variable= nombre_maestro
                        ban= "EXISTE"
                    end 
                end
            rescue SQLite3::Exception => e
                puts "Ecepsion"
                puts e
            
            end

            if ban == "NO EXISTE"
                FXMessageBox.error(app, MBOX_OK, 'Error', 'El docente no existe.')

            else
                
                textoNombre.text = "#{variable}"

            end

        end

    end


    

    def modificar(nombre_teacher, m1, m2, m3)
        materia1_estado= "libre"
        materia2_estado= "libre"
        materia3_estado= "libre"
        print "Modificar con estos datos: ",nombre_teacher, m1, m2, m3

        #======================================================================
        #======================================================================
        begin  
            db =SQLite3::Database.open 'ProyRuby.db'
            query= db.prepare "SELECT Nombre_maestro from MateriasFK 
            where Nombre_materia= '#{m1}';"
            data= query.execute

            for linea in data
                nombre_maestro= linea[0]

                if nombre_maestro != nil && nombre_maestro != nombre_teacher
                    materia1_estado="ocupada"
                end 
            end
            

        rescue SQLite3::Exception => e
            puts "Ecepsion"
            puts e
        
        end

        begin  
            db =SQLite3::Database.open 'ProyRuby.db'
            query= db.prepare "SELECT Nombre_maestro from MateriasFK 
            where Nombre_materia= '#{m2}';"
            data= query.execute

            for linea in data
                nombre_maestro= linea[0]

                if nombre_maestro != nil && nombre_maestro != nombre_teacher
                    materia2_estado="ocupada"
                end 
            end
            

        rescue SQLite3::Exception => e
            puts "Ecepsion"
            puts e
        
        end

        begin  
            db =SQLite3::Database.open 'ProyRuby.db'
            query= db.prepare "SELECT Nombre_maestro from MateriasFK 
            where Nombre_materia= '#{m3}';"
            data= query.execute

            for linea in data
                nombre_maestro= linea[0]

                if nombre_maestro != nil && nombre_maestro != nombre_teacher
                    materia3_estado="ocupada"
                end 
            end
            

        rescue SQLite3::Exception => e
            puts "Ecepsion"
            puts e
        
        end

        #======================================================================
        #======================================================================

        if (nombre_teacher == nil || nombre_teacher == "")
            FXMessageBox.error(app, MBOX_OK, 'Error', 'Escribe el nombre del docente.')
        else 
                
            if materia1_estado == "libre" && materia2_estado =="libre"  && materia3_estado=="libre" && (nombre_teacher != nil && nombre_teacher != "")
                puts "SE MODIFICA LA INFO UPDATE"
                begin  #las materias q el maestro tenia se LIBERAN
                    db =SQLite3::Database.open 'ProyRuby.db'
                    query= db.prepare "UPDATE MateriasFK 
                    SET Nombre_maestro = NULL
                WHERE
                    Nombre_maestro = '#{nombre_teacher}'"
                    data= query.execute
   
                rescue SQLite3::Exception => e
                    puts "Modificar docente"
                    puts e
                
                end


                
                funcion_modificar(nombre_teacher, m1, m2, m3)

            else
                resupesta= FXMessageBox.question(app, MBOX_YES_NO, 'Advertencia', 'Otros docentes ya tienen asignada algunas materias. ¿Deseas cambiarlas a este docente?')
                puts resupesta

                if resupesta == 1 #si
                    funcion_modificar(nombre_teacher, m1, m2, m3)

                end

            end
        end

    end#modificar


    def funcion_modificar(nombre_teacher, m1, m2, m3)

        
            begin 
                db =SQLite3::Database.open 'ProyRuby.db'
                query= db.prepare "UPDATE Maestros 
                    SET Nombre_maestro = '#{nombre_teacher}', 
                    M1 = '#{m1}',
                    M2 = '#{m2}',
                    M3 = '#{m3}'"
                data= query.execute
    
            rescue SQLite3::Exception => e
                
                puts e
                
            
            end
    
            #Una vez liberadas las materias ahora si se actualiza la tabla de materias
                    #con las nuevas seleccionadas
                    begin 
                        db =SQLite3::Database.open 'ProyRuby.db'
                        query= db.prepare "UPDATE MateriasFK 
                            SET Nombre_materia = '#{m1}', 
                            Nombre_maestro = '#{nombre_teacher}'
                        WHERE
                            Nombre_materia = '#{m1}'"
                        data= query.execute
            
                    rescue SQLite3::Exception => e
                        
                        puts e
                        
                    
                    end
                    #===================Modificar materias q quiere====================================
                
                
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
                    #====================Modificar materias q quiere================================
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
                    #actualizacion de nuevas materias seleccionadas para el maestro.
    
                    FXMessageBox.information(app, MBOX_OK, 'Exito', 'Materias actualizadas correctamente.')
    




        

    end










    def registrar_nuevo_maestro(nombre_teacher,m1, m2, m3)
        puts "nombre teacher" ,nombre_teacher,
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
        #print "Info", materia1_estado, materia2_estado, materia3_estado, nombre_teacher
        if (nombre_teacher == nil || nombre_teacher == "")
            FXMessageBox.error(app, MBOX_OK, 'Error', 'Campos vacíos')
        else 
                
            if materia1_estado == "libre" && materia2_estado =="libre"  && materia3_estado=="libre" && (nombre_teacher != nil && nombre_teacher != "")

                bandera_inserto_maestro=TRUE
                begin 
                    db =SQLite3::Database.open 'ProyRuby.db'
                    query= db.prepare "INSERT INTO Maestros values('#{nombre_teacher}', '#{m1}', '#{m2}', '#{m3}');"
                    data= query.execute
                    FXMessageBox.information(app, MBOX_OK, 'Exito', 'Maestro registrado correctamente.')

        
                rescue SQLite3::Exception => e
                    puts "Maestro ya registrado"
                    FXMessageBox.information(app, MBOX_OK, 'Falla', 'Ya existe un docente con este nombre.')
                    bandera_inserto_maestro=FALSE
                
                end

                if bandera_inserto_maestro==TRUE

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
                end 



                    

            else
                FXMessageBox.error(app, MBOX_OK, 'Error', 'Materias no disponibles para el docente.')
                
            end

        end 

    end #FUNCTION
    
    def on_close
          getApp().exit(0)
    end

    def create
        super
        show(PLACEMENT_SCREEN)
    end 


end

