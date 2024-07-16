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

	Private spinner_edad_dia_reg,spinner_edad_mes_reg,spinner_edad_ano_reg As Spinner
	Private lbl_dia_resultado, lbl_mes_resultado, lbl_año_resultado, lbl_calcular_edad_reg As Label
	Dim dia_actual,mes_actual,ano_actual As Int
	Dim hora_actual As String
	Dim resultAnos,resultMes,resultDias,diasnum,mesnum,anonum,enfoque  As Int
	Private lbl_fecha_reg As Label
	Private editText_reg_Nombres As EditText
	Private editText_reg_Nickname As EditText
	Private editText_reg_password As EditText
	Private editText_reg_confirm_Password As EditText
	Private ProgressBar_Registro As ProgressBar
	Private btn_Siguiente As Button
	Private lbl_dia_reg As Label
	Private lbl_mes_reg As Label
	Private lbl_ano_reg As Label
	Private lbl_edad_reg As Label
	Private lbl_1_estado_reg As Label
	Private btn_Cancelar As Button
	Private Panel_Enfoque As Panel
	Private Panel1_Reg_E1 As Panel
	Private btn_volver_reg As Button
	Private btn_fisica As Button
	Private btn_quimica As Button
	Private lbl_completado_estado_reg As Label

End Sub

Sub Activity_Create(FirstTime As Boolean)
	'Do not forget to load the layout file created with the visual designer. For example:
	Activity.LoadLayout("registro")
	spinner_edad_dia_reg.AddAll(Array As Int (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31))
	spinner_edad_mes_reg.AddAll(Array As String ("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"))
	spinner_edad_ano_reg.AddAll(Array As Int (1970,1971,1972,1973,1974,1975,1976,1977,1978,1979,1980,1981,1982,1983,1984,1985,1986,1987,1988,1989,1990,1991,1992,1993,1994,1995,1996,1997,1998,1999,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017))
	dia_actual=DateTime.GetDayOfMonth(DateTime.Now)
	mes_actual=DateTime.GetMonth(DateTime.Now)
	ano_actual=DateTime.GetYear(DateTime.Now)
	hora_actual=DateTime.Time(DateTime.Now)
	lbl_fecha_reg.Text= dia_actual&"/"&mes_actual&"/"&ano_actual&"-"&hora_actual
	editText_reg_Nickname.Visible=False
	editText_reg_password.Visible=False
	editText_reg_password.Visible=False
	editText_reg_confirm_Password.Visible=False
	lbl_1_estado_reg.Visible=False
	Panel_Enfoque.Visible=False
	btn_fisica.Color=Colors.White
	btn_fisica.TextColor=Colors.Black
	btn_quimica.Color=Colors.White
	btn_quimica.TextColor=Colors.Black
		
	

End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub



Private Sub spinner_edad_dia_reg_ItemClick (Position As Int, Value As Object)
	lbl_dia_resultado.Text=	spinner_edad_dia_reg.SelectedItem
End Sub

Private Sub spinner_edad_mes_reg_ItemClick (Position As Int, Value As Object)
	lbl_mes_resultado.Text=	spinner_edad_mes_reg.SelectedItem
	mesnum=Position
End Sub

Private Sub spinner_edad_ano_reg_ItemClick (Position As Int, Value As Object)
	lbl_año_resultado.Text=	spinner_edad_ano_reg.SelectedItem
	
	If spinner_edad_ano_reg.SelectedItem <> "" And spinner_edad_mes_reg.SelectedItem <>"" And spinner_edad_dia_reg.SelectedItem <>"" And editText_reg_Nombres.Text<>"" And editText_reg_Nickname.Text<>"" And editText_reg_password.Text<>"" And editText_reg_confirm_Password.Text<>"" Then
		
		diasnum=spinner_edad_dia_reg.SelectedItem
		anonum=spinner_edad_ano_reg.SelectedItem
		mesnum=mesnum+1
		resultDias=diasnum-dia_actual
		resultMes=mesnum-mes_actual
		resultAnos=ano_actual-anonum
			
		If resultMes>0 And resultDias > 0 Then
			resultAnos=resultAnos-1
			resultDias=resultDias-1
			resultMes=12-resultMes
			lbl_calcular_edad_reg.TextColor=Colors.Black
			lbl_calcular_edad_reg.Text = "Usted tiene " &resultAnos& " años"&" con "&resultMes& " Meses y "&resultDias&" dias"

			
			Else If resultMes <0 And diasnum > dia_actual Then
				resultMes=(resultMes-(resultMes*2))-1
				resultDias=(30-resultDias)-1
				lbl_calcular_edad_reg.TextColor=Colors.Black
				lbl_calcular_edad_reg.Text = "Usted tiene " &resultAnos& " años"&" con "&resultMes& " Meses y "&resultDias&" dias"

					Else If resultMes>0 And resultDias<0 Then
					resultDias=(resultDias-(resultDias*2))-1
					resultAnos=resultAnos-1
					lbl_calcular_edad_reg.TextColor=Colors.Black
					lbl_calcular_edad_reg.Text = "Usted tiene " &resultAnos& " años"&" con "&resultMes& " Meses y "&resultDias&" dias"
				
						Else If resultMes<0 And resultDias<0 Then
						resultMes=resultMes-(resultMes*2)
						resultDias=(resultDias-(resultDias*2))-1
						lbl_calcular_edad_reg.TextColor=Colors.Black
						lbl_calcular_edad_reg.Text = "Usted tiene " &resultAnos& " años"&" con "&resultMes& " Meses y "&resultDias&" dias"
						
		End If
			ProgressBar_Registro.Progress=83
			
		Else
			ProgressBar_Registro.Progress=-66.4
			spinner_edad_ano_reg.Clear
			spinner_edad_dia_reg.Clear
			spinner_edad_mes_reg.Clear
			
			lbl_calcular_edad_reg.Text="Comience el registro nuevamente - Recuerde comenzar por diligenciar su nombre"
			lbl_calcular_edad_reg.TextColor=Colors.Red
			btn_Siguiente.Enabled=False
			
	End If

End Sub

public Sub evento_barra_iniciado
	
	If ProgressBar_Registro.Progress == 0 Then
		lbl_1_estado_reg.Visible=False
		Else
		lbl_1_estado_reg.Visible=True
	End If
	
End Sub

Private Sub editText_reg_Nombres_TextChanged (Old As String, New As String)
	
	If editText_reg_Nombres.Text <> "" Then
		editText_reg_Nickname.Visible=True
		ProgressBar_Registro.Progress = 16.6
	Else
		editText_reg_Nickname.Visible=False
		editText_reg_password.Visible=False
		editText_reg_confirm_Password.Visible=False
		lbl_1_estado_reg.Visible=False
		ProgressBar_Registro.Progress = -16.6
	End If

evento_barra_iniciado

End Sub

Private Sub editText_reg_Nickname_TextChanged (Old As String, New As String)
	If editText_reg_Nickname.Text <> "" And editText_reg_Nombres.Text <> "" Then
		editText_reg_password.Visible=True
		ProgressBar_Registro.Progress = 33.2
	Else
	editText_reg_password.Visible=False
	editText_reg_confirm_Password.Visible=False
	lbl_1_estado_reg.Visible=False
		ProgressBar_Registro.Progress = -16.6
	End If

End Sub

Private Sub editText_reg_password_TextChanged (Old As String, New As String)
If editText_reg_password.Text <> "" And editText_reg_Nickname.Text <> "" And editText_reg_Nombres.Text <> "" Then 
		editText_reg_confirm_Password.Visible=True
		ProgressBar_Registro.Progress = 49.8
	Else
		editText_reg_confirm_Password.Visible=False
		lbl_1_estado_reg.Visible=False
		ProgressBar_Registro.Progress = -33.2
	End If
End Sub

Private Sub editText_reg_confirm_Password_TextChanged (Old As String, New As String)
	If editText_reg_confirm_Password.Text <> "" And editText_reg_password.Text <> "" And editText_reg_Nickname.Text <> "" And editText_reg_Nombres.Text <> ""  Then
		ProgressBar_Registro.Progress = 66.4
	Else
		lbl_1_estado_reg.Visible=False
		ProgressBar_Registro.Progress = -49.8
	End If
End Sub


Private Sub btn_Siguiente_Click
	If btn_Siguiente.Text == "Siguiente" Then
		If	spinner_edad_ano_reg.SelectedItem > 1 And spinner_edad_mes_reg.SelectedItem <>"" And spinner_edad_dia_reg.SelectedItem >1 And editText_reg_Nombres.Text<>"" And editText_reg_Nickname.Text<>"" And editText_reg_password.Text<>"" And editText_reg_confirm_Password.Text<>"" Then
			Panel_Enfoque.Visible=True
			Panel1_Reg_E1.Visible=False
			btn_volver_reg.Visible=True
			btn_Cancelar.Visible=False
			btn_Siguiente.Text="Finalizar"
		Else
			lbl_calcular_edad_reg.Text =" No es posible continuar. Por favor diligencie todos los campos."
			lbl_calcular_edad_reg.TextColor=Colors.Red
		End If
		
		Else
		StartActivity(fUnidades)
		Activity.Finish
	End If


End Sub

Private Sub btn_Cancelar_Click
	StartActivity(Login)
	Activity.Finish
End Sub

Private Sub btn_volver_reg_Click
	Panel_Enfoque.Visible=False
	Panel1_Reg_E1.Visible=True
	btn_Cancelar.Visible=True
	btn_volver_reg.Visible=False
	btn_Siguiente.Text="Siguiente"
	ProgressBar_Registro.Progress=83
	lbl_completado_estado_reg.TextSize = 14
	lbl_completado_estado_reg.TextColor=Colors.LightGray
	lbl_completado_estado_reg.Left=81%x
End Sub

Private Sub btn_fisica_Click
	enfoque=1
	btn_fisica.Color=Colors.Black
	btn_fisica.TextColor=Colors.White
	btn_quimica.Color=Colors.White
	btn_quimica.TextColor=Colors.Black
	ProgressBar_Registro.Progress=100
	lbl_completado_estado_reg.TextSize = 16
	lbl_completado_estado_reg.TextColor=Colors.Black
	lbl_completado_estado_reg.Left=79%x
End Sub

Private Sub btn_quimica_Click
	enfoque=2
	btn_quimica.Color=Colors.Black
	btn_quimica.TextColor=Colors.White
	btn_fisica.Color=Colors.White
	btn_fisica.TextColor=Colors.Black
	ProgressBar_Registro.Progress=100
	lbl_completado_estado_reg.TextSize = 16
	lbl_completado_estado_reg.TextColor=Colors.Black
	lbl_completado_estado_reg.Left=79%x
End Sub

