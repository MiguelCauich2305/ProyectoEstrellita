require 'fox16'
require 'sqlite3'
include(Fox)

#db=SQLite3::Database.new('ProyRuby.db');
#db = SQLite3::Database.open 'ProyRuby.db'
#db.execute "INSERT INTO Alumnos VALUES(1,'Audi',52642)"
#db.close
class Ventana < FXMainWindow
=begin
    @inicial = 10 
    @separacionAltura = 40
    @separacionAnchura = 100
    @diferencia = 15
=end

    def initialize(app)
        super(app, "Alumnos", :width=>1000, :height=>300)
        packer = FXPacker.new(self, :opts => LAYOUT_FILL)
        hframe = FXHorizontalFrame.new(packer,:opts => LAYOUT_SIDE_TOP|LAYOUT_FILL_X|LAYOUT_FILL_Y)
            
        ##################################### ENCERRONA 1 XD (nuevo) ####################################################################
        groupbox = FXGroupBox.new(hframe, "Datos del alumno",:opts => GROUPBOX_NORMAL|FRAME_GROOVE|LAYOUT_FILL_X|LAYOUT_FILL_Y)
        ######################################### Numero de control #####################################################################
        labelNoControl = FXLabel.new(groupbox,  "No. control", :opts =>LAYOUT_EXPLICIT, :width=>110, :height=>50, :x=>25, :y=>25)
        labelNoControl.font = FXFont.new(app, "Arial", 14)
        frameControl = FXHorizontalFrame.new(groupbox, :opts => LAYOUT_EXPLICIT, :width => 260, :height => 35, :x=>145, :y=>30)
        textoNoControl = FXText.new(frameControl, :opts => TEXT_WORDWRAP|LAYOUT_FILL)
        textoNoControl.font = FXFont.new(app, "Arial", 14)

        ######################################### Nombre ################################################################################
        labelNombre = FXLabel.new(groupbox, "Nombre", :opts =>LAYOUT_EXPLICIT, :width=>110, :height=>50, :x=>25, :y=>65)
        labelNombre.font = FXFont.new(app, "Arial", 14)
        frameNombre = FXHorizontalFrame.new(groupbox, :opts => LAYOUT_EXPLICIT, :width=>260, :height=>35, :x=>145, :y=>70)
        textoNombre = FXText.new(frameNombre, :opts => TEXT_WORDWRAP|LAYOUT_FILL)
        textoNombre.font = FXFont.new(app, "Arial", 14)

        ######################################### Direccion #############################################################################
        labelDirec = FXLabel.new(groupbox, "Direccion", :opts =>LAYOUT_EXPLICIT, :width=>110, :height=>50, :x=>25, :y=>105)
        labelDirec.font = FXFont.new(app, "Arial", 14)
        frameDirec = FXHorizontalFrame.new(groupbox, :opts => LAYOUT_EXPLICIT, :width=>260, :height=>35, :x=>145, :y=>110)
        textoDirec = FXText.new(frameDirec, :opts => TEXT_WORDWRAP|LAYOUT_FILL)
        textoDirec.font = FXFont.new(app, "Arial", 14)

        ######################################### Edad ##################################################################################
        labelEdad = FXLabel.new(groupbox, "Edad", :opts =>LAYOUT_EXPLICIT, :width=>110, :height=>50, :x=>25, :y=>145)
        labelEdad.font = FXFont.new(app, "Arial", 14)
        frameEdad = FXHorizontalFrame.new(groupbox, :opts => LAYOUT_EXPLICIT, :width=>260, :height=>35, :x=>145, :y=>150)
        textoEdad = FXText.new(frameEdad, :opts => TEXT_OVERSTRIKE|LAYOUT_FILL)
        textoEdad.font = FXFont.new(app, "Arial", 14)

        ##################################### ENCERRONA 2 XD (materias) ####################################################################

        groupbox2 = FXGroupBox.new(hframe, "Materias",:opts => GROUPBOX_NORMAL|FRAME_GROOVE|LAYOUT_FILL_X|LAYOUT_FILL_Y)
        frameUnidades = FXHorizontalFrame.new(groupbox2, :opts => LAYOUT_EXPLICIT, :width=>300, :height=>30, :x=>90, :y=>10) 
        labelU1 = FXLabel.new(frameUnidades, "Nuevas materias", :opts => LAYOUT_EXPLICIT,:width=>130, :height=>30 , :x=>0, :y=>0)
        labelU1.font = FXFont.new(app, "Arial", 11)
        labelU2 = FXLabel.new(frameUnidades, "Materias guardadas" , :opts => LAYOUT_EXPLICIT,:width=>130, :height=>30 , :x=>135, :y=>0) #
        labelU2.font = FXFont.new(app, "Arial", 11)
=begin 
        labelU3 = FXLabel.new(frameUnidades, "U3" , :opts => LAYOUT_EXPLICIT,:width=>30, :height=>30 , :x=>95, :y=>0) #
        labelU3.font = FXFont.new(app, "Arial", 11)
=end
        ######################################### Materia 1 #####################################################################
        labelMateria1 = FXLabel.new(groupbox2,  "Materia 1", :opts =>LAYOUT_EXPLICIT, :width=>90, :height=>50, :x=>10, :y=>35)
        labelMateria1.font = FXFont.new(app, "Arial", 14)
        frameCombo1 = FXHorizontalFrame.new(groupbox2, :opts => LAYOUT_EXPLICIT, :width => 120, :height => 60, :x=>100, :y=>40)
        comboM1 = FXComboBox.new(frameCombo1, 20,:opts => COMBOBOX_STATIC|FRAME_SUNKEN|FRAME_THICK|LAYOUT_FILL_X) 
        comboM1.numVisible = 6
        comboM1.font = FXFont.new(app, "Arial", 12)

        frameM1 = FXHorizontalFrame.new(groupbox2, :opts => LAYOUT_EXPLICIT, :width => 150, :height => 30, :x=>220, :y=>40)
        textoM1 = FXText.new(frameM1, :opts => TEXT_READONLY|LAYOUT_FILL)
        textoM1.font = FXFont.new(app, "Arial", 10)
=begin

        frameM1C2 = FXHorizontalFrame.new(groupbox2, :opts => LAYOUT_EXPLICIT, :width => 50, :height => 30, :x=>270, :y=>40)
        textoM1C2 = FXText.new(frameM1C2, :opts => TEXT_WORDWRAP|LAYOUT_FILL)
        textoM1C2.font = FXFont.new(app, "Arial", 10)

        frameM1C3 = FXHorizontalFrame.new(groupbox2, :opts => LAYOUT_EXPLICIT, :width => 50, :height => 30, :x=>320, :y=>40)
        textoM1C3 = FXText.new(frameM1C3 , :opts => TEXT_WORDWRAP|LAYOUT_FILL)
        textoM1C3.font = FXFont.new(app, "Arial", 10)
=end
        ######################################### Materia 1 ################################################################################
        labelMateria2 = FXLabel.new(groupbox2, "Materia 2", :opts =>LAYOUT_EXPLICIT, :width=>90, :height=>50, :x=>10, :y=>95)
        labelMateria2.font = FXFont.new(app, "Arial", 14)
        frameCombo2 = FXHorizontalFrame.new(groupbox2, :opts => LAYOUT_EXPLICIT, :width=>120, :height=>70, :x=>100, :y=>100)
        comboM2 = FXComboBox.new(frameCombo2, 20,:opts => COMBOBOX_STATIC|FRAME_SUNKEN|FRAME_THICK|LAYOUT_FILL_X) 
        comboM2.numVisible = 6
        comboM2.font = FXFont.new(app, "Arial", 12)

        frameM2 = FXHorizontalFrame.new(groupbox2, :opts => LAYOUT_EXPLICIT, :width => 150, :height => 30, :x=>220, :y=>100)
        textoM2 = FXText.new(frameM2, :opts => TEXT_READONLY|LAYOUT_FILL)
        textoM2.font = FXFont.new(app, "Arial", 10)
=begin

        frameM2C2 = FXHorizontalFrame.new(groupbox2, :opts => LAYOUT_EXPLICIT, :width => 50, :height => 30, :x=>270, :y=>100)
        textoM2C2 = FXText.new(frameM2C2, :opts => TEXT_WORDWRAP|LAYOUT_FILL)
        textoM2C2.font = FXFont.new(app, "Arial", 10)

        frameM2C3 = FXHorizontalFrame.new(groupbox2, :opts => LAYOUT_EXPLICIT, :width => 50, :height => 30, :x=>320, :y=>100)
        textoM2C3 = FXText.new(frameM2C3 , :opts => TEXT_WORDWRAP|LAYOUT_FILL)
        textoM2C3.font = FXFont.new(app, "Arial", 10)
=end
        ######################################### Materia 3 #############################################################################
        labelMateria3 = FXLabel.new(groupbox2, "Materia 3", :opts =>LAYOUT_EXPLICIT, :width=>90, :height=>50, :x=>10, :y=>165)
        labelMateria3.font = FXFont.new(app, "Arial", 14)
        frameCombo3 = FXHorizontalFrame.new(groupbox2, :opts => LAYOUT_EXPLICIT, :width=>120, :height=>70, :x=>100, :y=>170)
        comboM3 = FXComboBox.new(frameCombo3, 20,:opts => COMBOBOX_STATIC|FRAME_SUNKEN|FRAME_THICK|LAYOUT_FILL_X) 
        comboM3.numVisible = 6
        comboM3.font = FXFont.new(app, "Arial", 12)

        frameM3 = FXHorizontalFrame.new(groupbox2, :opts => LAYOUT_EXPLICIT, :width => 150, :height => 30, :x=>220, :y=>170)
        textoM3 = FXText.new(frameM3, :opts => TEXT_READONLY|LAYOUT_FILL)
        textoM3.font = FXFont.new(app, "Arial", 10)
        
=begin
        frameM3C2 = FXHorizontalFrame.new(groupbox2, :opts => LAYOUT_EXPLICIT, :width => 50, :height => 30, :x=>270, :y=>170)
        textoM3C2 = FXText.new(frameM3C2, :opts => TEXT_WORDWRAP|LAYOUT_FILL)
        textoM3C2.font = FXFont.new(app, "Arial", 10)

        frameM3C3 = FXHorizontalFrame.new(groupbox2, :opts => LAYOUT_EXPLICIT, :width => 50, :height => 30, :x=>320, :y=>170)
        textoM3C3 = FXText.new(frameM3C3 , :opts => TEXT_WORDWRAP|LAYOUT_FILL)
        textoM3C3.font = FXFont.new(app, "Arial", 10)
=end

        ######################################### Botones ###############################################################################
        
        ##################################### ENCERRONA 3 XD (botones) ##################################################################
        
        groupbox3 = FXGroupBox.new(hframe, "Acciones",:opts => GROUPBOX_NORMAL|FRAME_GROOVE|LAYOUT_FILL_X|LAYOUT_FILL_Y)
        frameBotones = FXHorizontalFrame.new(groupbox3, :opts => LAYOUT_FILL)
        ######################################### Numero de control #####################################################################
        botonGuardar = FXButton.new(frameBotones,"Guardar Nuevo", 
                                    :opts =>LAYOUT_EXPLICIT|BUTTON_NORMAL|LAYOUT_CENTER_Y, 
                                    :width=>100, :height=>30, :x=>20, :y=>20)
        botonGuardar.connect(SEL_COMMAND) do|sender, sel, data|
            numeroControl = textoNoControl
            nombre = textoNombre
            direccion = textoDirec
            edad = textoEdad
            materia1 = comboM1.text
            materia2 = comboM2.text
            materia3 = comboM3.text
            if (numeroControl.nil? == true) || (nombre.nil? == true) || (direccion.nil? == true)|| (edad.nil? == true)
                print numeroControl,": Vacio"
                FXMessageBox.error(app,MBOX_OK, "Llena los campos", "No puedes guardar informacion vacia")
            else
                puts "antes de la incersion", numeroControl,nombre,direccion,edad
                begin
                    db = SQLite3::Database.open 'ProyRuby.db'
                    db.execute "INSERT INTO Alumnos VALUES('#{numeroControl}', '#{nombre}', '#{direccion}', '#{edad}', '#{materia1}','#{materia2}','#{materia3}' );"
                    db.execute "INSERT INTO Calificaciones VALUES('#{numeroControl}', '#{materia1}','0','0','0');"
                    db.execute "INSERT INTO Calificaciones VALUES('#{numeroControl}', '#{materia2}','0','0','0');"
                    db.execute "INSERT INTO Calificaciones VALUES('#{numeroControl}', '#{materia3}','0','0','0');"
                    db.close
                    FXMessageBox.information(app,MBOX_OK, "Exito!", "Datos guardados!")
                    textoNoControl.text = ""
                    textoNombre.text = ""
                    textoDirec.text = ""
                    textoEdad.text = ""
                rescue SQLite3::Exception => e 
                    puts "Exception occurred"
                    puts e
                    FXMessageBox.error(app,MBOX_OK, "Error", "No se pudo guardar el alumno nuevo")
                ensure
                    db.close if db
                end
            end
        end
        botonBuscar = FXButton.new(frameBotones,"Buscar", 
                                    :opts =>LAYOUT_EXPLICIT|BUTTON_NORMAL|LAYOUT_CENTER_X, 
                                    :width=>80, :height=>30,:x=>20, :y=>60)
        botonBuscar.connect(SEL_COMMAND) do |sender, sel, data|
            numeroControl = textoNoControl
            nombre = textoNombre
            direccion = textoDirec
            edad = textoEdad
            #puts numeroControl, nombre, direccion, edad
            if (numeroControl.nil? == true)
                FXMessageBox.error(app,MBOX_OK, "Llena el campo", "Se necesita del campo Numero de control lleno")
            else
                puts "antes de la Busqueda", numeroControl
                begin
                    db = SQLite3::Database.open 'ProyRuby.db'
                    resultados = db.execute "SELECT * from Alumnos WHERE NoControl = '#{numeroControl}';"
                    db.close
                    resultados.each do |row|
                        puts row.join "\s"
                        textoNoControl.text = "#{row[0]}"
                        textoNombre.text = "#{row[1]}"
                        textoDirec.text = "#{row[2]}"
                        textoEdad.text = "#{row[3] }"
                        textoM1.text = "#{row[4]}"
                        textoM2.text = "#{row[5]}"
                        textoM3.text = "#{row[6]}"
                    end 
                    FXMessageBox.information(app,MBOX_OK, "Exito!", "Busqueda realizada!")
                    
                rescue SQLite3::Exception => e 
                    puts "Exception occurred"
                    puts e
                    FXMessageBox.error(app,MBOX_OK, "Error", "No se pudo realizar la busqueda")
                ensure
                    db.close if db
                end
            end
        end
        botonModificar = FXButton.new(frameBotones,"Modificar", 
                                    :opts =>LAYOUT_EXPLICIT|BUTTON_NORMAL|LAYOUT_CENTER_X, 
                                    :width=>80, :height=>30,:x=>20, :y=>100)
        botonModificar .connect(SEL_COMMAND) do|sender, sel, data|
            numeroControl = textoNoControl
            nombre = textoNombre
            direccion = textoDirec
            edad = textoEdad
            materia1 = comboM1.text
            materia2 = comboM2.text
            materia3 = comboM3.text
            materia1Guardada = textoM1
            materia2Guardada = textoM2
            materia3Guardada = textoM3
            materia1Enviar = ""
            materia2Enviar = ""
            materia3Enviar = ""
            if materia1 != materia1Guardada
                materia1Enviar = materia1
            else
                materia1Enviar = materia1Guardada
            end
            if materia2 != materia2Guardada
                materia2Enviar = materia2
            else
                materia2Enviar = materia2Guardada
            end
            if materia3 != materia3Guardada
                materia3Enviar = materia3
            else
                materia3 = materia3Guardada
            end

            if (numeroControl.nil? == true) || (nombre.nil? == true) || (direccion.nil? == true)|| (edad.nil? == true)
                FXMessageBox.error(app,MBOX_OK, "Llena los campos", "No puedes guardar informacion vacia")
            else
                puts "antes de la Modificacion", numeroControl
                begin
                    db = SQLite3::Database.open 'ProyRuby.db'
                    resultados = db.execute "UPDATE Alumnos SET NoControl = '#{numeroControl}', Nombre = '#{nombre}', Direccion = '#{direccion}', Edad = '#{edad}', M1 = '#{materia1Enviar}', M2 = '#{materia2Enviar}', M3 = '#{materia3Enviar}'  WHERE NoControl = '#{numeroControl}';"
                    db.execute "UPDATE Calificaciones SET Nombre_materia = '#{materia1Enviar}' WHERE (Nombre_materia = '#{materia1}') AND (NoControl = '#{numeroControl})');"
                    db.execute "UPDATE Calificaciones SET Nombre_materia = '#{materia2Enviar}' WHERE (Nombre_materia = '#{materia2}') AND (NoControl = '#{numeroControl})');"
                    db.execute "UPDATE Calificaciones SET Nombre_materia = '#{materia2Enviar}' WHERE (Nombre_materia = '#{materia3}') AND (NoControl = '#{numeroControl})');"
                    db.close
                    FXMessageBox.information(app,MBOX_OK, "Exito!", "Datos actualizados!")
                    textoNoControl.text = ""
                    textoNombre.text = ""
                    textoDirec.text = ""
                    textoEdad.text = ""
                    textoM1.text = ""
                    textoM2.text = ""
                    textoM3.text = ""
                rescue SQLite3::Exception => e 
                    puts "Exception occurred"
                    puts e
                    FXMessageBox.error(app,MBOX_OK, "Error", "No se pudo Modificar el usuario")
                ensure
                    db.close if db
                end
            end
        end

        botonEliminar = FXButton.new(frameBotones,"Eliminar", 
                                    :opts =>LAYOUT_EXPLICIT|BUTTON_NORMAL|LAYOUT_CENTER_X, 
                                    :width=>80, :height=>30,:x=>20, :y=>140)
        botonEliminar.connect(SEL_COMMAND) do|sender, sel, data|
            numeroControl = textoNoControl
            nombre = textoNombre
            direccion = textoDirec
            edad = textoEdad
            if (numeroControl.nil? == true)
                FXMessageBox.error(app,MBOX_OK, "Llena el campo", "Se necesita del campo Numero de control lleno")
            else
                puts "antes de la Eliminacion", numeroControl
                begin
                    db = SQLite3::Database.open 'ProyRuby.db'
                    resultados = db.execute "DELETE from Alumnos WHERE NoControl = '#{numeroControl}';"
                    db.execute "DELETE from Calificaciones WHERE NoControl = '#{numeroControl}';"
                    db.close
                    FXMessageBox.information(app,MBOX_OK, "Exito!", "Datos eliminados!")
                    textoNoControl.text = ""
                    textoNombre.text = ""
                    textoDirec.text = ""
                    textoEdad.text = ""
                    textoM1.text = ""
                    textoM2.text = ""
                    textoM3.text = ""
                rescue SQLite3::Exception => e 
                    puts "Exception occurred"
                    puts e
                    FXMessageBox.error(app,MBOX_OK, "Error", "No se pudo eliminar el usuario")
                ensure
                    db.close if db
                end
            end
        end

        puts "entrando a Buscar Materias"
        begin
            db = SQLite3::Database.open 'ProyRuby.db'
            resultados = db.execute "SELECT * from MateriasFK"
            db.close
            resultados.each do |row|
                #puts row.join "\s"
                comboM1.appendItem(row[0])
                comboM2.appendItem(row[0])
                comboM3.appendItem(row[0])
            end 
            #FXMessageBox.information(app,MBOX_OK, "Exito!", "Busqueda realizada!")
        rescue SQLite3::Exception => e 
            puts "Exception occurred"
            puts e
            FXMessageBox.error(app,MBOX_OK, "Error", "No se pudo encontrar Materias")
        ensure
            db.close if db
        end
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

