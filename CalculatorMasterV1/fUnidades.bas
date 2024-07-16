B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Activity
Version=12.5
@EndOfDesignText@
#Region  Activity Attributes 
	#FullScreen: False
	#IncludeTitle: False
#End Region

Sub Process_Globals
	'These global variables will be declared once when the application starts.
	'These variables can be accessed from all modules.
	Dim gettitulo As String
	Dim getsubtitulo As String
	Dim formula0 As String
End Sub

Sub Globals
	'These global variables will be redeclared each time the activity is created.
	'These variables can only be accessed from this module.

	'Private Scroll_panel_subtemas_fUnidad As ScrollView
	Private ListView_Unidades_fisica As ListView
	Private ListView_subtemas_fisica As ListView
	Private lbl_eliga_subtema As Label
	Dim eleccion As Byte
	Dim eleccion_sub As Byte
	Dim eleccion_Form As Byte
	
	
	Private ListView_Panel_Confirm As ListView
	Private Panel_Confirm_Formula_Fisica As Panel
	Private btn_regresar_list_confirmar As Button
	Private Panel_head_fUnidad As Panel
	Private lbl_comenza_elegir As Label
	Private lbl_eliga_unidad_fisica As Label
	
End Sub

Sub Activity_Create(FirstTime As Boolean)
	'Do not forget to load the layout file created with the visual designer. For example:
	Activity.LoadLayout("Scrol_Main_fUnid__1")
	lbl_eliga_subtema.Visible=False
	
	'Diseño listas unidades fisica
	ListView_Unidades_fisica.SingleLineLayout.Label.TextColor=Colors.Black
	
	'Diseño listas subtemas fisica
	ListView_subtemas_fisica.SingleLineLayout.Label.TextColor=Colors.Red
	
	'Ingreso de las unidades disponibles en fisica
	ListView_Unidades_fisica.AddSingleLine(" * Movimiento en una dimensión")
	ListView_Unidades_fisica.AddSingleLine(" * Movimiento en dos dimensiones")
	ListView_Unidades_fisica.AddSingleLine(" * Fuerzas y leyes del movimiento de Newton")
	ListView_Unidades_fisica.AddSingleLine(" * Fuerza centrípeta y gravitación")
	ListView_Unidades_fisica.AddSingleLine(" * Trabajo y energía")
	ListView_Unidades_fisica.AddSingleLine(" * Impacto y momento lineal")
	ListView_Unidades_fisica.AddSingleLine(" * Torca y momento angular")
	ListView_Unidades_fisica.AddSingleLine(" * Oscilaciones y ondas mecánicas")
	ListView_Unidades_fisica.AddSingleLine(" * Fluidos")
	ListView_Unidades_fisica.AddSingleLine(" * Termodinámica")
	ListView_Unidades_fisica.AddSingleLine(" * Carga, campo y potencial eléctricos")
	ListView_Unidades_fisica.AddSingleLine(" * Circuitos")
	ListView_Unidades_fisica.AddTwoLines(" * Fuerzas y campos magnéticos."," Ley de Faraday")
	ListView_Unidades_fisica.AddSingleLine(" * Ondas electromagnéticas e interferencia")
	ListView_Unidades_fisica.AddSingleLine(" * Relatividad especial")
	ListView_Unidades_fisica.AddSingleLine(" * Física cuántica")
	ListView_Unidades_fisica.AddSingleLine(" * Descubrimientos y proyectos")
	

	
	'Diseño unidad doble linea
	ListView_Unidades_fisica.TwolinesLayout.Label.TextColor=Colors.Black
	ListView_Unidades_fisica.twolinesLayout.Label.TextSize=23
	
	'Diseño de Subtemas una linea
	ListView_subtemas_fisica.singleLineLayout.ItemHeight=50dip 'Cambia el tamaño de la division
	ListView_subtemas_fisica.singlelineLayout.Label.TextColor=Colors.Black

	'ListView_subtemas_fisica.TwoLinesLayout.Label.Color=Colors.Cyan 'Color del campo donde esta el texto 1
	ListView_subtemas_fisica.singlelineLayout.Label.TextSize=25
	ListView_subtemas_fisica.singlelineLayout.Label.Text = Typeface.STYLE_BOLD_ITALIC
	ListView_subtemas_fisica.singlelineLayout.Label.TextColor=Colors.black
	
	'Diseño de subtemas dos lineas
	ListView_subtemas_fisica.TwoLinesLayout.ItemHeight=50dip 'Cambia el tamaño de la division
	ListView_subtemas_fisica.TwoLinesLayout.Label.TextColor=Colors.Black
	'ListView_subtemas_fisica.TwoLinesLayout.Label.Color=Colors.Cyan 'Color del campo donde esta el texto 1
	ListView_subtemas_fisica.TwoLinesLayout.Label.TextSize=25
	ListView_subtemas_fisica.TwoLinesLayout.secondLabel.Text = Typeface.STYLE_BOLD_ITALIC
	ListView_subtemas_fisica.TwoLinesLayout.SecondLabel.TextColor=Colors.black
	
	'Diseño Lista confirmar formula desde el panel 
	ListView_Panel_Confirm.singleLineLayout.ItemHeight=50dip 'Cambia el tamaño de la division
	ListView_Panel_Confirm.singlelineLayout.Label.TextColor=Colors.Black
	


End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub

Sub Choose_Unidad
	ListView_subtemas_fisica.Visible=True
	lbl_eliga_subtema.Visible=True
	'Scroll_panel_subtemas_fUnidad.Visible=True
	
	Select eleccion
		
		Case 0
			ListView_subtemas_fisica.Clear
			ListView_subtemas_fisica.addtwoLines ("-> Desplazamiento, velocidad y tiempo","Calcular la velocidad promedio y rapidez | Rapidez y velocidad instantáneas")
			ListView_subtemas_fisica.AddSingleLine("-> Aceleración")
		Case 1
			ListView_subtemas_fisica.Clear
			ListView_subtemas_fisica.AddSingleLine(eleccion)
		Case 2
			ListView_subtemas_fisica.Clear
			ListView_subtemas_fisica.AddSingleLine(eleccion)
		
	End Select
	
End Sub

Private Sub ListView_Unidades_fisica_ItemClick (Position As Int, Value As Object)
	eleccion=Position
	Choose_Unidad
	
	
End Sub

Public Sub Choose_SUBUnidad
	
	Select eleccion_sub
		
		Case 0
			ListView_Panel_Confirm.Clear
			ListView_Panel_Confirm.AddSingleLine("Velocidad o rapidez")
			ListView_Panel_Confirm.AddSingleLine("Tiempo")
			Panel_Confirm_Formula_Fisica.Height=20%y
			ListView_subtemas_fisica.Visible=False
			ListView_Unidades_fisica.Visible=False
			Panel_Confirm_Formula_Fisica.Visible=True
			lbl_eliga_subtema.Visible=False
			btn_regresar_list_confirmar.Visible=True
			lbl_comenza_elegir.Visible=False
			lbl_eliga_unidad_fisica.Visible=False
			Panel_head_fUnidad.Visible=False
			gettitulo="Desplazamiento"
			
		Case 1
			ListView_subtemas_fisica.Clear
			ListView_subtemas_fisica.AddSingleLine(eleccion)
		Case 2
			ListView_subtemas_fisica.Clear
			ListView_subtemas_fisica.AddSingleLine(eleccion)
		
	End Select
	
End Sub

Private Sub ListView_subtemas_fisica_ItemClick (Position As Int, Value As Object)
	eleccion_sub=Position
	Choose_SUBUnidad
End Sub





Private Sub ListView_Panel_Confirm_ItemClick (Position As Int, Value As Object)
	eleccion_Form=Position
	Choose_Formulado
End Sub

Private Sub btn_regresar_list_confirmar_Click
	ListView_subtemas_fisica.Visible=True
	ListView_Unidades_fisica.Visible=True
	Panel_Confirm_Formula_Fisica.Visible=False
	lbl_eliga_subtema.Visible=True
	btn_regresar_list_confirmar.Visible=False
	lbl_comenza_elegir.Visible=True
	lbl_eliga_unidad_fisica.Visible=True
	Panel_head_fUnidad.Visible=True
	
End Sub

Sub Choose_Formulado
	
	Select eleccion_Form
		
		Case 0
			getsubtitulo="Calcular velocidad promedio o rapidez"
			formula0="Velocidad"
			StartActivity(fFormulas)
			
		Case 1
			ListView_subtemas_fisica.Clear
			ListView_subtemas_fisica.AddSingleLine(eleccion)
		Case 2
			ListView_subtemas_fisica.Clear
			ListView_subtemas_fisica.AddSingleLine(eleccion)
		
	End Select
	
End Sub