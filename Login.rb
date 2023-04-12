


require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'test.db'
)



require 'fox16'  


include Fox 

class Ventana < FXMainWindow

    def initialize(app)
        super(app, "Log in", :width=>300, :height=>300)
        
        hFrame1 = FXHorizontalFrame.new(self)
        chrLabel = FXLabel.new(hFrame1, "Nombre:")
        chrTextField1 = FXTextField.new(hFrame1, 15)
        
        hFrame2 = FXHorizontalFrame.new(self)
        chrLabel = FXLabel.new(hFrame2, "Contraseña:")
        chrTextField2 = FXTextField.new(hFrame2, 10)


        #vFrame1 = FXVerticalFrame.new(self, :opts => LAYOUT_FILL)
        #textArea = FXText.new(vFrame1, :opts => LAYOUT_FILL | TEXT_READONLY | TEXT_WORDWRAP)
        hFrame3 = FXHorizontalFrame.new(self)
        
        b1 = FXButton.new(hFrame3, "Entrar")
        b1.connect(SEL_COMMAND) do
            Entrar(chrTextField1.text, chrTextField2.text)
        end
        

        b2= FXButton.new(hFrame3, "Cancelar")
        b2.connect(SEL_COMMAND) do
            on_close()
          end
       
        
        
    end

    def Entrar(name, pass)
        puts name , pass


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