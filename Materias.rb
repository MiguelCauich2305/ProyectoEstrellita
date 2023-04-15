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
        super(app, "Materias", :width=>1000, :height=>300)
        packer = FXPacker.new(self, :opts => LAYOUT_FILL)
        hframe = FXHorizontalFrame.new(packer,:opts => LAYOUT_SIDE_TOP|LAYOUT_FILL_X|LAYOUT_FILL_Y)
            
        ##################################### ENCERRONA 1 XD (nuevo) ####################################################################
        groupbox = FXGroupBox.new(hframe, "Calificaciones",:opts => GROUPBOX_NORMAL|FRAME_GROOVE|LAYOUT_FILL_X|LAYOUT_FILL_Y)
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
        textoNombre = FXText.new(frameNombre, :opts => COMBOBOX_STATIC|LAYOUT_FILL)
        textoNombre.font = FXFont.new(app, "Arial", 14)

        frameUnidades = FXHorizontalFrame.new(groupbox, :opts => LAYOUT_EXPLICIT, :width=>300, :height=>30,:x=>225, :y=>120) 
        labelU1 = FXLabel.new(frameUnidades, "U1", :opts => LAYOUT_EXPLICIT,:width=>30, :height=>30 , :x=>0, :y=>0)
        labelU1.font = FXFont.new(app, "Arial", 11)
        labelU2 = FXLabel.new(frameUnidades, "U2" , :opts => LAYOUT_EXPLICIT,:width=>30, :height=>30 , :x=>50, :y=>0) #
        labelU2.font = FXFont.new(app, "Arial", 11)
        labelU3 = FXLabel.new(frameUnidades, "U3" , :opts => LAYOUT_EXPLICIT,:width=>30, :height=>30 , :x=>100, :y=>0) #
        labelU3.font = FXFont.new(app, "Arial", 11)

        frameM1 = FXHorizontalFrame.new(groupbox, :opts =>LAYOUT_EXPLICIT, :width=>150, :height=>30, :x=>25, :y=>150)
        textoM1 = FXText.new(frameM1, :opts => TEXT_READONLY|LAYOUT_FILL)
        textoM1.font = FXFont.new(app, "Arial", 10)

        frameM2 = FXHorizontalFrame.new(groupbox, :opts => LAYOUT_EXPLICIT, :width => 150, :height => 30, :x=>25, :y=>200)
        textoM2 = FXText.new(frameM2, :opts => TEXT_READONLY|LAYOUT_FILL)
        textoM2.font = FXFont.new(app, "Arial", 10)

        frameM3 = FXHorizontalFrame.new(groupbox, :opts => LAYOUT_EXPLICIT, :width => 150, :height => 30, :x=>25, :y=>250)
        textoM3 = FXText.new(frameM3, :opts => TEXT_READONLY|LAYOUT_FILL)
        textoM3.font = FXFont.new(app, "Arial", 10)

                ##################################### Materia 1 ##################################################################

                frameM1C1 = FXHorizontalFrame.new(groupbox, :opts => LAYOUT_EXPLICIT, :width => 50, :height => 30, :x=>220, :y=>150)
                textoM1C1 = FXText.new(frameM1C1, :opts => TEXT_WORDWRAP|LAYOUT_FILL)
                textoM1C1.font = FXFont.new(app, "Arial", 10)

                frameM1C2 = FXHorizontalFrame.new(groupbox, :opts => LAYOUT_EXPLICIT, :width => 50, :height => 30, :x=>270, :y=>150)
                textoM1C2 = FXText.new(frameM1C2, :opts => TEXT_WORDWRAP|LAYOUT_FILL)
                textoM1C2.font = FXFont.new(app, "Arial", 10)

                frameM1C3 = FXHorizontalFrame.new(groupbox, :opts => LAYOUT_EXPLICIT, :width => 50, :height => 30, :x=>320, :y=>150)
                textoM1C3 = FXText.new(frameM1C3 , :opts => TEXT_WORDWRAP|LAYOUT_FILL)
                textoM1C3.font = FXFont.new(app, "Arial", 10)
                
                ##################################### Materia 2 ##################################################################
                frameM2C1 = FXHorizontalFrame.new(groupbox, :opts => LAYOUT_EXPLICIT, :width => 50, :height => 30, :x=>220, :y=>200)
                textoM2C1 = FXText.new(frameM2C1, :opts => TEXT_WORDWRAP|LAYOUT_FILL)
                textoM2C1.font = FXFont.new(app, "Arial", 10)

                frameM2C2 = FXHorizontalFrame.new(groupbox, :opts => LAYOUT_EXPLICIT, :width => 50, :height => 30, :x=>270, :y=>200)
                textoM2C2 = FXText.new(frameM2C2, :opts => TEXT_WORDWRAP|LAYOUT_FILL)
                textoM2C2.font = FXFont.new(app, "Arial", 10)

                frameM2C3 = FXHorizontalFrame.new(groupbox, :opts => LAYOUT_EXPLICIT, :width => 50, :height => 30, :x=>320, :y=>200)
                textoM2C3 = FXText.new(frameM2C3 , :opts => TEXT_WORDWRAP|LAYOUT_FILL)
                textoM2C3.font = FXFont.new(app, "Arial", 10)

                ##################################### Materia 3 ##################################################################
                frameM3C1 = FXHorizontalFrame.new(groupbox, :opts => LAYOUT_EXPLICIT, :width => 50, :height => 30, :x=>220, :y=>250)
                textoM3C1 = FXText.new(frameM3C1, :opts => TEXT_WORDWRAP|LAYOUT_FILL)
                textoM3C1.font = FXFont.new(app, "Arial", 10)

                frameM3C2 = FXHorizontalFrame.new(groupbox, :opts => LAYOUT_EXPLICIT, :width => 50, :height => 30, :x=>270, :y=>250)
                textoM3C2 = FXText.new(frameM3C2, :opts => TEXT_WORDWRAP|LAYOUT_FILL)
                textoM3C2.font = FXFont.new(app, "Arial", 10)
        
                frameM3C3 = FXHorizontalFrame.new(groupbox, :opts => LAYOUT_EXPLICIT, :width => 50, :height => 30, :x=>320, :y=>250)
                textoM3C3 = FXText.new(frameM3C3 , :opts => TEXT_WORDWRAP|LAYOUT_FILL)
                textoM3C3.font = FXFont.new(app, "Arial", 10)


        ##################################### Acciones Encerrona 1 ##################################################################  
        frameBotones1 = FXHorizontalFrame.new(groupbox, :opts => LAYOUT_FILL)

        botonBuscar1 = FXButton.new(frameBotones1,"Buscar", 
                                    :opts =>LAYOUT_EXPLICIT|BUTTON_NORMAL|LAYOUT_CENTER_X, 
                                    :width=>80, :height=>30,:x=>420, :y=>10)
        botonBuscar1.connect(SEL_COMMAND) do |sender, sel, data|
            numeroControl = textoNoControl
            if (numeroControl.nil? == true)
                FXMessageBox.error(app,MBOX_OK, "Llena el campo", "Se necesita del campo Numero de control lleno")
            else
                puts "antes de la Busqueda", numeroControl
                begin
                    db = SQLite3::Database.open 'ProyRuby.db'
                    resultados = db.execute "SELECT * from Alumnos WHERE NoControl = '#{numeroControl}';"
                    resultados2 = db.execute "SELECT * from Calificaciones WHERE NoControl = '#{numeroControl}';"
                    db.close
                    resultados.each do |row|
                        puts row.join "\s"
                        textoNoControl.text = "#{row[0]}"
                        textoNombre.text = "#{row[1]}"
                        textoM1.text = "#{row[4]}"
                        textoM2.text = "#{row[5]}"
                        textoM3.text = "#{row[6]}"
                    end 
                    valorCiclo = 0
                    resultados2.each do |row|
                        if valorCiclo == 0
                            textoM1C1.text = "#{row[2]}"
                            textoM1C2.text = "#{row[3]}"
                            textoM1C3.text = "#{row[4]}"
                            valorCiclo = valorCiclo + 1
                        elsif valorCiclo == 1
                            textoM2C1.text = "#{row[2]}"
                            textoM2C2.text = "#{row[3]}"
                            textoM2C3.text = "#{row[4]}"
                            valorCiclo = valorCiclo + 1
                        elsif
                            textoM3C1.text = "#{row[2]}"
                            textoM3C2.text = "#{row[3]}"
                            textoM3C3.text = "#{row[4]}"
                            valorCiclo = valorCiclo + 1
                        else
                            valorCiclo = 0
                        end
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

        botonGuardar2 = FXButton.new(frameBotones1,"Guardar Calificaciones", 
                                    :opts =>LAYOUT_EXPLICIT|BUTTON_NORMAL|LAYOUT_CENTER_Y, 
                                    :width=>130, :height=>30,:x=>380, :y=>200)
        botonGuardar2.connect(SEL_COMMAND) do|sender, sel, data|
            numeroControl = textoNoControl
            materia1 = textoM1.text
            materia2 = textoM2.text
            materia3 = textoM3.text

            m1C1 = textoM1C1.text
            m1C2 = textoM1C2.text
            m1C3 = textoM1C3.text

            m2C1 = textoM2C1.text
            m2C2 = textoM2C2.text
            m2C3 = textoM2C3.text

            m3C1 = textoM3C1.text
            m3C2 = textoM3C2.text
            m3C3 = textoM3C3.text

            if (numeroControl.nil? == true)
                print numeroControl,": Vacio"
                FXMessageBox.error(app,MBOX_OK, "Llena los campos", "No puedes guardar informacion vacia")
            else
                puts "antes de la incersion", numeroControl
                begin
                    db = SQLite3::Database.open 'ProyRuby.db'
                    db.execute "UPDATE Calificaciones SET U1 = '#{m1C1}' WHERE (Nombre_materia = '#{materia1}') AND (NoControl = '#{numeroControl})');"
                    db.execute "UPDATE Calificaciones SET U2 = '#{m1C2}' WHERE (Nombre_materia = '#{materia1}') AND (NoControl = '#{numeroControl})');"
                    db.execute "UPDATE Calificaciones SET U3 = '#{m1C3}' WHERE (Nombre_materia = '#{materia1}') AND (NoControl = '#{numeroControl})');"

                    db.execute "UPDATE Calificaciones SET U1 = '#{m2C1}' WHERE (Nombre_materia = '#{materia2}') AND (NoControl = '#{numeroControl})');"
                    db.execute "UPDATE Calificaciones SET U2 = '#{m2C2}' WHERE (Nombre_materia = '#{materia2}') AND (NoControl = '#{numeroControl})');"
                    db.execute "UPDATE Calificaciones SET U3 = '#{m2C3}' WHERE (Nombre_materia = '#{materia2}') AND (NoControl = '#{numeroControl})');"

                    db.execute "UPDATE Calificaciones SET U1 = '#{m3C1}' WHERE (Nombre_materia = '#{materia3}') AND (NoControl = '#{numeroControl})');"
                    db.execute "UPDATE Calificaciones SET U2 = '#{m3C2}' WHERE (Nombre_materia = '#{materia3}') AND (NoControl = '#{numeroControl})');"
                    db.execute "UPDATE Calificaciones SET U3 = '#{m3C3}' WHERE (Nombre_materia = '#{materia3}') AND (NoControl = '#{numeroControl})');"
                    db.close
                    FXMessageBox.information(app,MBOX_OK, "Exito!", "Datos guardados!")
                    textoNoControl.text = ""
                    textoNombre.text = ""
                    textoM1.text = ""
                    textoM1C1.text = ""
                    textoM1C2.text = ""
                    textoM1C3.text = ""
                    textoM2.text = ""
                    textoM2C1.text = ""
                    textoM2C2.text = ""
                    textoM2C3.text = ""
                    textoM3.text = ""
                    textoM3C1.text = ""
                    textoM3C2.text = ""
                    textoM3C3.text = ""
                rescue SQLite3::Exception => e 
                    puts "Exception occurred"
                    puts e
                    FXMessageBox.error(app,MBOX_OK, "Error", "No se pudo guardar el alumno nuevo")
                ensure
                    db.close if db
                end
            end
        end
        ##################################### ENCERRONA 2 XD (materias) ####################################################################
        groupbox2 = FXGroupBox.new(hframe, "Materias",:opts => GROUPBOX_NORMAL|FRAME_GROOVE|LAYOUT_FILL_X|LAYOUT_FILL_Y)

        ##################################### ENCERRONA 3 XD (botones) ##################################################################
        groupbox3 = FXGroupBox.new(hframe, "Acciones",:opts => GROUPBOX_NORMAL|FRAME_GROOVE|LAYOUT_FILL_X|LAYOUT_FILL_Y)
        
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

