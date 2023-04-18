require 'active_record'

ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3',
    database: 'ProyRuby.db'
)
  
require 'fox16'  
include Fox 

require_relative 'Maestros'
require_relative 'MateriasVistaMaestros'
require_relative 'Alumnos'

class Menu < FXMainWindow
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
            subjects()
        end

        b3 = FXButton.new(hFrame3, "ALUMNOS")
        b3.connect(SEL_COMMAND) do
            students()
        end

        b4 = FXButton.new(hFrame3, "CERRAR")
        b4.connect(SEL_COMMAND) do
            close()
        end
    end

    def teacher
        ventana=Maestros.new(@app)
        ventana.create
        ventana.show(PLACEMENT_SCREEN)
    end

    def subjects
        ventana=Materias.new(@app)
        ventana.create
        ventana.show(PLACEMENT_SCREEN)
    end

    def students
        ventana=Alumnos.new(@app)
        ventana.create
        ventana.show(PLACEMENT_SCREEN)
    end

    def create
        super
        show(PLACEMENT_SCREEN)
    end 

    def on_close
        getApp().exit(0)
  end


end 

