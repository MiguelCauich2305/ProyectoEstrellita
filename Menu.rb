require 'active_record'

ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3',
    database: 'ProyRuby.db'
)
  
require 'fox16'  
include Fox 

require_relative 'Maestros'

class Ventana < FXMainWindow
    def initialize(app)
        @app=app
        print "ESTE ES EL MENU DEL "
        super(app, "MENÚ", :width=>400, :height=>300)
        hFrame3 = FXHorizontalFrame.new(self)

        b1 = FXButton.new(hFrame3, "MAESTROS")
        b1.connect(SEL_COMMAND) do
            teacher()
        end

        b2 = FXButton.new(hFrame3, "MATERIAS")
        b2.connect(SEL_COMMAND) do
            subjects(nombre.text, mat1.text, mat2.text, mat3.text)
        end

        b3 = FXButton.new(hFrame3, "ALUMNOS")
        b3.connect(SEL_COMMAND) do
            students(nombre.text, mat1.text, mat2.text, mat3.text)
        end

        b4 = FXButton.new(hFrame3, "CERRAR")
        b4.connect(SEL_COMMAND) do
            close(nombre.text, mat1.text, mat2.text, mat3.text)
        end
    end

    def teacher
        ventana=Maestros.new(@app)
        ventana.create
        ventana.show(PLACEMENT_SCREEN)
    end

    def subjects
        ventana=.new(@app)
        ventana.create
        ventana.show(PLACEMENT_SCREEN)
    end

    def students
        ventana=.new(@app)
        ventana.create
        ventana.show(PLACEMENT_SCREEN)
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