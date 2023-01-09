VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "richtx32.ocx"
Object = "{86300752-BAB5-4008-BE7D-1ADDDC8924B4}#7.0#0"; "TabSwitch.ocx"
Begin VB.Form frmAdvance 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "高级选项设置"
   ClientHeight    =   4785
   ClientLeft      =   45
   ClientTop       =   390
   ClientWidth     =   7065
   BeginProperty Font 
      Name            =   "楷体"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmAdvance.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4785
   ScaleWidth      =   7065
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame FrameLoad 
      Caption         =   "存档"
      BeginProperty Font 
         Name            =   "楷体"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   60
      TabIndex        =   18
      Top             =   3240
      Width           =   6960
      Begin VB.CommandButton CommandLoad 
         DisabledPicture =   "frmAdvance.frx":6988A
         Enabled         =   0   'False
         Height          =   375
         Left            =   6000
         Picture         =   "frmAdvance.frx":69DBC
         Style           =   1  'Graphical
         TabIndex        =   22
         Top             =   360
         Width           =   735
      End
      Begin VB.TextBox TextLoad 
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   3720
         TabIndex        =   21
         Text            =   "GbestPosition.npy"
         Top             =   390
         Width           =   2200
      End
      Begin TabSwitch.SafeSwitch SwitchLoad 
         Height          =   345
         Left            =   1800
         TabIndex        =   20
         Top             =   390
         Width           =   1170
         _ExtentX        =   2064
         _ExtentY        =   609
         value           =   0   'False
      End
      Begin VB.Label LabelLoad 
         Caption         =   "加载存档："
         BeginProperty Font 
            Name            =   "楷体"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   240
         TabIndex        =   19
         Top             =   390
         Width           =   1695
      End
   End
   Begin VB.CommandButton CmdCancel 
      Caption         =   "取消"
      BeginProperty Font 
         Name            =   "楷体"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Left            =   3840
      TabIndex        =   17
      Top             =   4300
      Width           =   1455
   End
   Begin VB.CommandButton CmdSave 
      Caption         =   "保存设置"
      BeginProperty Font 
         Name            =   "楷体"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Left            =   1800
      TabIndex        =   16
      Top             =   4300
      Width           =   1455
   End
   Begin VB.Frame FrameMultiStation 
      Caption         =   "多站点率定"
      BeginProperty Font 
         Name            =   "楷体"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2055
      Left            =   60
      TabIndex        =   6
      Top             =   1080
      Width           =   6960
      Begin TabSwitch.SafeSwitch MultiSwitch 
         Height          =   345
         Left            =   1800
         TabIndex        =   8
         Top             =   480
         Width           =   1170
         _ExtentX        =   2064
         _ExtentY        =   609
      End
      Begin RichTextLib.RichTextBox TextBoxNum 
         Height          =   855
         Left            =   1800
         TabIndex        =   10
         Top             =   960
         Width           =   1575
         _ExtentX        =   2778
         _ExtentY        =   1508
         _Version        =   393217
         Enabled         =   -1  'True
         ScrollBars      =   3
         TextRTF         =   $"frmAdvance.frx":6A2EE
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Times New Roman"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin RichTextLib.RichTextBox TextBoxWeight 
         Height          =   855
         Left            =   5280
         TabIndex        =   12
         Top             =   960
         Width           =   1575
         _ExtentX        =   2778
         _ExtentY        =   1508
         _Version        =   393217
         Enabled         =   -1  'True
         ScrollBars      =   3
         TextRTF         =   $"frmAdvance.frx":6A37B
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Times New Roman"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin TabSwitch.SafeSwitch WeightSwitch 
         Height          =   345
         Left            =   5280
         TabIndex        =   13
         Top             =   480
         Width           =   1170
         _ExtentX        =   2064
         _ExtentY        =   609
      End
      Begin VB.Label LabelWei 
         Caption         =   "加权平均："
         BeginProperty Font 
            Name            =   "楷体"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   3720
         TabIndex        =   15
         Top             =   480
         Width           =   1335
      End
      Begin VB.Label LabelMulti 
         Caption         =   "多站率定："
         BeginProperty Font 
            Name            =   "楷体"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   240
         TabIndex        =   14
         Top             =   480
         Width           =   1695
      End
      Begin VB.Label LabelWeight 
         Caption         =   "站点权重："
         BeginProperty Font 
            Name            =   "楷体"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   3720
         TabIndex        =   11
         Top             =   960
         Width           =   1335
      End
      Begin VB.Label LabelStationName 
         Caption         =   "站点编号："
         BeginProperty Font 
            Name            =   "楷体"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   240
         TabIndex        =   9
         Top             =   960
         Width           =   1695
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "初始化混沌映射"
      BeginProperty Font 
         Name            =   "楷体"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   3575
      TabIndex        =   1
      Top             =   0
      Width           =   3450
      Begin VB.Label LabelChaos 
         Caption         =   "预计v2.0开放，敬请期待！"
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "楷体"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   240
         TabIndex        =   2
         Top             =   405
         Width           =   2955
      End
   End
   Begin VB.Frame framePre 
      Caption         =   "预热选项"
      BeginProperty Font 
         Name            =   "楷体"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   60
      TabIndex        =   0
      Top             =   0
      Width           =   3450
      Begin VB.CommandButton CommandPreAdd 
         Caption         =   "+"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   14.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   2760
         TabIndex        =   5
         Top             =   360
         Width           =   375
      End
      Begin VB.CommandButton CommandPreMinus 
         Caption         =   "-"
         BeginProperty Font 
            Name            =   "Cambria Math"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   1800
         TabIndex        =   4
         Top             =   360
         Width           =   375
      End
      Begin VB.TextBox TextPreheating 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   2160
         TabIndex        =   3
         Text            =   "0"
         Top             =   360
         Width           =   615
      End
      Begin VB.Label LabelPreHeating 
         Caption         =   "模型预热期："
         BeginProperty Font 
            Name            =   "楷体"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   240
         TabIndex        =   7
         Top             =   405
         Width           =   1575
      End
   End
   Begin MSComDlg.CommonDialog CommonDialog2 
      Left            =   0
      Top             =   0
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
End
Attribute VB_Name = "frmAdvance"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub CmdCancel_Click()
    Unload frmAdvance
End Sub

Private Sub CmdSave_Click()

    WritePrivateProfileString "Advance", "preheating", TextPreheating.Text, App.path & "\settings.ini"
    If MultiSwitch.value = True Then
        WritePrivateProfileString "Advance", "multistations", "1", App.path & "\settings.ini"
    Else
        WritePrivateProfileString "Advance", "multistations", "0", App.path & "\settings.ini"
    End If
    If WeightSwitch.value = True Then
        WritePrivateProfileString "Advance", "weighting", "1", App.path & "\settings.ini"
    Else
        WritePrivateProfileString "Advance", "weighting", "0", App.path & "\settings.ini"
    End If
    If SwitchLoad.value = True Then
        WritePrivateProfileString "Advance", "load result", "1", App.path & "\settings.ini"
    Else
        WritePrivateProfileString "Advance", "load result", "0", App.path & "\settings.ini"
    End If
    WritePrivateProfileString "Advance", "stations", TextBoxNum.Text, App.path & "\settings.ini"
    WritePrivateProfileString "Advance", "weighting factors", TextBoxWeight.Text, App.path & "\settings.ini"
    WritePrivateProfileString "Advance", "gbestposition", TextLoad.Text, App.path & "\settings.ini"
    Unload frmAdvance
End Sub


Private Sub CommandLoad_Click()
    Dim loadpath As String
    CommonDialog2.ShowOpen
    loadpath = CommonDialog2.FileName
    If loadpath <> "" Then
        TextLoad.Text = loadpath
    End If
End Sub

Private Sub CommandPreAdd_Click()
    Dim n_preheating As Integer
    n_preheating = Val(TextPreheating.Text) + 1
    TextPreheating.Text = n_preheating
End Sub

Private Sub CommandPreMinus_Click()
    Dim n_preheating As Integer
    If Val(TextPreheating.Text) > 1 Then
        n_preheating = Val(TextPreheating.Text) - 1
        TextPreheating.Text = n_preheating
    End If
End Sub

Public Sub Form_Load()
    Dim stations As String
    Dim weights As String
    Dim load As String
    Dim station_switch As Integer
    Dim weight_switch As Integer
    Dim load_switch As Integer
    
    station_switch = GetPrivateProfileInt("Advance", "multistations", 0, App.path & "\settings.ini")
    weight_switch = GetPrivateProfileInt("Advance", "weighting", 0, App.path & "\settings.ini")
    load_switch = GetPrivateProfileInt("Advance", "load result", 0, App.path & "\settings.ini")
    
    
    If station_switch = 0 Then
        MultiSwitch.value = False
        WeightSwitch.value = False
        WeightSwitch.Enable = False
        TextBoxNum.Enabled = False
        TextBoxWeight.Enabled = False
    Else
        MultiSwitch.value = True
        If weight_switch = 0 Then
            WeightSwitch.value = False
            TextBoxWeight.Enabled = False
        Else
            WeightSwitch.value = True
            TextBoxWeight.Enabled = True
        End If
    End If
    
    If load_switch = 0 Then
        TextLoad.Enabled = False
        CommandLoad.Enabled = False
    Else:
        SwitchLoad.value = True
        TextLoad.Enabled = True
        CommandLoad.Enabled = True
    End If
    
    
    stations = Space(500)
    weights = Space(500)
    load = Space(200)
    TextPreheating.Text = GetPrivateProfileInt("Advance", "preheating", 0, App.path & "\settings.ini")
    
    GetPrivateProfileString "Advance", "stations", "Please enter.", stations, 500, App.path & "\settings.ini"
    TextBoxNum.Text = stations
    
    GetPrivateProfileString "Advance", "weighting factors", "Please enter.", weights, 500, App.path & "\settings.ini"
    TextBoxWeight.Text = weights
    
    GetPrivateProfileString "Advance", "gbestposition", "Please enter.", load, 200, App.path & "\settings.ini"
    TextLoad.Text = load
    
    
End Sub

Private Sub MultiSwitch_Click(value As Boolean)
    If MultiSwitch.value = True Then
        WeightSwitch.Enable = True
        TextBoxNum.Enabled = True
    Else
        WeightSwitch.value = False
        WeightSwitch.Enable = False
        TextBoxNum.Enabled = False
        TextBoxWeight.Enabled = False
    End If
End Sub

Private Sub SwitchLoad_Click(value As Boolean)
    If SwitchLoad.value = True Then
        TextLoad.Enabled = True
        CommandLoad.Enabled = True
    Else
        TextLoad.Enabled = False
        CommandLoad.Enabled = False
    End If
End Sub

Private Sub WeightSwitch_Click(value As Boolean)
    If WeightSwitch.value = True Then
        TextBoxWeight.Enabled = True
    Else
        TextBoxWeight.Enabled = False
    End If
End Sub
