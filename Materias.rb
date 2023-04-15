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
        ##################################### ENCERRONA 2 XD (materias) ####################################################################

        groupbox2 = FXGroupBox.new(hframe, "Materias",:opts => GROUPBOX_NORMAL|FRAME_GROOVE|LAYOUT_FILL_X|LAYOUT_FILL_Y)
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

