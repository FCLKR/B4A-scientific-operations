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

End Sub

Sub Globals
	'These global variables will be redeclared each time the activity is created.
	'These variables can only be accessed from this module.

	Private Panel_Resultados As Panel
	Private Panel_plantilla As Panel
	Private Scroll_plantilla As ScrollView
	Private Scrol_resultados As ScrollView
	Private lbl_titulo As Label
	Private lbl_subtitulo As Label
	Private EditText_digito_1 As EditText
	Private EditText_digito_2 As EditText
	Private Panel_edittext_dig2 As Panel
	Private Panel_spin_dig1 As Panel
	Private Spin_uni_dig1 As Spinner
	Private Spin_uni_dig2 As Spinner
	Dim unidselected As String
	Dim subunidselected As String
	Dim Formulas As String
	Private lbl_Instruccion As Label
	Private Lbl_resultados As Label
	Private lbl_incognita As Label
	Private lbl_valor_1 As Label
	Private lbl_Valor_2 As Label
	Private lbl_prefijo_1 As Label
	Private lbl_prefijo_2 As Label
	Dim Spin_dig1 As String
	Dim Spin_dig2 As String
	Private Lbl_mostrar_spin_dig1 As Label
	Private Lbl_mostrar_spin_dig2 As Label
	Private lbl_Instruccion2 As Label
	Private Panel_spin_dig2 As Panel
	Private Panel_resultado_ecuacion As Panel
	Private Lbl_valor1_res As Label
	Private Lbl_valor2_res As Label
	Private lbl_prefijo1_res As Label
	Private lbl_prefijo2_res As Label
	Private Lbl_instruccion3 As Label
	Private Panel_aconvertir_spin1 As Panel
	Private Panel_aconvertir_spin2 As Panel
	Private Spin_aconvertir_dig2 As Spinner
	Private Spin_aconvertir_dig1 As Spinner
	Private lbl_instruccion3_1 As Label
	Private lbl_instruccion3_2 As Label
	Private Lbl_mostrar_aconvertir_spin1 As Label
	Private Lbl_mostrar_aconvertir_spin2 As Label
	Private lbl_linea_ope As Label
	Private btn_calcular As Button
	Dim Valor1 As Float
	Dim Valor2 As Float
	Private Lbl_resultado_final As Label
	Private btn_punto As Button
	Private Lbl_punto_btn As Label
	Dim Agregarpunto As Int
End Sub

Sub Activity_Create(FirstTime As Boolean)
	'Do not forget to load the layout file created with the visual designer. For example:
	Activity.LoadLayout("Scrol_Main_fFromulas")
	Scroll_plantilla.Panel.LoadLayout("Scroll_paneles_fFormulas_Plantilla")
	Scroll_plantilla.Panel.Height=Panel_plantilla.Height
	Scrol_resultados.Panel.LoadLayout("Scrol_paneles_fFormulas")
	Scrol_resultados.Panel.Height=Panel_Resultados.Height
	Agregarpunto=1
	
	lbl_titulo.Text=fUnidades.gettitulo 'Trae la el nombre de la unidad elegida
	unidselected=lbl_titulo.Text ' se almacena en una variable string para comparacion
		
	lbl_subtitulo.Text=fUnidades.getsubtitulo 'Trae la el sub tema de la unidad elegida
	subunidselected=lbl_subtitulo.Text 'se almacena en una variable string para comparacion
	
	Formulas=fUnidades.formula0 'Trae la el sub tema de la unidad elegida
	

	Select unidselected
		
		Case "Desplazamiento"
			Subunidad_Desplazamiento_selected
	End Select


	


End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub

Sub Subunidad_Desplazamiento_selected

	Select subunidselected
		Case "Calcular velocidad promedio o rapidez"
			Desplazamiento_Formulas_Velocidad_Tiempo
		
	End Select
End Sub

Sub Desplazamiento_Formulas_Velocidad_Tiempo
	
	Select Formulas
		
		Case "Velocidad"
			EditText_digito_1.Hint="Digite el recorrido"
			Spin_uni_dig1.AddAll(Array As String ("mts","Km"))
			Spin_uni_dig2.AddAll(Array As String ("H","min","s"))
			Spin_aconvertir_dig1.AddAll(Array As String ("Km","mts"))
			Spin_aconvertir_dig2.AddAll(Array As String("H","min","s"))
	End Select
	
End Sub

Sub Desplazamiento_velocidad_formula
	Valor1=EditText_digito_1.Text
	Valor2=EditText_digito_2.Text
	
	Select Spin_uni_dig1.SelectedItem
		Case "Km"
			
			Select Spin_aconvertir_dig1.SelectedItem
				Case "mts"
					lbl_mostrar_resultados
					
					'Calculo
					Lbl_valor1_res.Text=Valor1*1000
					lbl_prefijo1_res.Text=Spin_aconvertir_dig1.SelectedItem
					
					Case Else
					Lbl_valor1_res.Text=EditText_digito_1.Text
					lbl_prefijo1_res.Text=Spin_aconvertir_dig1.SelectedItem
			End Select
		
		Case "mts"
			
			Select Spin_aconvertir_dig1.SelectedItem
				Case "Km"
					lbl_mostrar_resultados
					
					'Calculo
					Lbl_valor1_res.Text=Valor1/1000
					lbl_prefijo1_res.Text=Spin_aconvertir_dig1.SelectedItem
					
				Case Else
					Lbl_valor1_res.Text=EditText_digito_1.Text
					lbl_prefijo1_res.Text=Spin_aconvertir_dig1.SelectedItem
			End Select
	End Select
	
	Select Spin_uni_dig2.SelectedItem
		Case "H"
			
			Select Spin_aconvertir_dig2.SelectedItem
				Case "min"
					lbl_mostrar_resultados
					'Calculo
					Lbl_valor2_res.Text=Valor2*60
					lbl_prefijo2_res.Text=Spin_aconvertir_dig2.SelectedItem
				
				Case "s"
					lbl_mostrar_resultados
					'Calculo
					Lbl_valor2_res.Text=Valor2*3600
					lbl_prefijo2_res.Text=Spin_aconvertir_dig2.SelectedItem
					
				Case Else
					Lbl_valor2_res.Text=EditText_digito_2.Text
					lbl_prefijo2_res.Text=Spin_aconvertir_dig2.SelectedItem
			End Select
		
		Case "min"
			
			Select Spin_aconvertir_dig2.SelectedItem
				Case "H"
					lbl_mostrar_resultados
					'Calculo
					Lbl_valor2_res.Text=Valor2/60
					lbl_prefijo2_res.Text=Spin_aconvertir_dig2.SelectedItem
				Case "s"
					lbl_mostrar_resultados
					'Calculo
					Lbl_valor2_res.Text=Valor2*60
					lbl_prefijo2_res.Text=Spin_aconvertir_dig2.SelectedItem
				Case Else
					Lbl_valor2_res.Text=EditText_digito_2.Text
					lbl_prefijo2_res.Text=Spin_aconvertir_dig2.SelectedItem
			End Select
			
		Case "s"
			
			Select Spin_aconvertir_dig2.SelectedItem
				Case "H"
					lbl_mostrar_resultados
					'Calculo
					Lbl_valor2_res.Text=Valor2/3600
					lbl_prefijo2_res.Text=Spin_aconvertir_dig2.SelectedItem
				Case "min"
					lbl_mostrar_resultados
					'Calculo
					Lbl_valor2_res.Text=Valor2/60
					lbl_prefijo2_res.Text=Spin_aconvertir_dig2.SelectedItem
				Case Else
					Lbl_valor2_res.Text=EditText_digito_2.Text
					lbl_prefijo2_res.Text=Spin_aconvertir_dig2.SelectedItem
			End Select
			
	End Select
	
End Sub

Sub lbl_mostrar_resultados
	Lbl_resultado_final.Visible=True
	Lbl_resultado_final.Text="Resultado obtenido"
	Lbl_resultado_final.Typeface=Typeface.DEFAULT_BOLD
	Lbl_resultado_final.TextColor=Colors.Black
	Panel_resultado_ecuacion.Visible=True
End Sub





Private Sub Spin_uni_dig1_ItemClick (Position As Int, Value As Object)
	
	Select Formulas
		Case "Velocidad"
			Spin_dig1 = Spin_uni_dig1.SelectedItem
			Lbl_mostrar_spin_dig1.Text=Spin_dig1
			lbl_prefijo_1.Text=Spin_dig1
	
			Panel_edittext_dig2.Visible=True
			lbl_Instruccion2.Text="Especifique el tiempo"
			EditText_digito_2.Hint="Digite el tiempo"
	End Select

	
	
End Sub

Private Sub Spin_uni_dig2_ItemClick (Position As Int, Value As Object)
	Select Formulas
		Case "Velocidad"
			Spin_dig2 = Spin_uni_dig2.SelectedItem
			Lbl_mostrar_spin_dig2.Text=Spin_dig2
			lbl_prefijo_2.Text=Spin_dig2
			
			lbl_Instruccion2.TextColor =Colors.Black
			lbl_Instruccion2.Typeface=Typeface.DEFAULT_BOLD
			lbl_Instruccion2.Text="Listo para operar"
			
			Lbl_instruccion3.Visible=True
			Lbl_instruccion3.Text="* Seleccione el prefijo de distancia a calcular"
			Lbl_instruccion3.TextColor=Colors.Red
			Lbl_instruccion3.Typeface=Typeface.DEFAULT_BOLD
			lbl_instruccion3_1.Visible=True
			lbl_instruccion3_1.Text="-> nuevo prefijo distancia"
			
			Panel_aconvertir_spin1.Visible=True
			
			Spin_aconvertir_dig1.Visible=True
	End Select
End Sub

Private Sub EditText_digito_1_TextChanged (Old As String, New As String)
	Agregarpunto=1
	Select Formulas
		Case "Velocidad"
			If EditText_digito_1.Text <>"" Then
				'Visbilidad de item por item
				Panel_spin_dig1.Visible=True
				Lbl_resultados.Visible=True
				Panel_Resultados.Visible=True
				Spin_uni_dig1.Visible=True
		
				'Intrucciones LbL
				lbl_Instruccion2.TextColor=Colors.Red
				lbl_Instruccion2.Text="Especifique el prefijo"
		
				'Seccion del panel resultados (ecuacion)
				lbl_prefijo_1.Text=Spin_dig1
				lbl_valor_1.Text=EditText_digito_1.Text
				lbl_Valor_2.Text=EditText_digito_2.Text
				Lbl_punto_btn.Visible=True
				btn_punto.Visible=True
				btn_calcular.Visible=False
				lbl_Instruccion.Text="Complete la formula (Deslice hacia arriba o abajo para ver mas)"
			Else
				Panel_spin_dig1.Visible=False
				Lbl_resultados.Visible=False
				Panel_Resultados.Visible=False
				Spin_uni_dig1.Visible=False
				Panel_edittext_dig2.Visible=False
				Panel_spin_dig2.Visible=False
				lbl_Instruccion2.TextColor=Colors.Red
				lbl_Instruccion2.Text="Especifique el recorrido"
				Lbl_instruccion3.Visible=False
				Panel_aconvertir_spin1.Visible=False
				Panel_aconvertir_spin2.Visible=False
				lbl_linea_ope.Visible=False
				Spin_aconvertir_dig1.Visible=False
				Spin_aconvertir_dig2.Visible=False
				Spin_uni_dig2.Visible=False
				lbl_instruccion3_1.Visible=False
				lbl_instruccion3_2.Visible=False
				lbl_Instruccion.Visible=True
				btn_calcular.Visible=False
				lbl_Instruccion.Text="Complete la formula (Deslice hacia arriba o abajo para ver mas)"
				Lbl_punto_btn.Visible=False
				btn_punto.Visible=False
			End If
	End Select
	
		
	
	
	
End Sub

Private Sub EditText_digito_2_TextChanged (Old As String, New As String)
	Agregarpunto=2
	Select Formulas
		Case "Velocidad"
			If EditText_digito_2.Text <>"" Then
				Panel_spin_dig2.Visible=True
				Spin_uni_dig2.Visible=True
				lbl_Instruccion2.TextColor=Colors.Red
				lbl_Instruccion2.Text="Especifique el prefijo del tiempo (H:Hora | min: Minutos | s: Segundos)"
				lbl_Valor_2.Text=EditText_digito_2.Text
				Lbl_punto_btn.Visible=True
				btn_punto.Visible=True
				btn_calcular.Visible=False
				lbl_Instruccion.Text="Complete la formula (Deslice hacia arriba o abajo para ver mas)"
				Else
					Panel_spin_dig2.Visible=False
					Spin_uni_dig2.Visible=False
					lbl_Instruccion2.Text="Especifique el tiempo"
				Lbl_instruccion3.Visible=False
				Panel_aconvertir_spin1.Visible=False
				Panel_aconvertir_spin2.Visible=False
				lbl_linea_ope.Visible=False
				Spin_aconvertir_dig1.Visible=False
				Spin_aconvertir_dig2.Visible=False
				Spin_uni_dig2.Visible=False
				lbl_instruccion3_1.Visible=False
				lbl_instruccion3_2.Visible=False
				lbl_Instruccion.Visible=True
				btn_calcular.Visible=False
				lbl_Instruccion.Text="Complete la formula (Deslice hacia arriba o abajo para ver mas)"
				Lbl_punto_btn.Visible=False
				btn_punto.Visible=False
			End If
	End Select
End Sub

Private Sub Spin_aconvertir_dig2_ItemClick (Position As Int, Value As Object)
	Select Formulas
		Case "Velocidad"
			Lbl_mostrar_aconvertir_spin2.Text=Spin_aconvertir_dig2.SelectedItem
			lbl_instruccion3_2.Visible=False
			Lbl_instruccion3.Text="* Presione el boton Calcular"
			Lbl_instruccion3.TextColor=Colors.ARGB(255,22,40,24)
			Lbl_instruccion3.Typeface=Typeface.DEFAULT_BOLD
			lbl_Instruccion.Visible=False
			Lbl_punto_btn.Visible=False
			btn_punto.Visible=False
			btn_calcular.Visible=True
			lbl_Instruccion.Visible=True
			lbl_Instruccion.Text="* Oculte el teclado para ver el resultado"
	End Select
End Sub

Private Sub Spin_aconvertir_dig1_ItemClick (Position As Int, Value As Object)
	Select Formulas
		Case "Velocidad"
			Lbl_mostrar_aconvertir_spin1.Text=Spin_aconvertir_dig1.SelectedItem		
			Lbl_instruccion3.Text="* Seleccione el prefijo para tiempo"
			lbl_linea_ope.Visible=True
			Panel_aconvertir_spin2.Visible=True
				
			Spin_aconvertir_dig2.Visible=True
			lbl_instruccion3_2.Text="-> nuevo prefijo para tiempo"
			lbl_instruccion3_2.Visible=True
			lbl_instruccion3_1.Visible=False			
	End Select
End Sub

Private Sub btn_calcular_Click
	Select Formulas
		Case "Velocidad"
			Desplazamiento_velocidad_formula
	End Select
End Sub

Private Sub btn_punto_Click
	Select Agregarpunto
		Case 1
			EditText_digito_1.Text=EditText_digito_1.Text & "."
		Case 2
			EditText_digito_2.Text=EditText_digito_2.Text & "."
			
	End Select
End Sub