VERSION 5.00
Begin VB.Form frmStart 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   4620
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   7785
   Icon            =   "frmStart.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4620
   ScaleWidth      =   7785
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Timer TimerStart 
      Interval        =   1000
      Left            =   4560
      Top             =   1440
   End
   Begin VB.Label Label2 
      BackColor       =   &H00FFFFFF&
      Caption         =   "作者：王纤阳"
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
      Left            =   210
      TabIndex        =   2
      Top             =   3720
      Width           =   1695
   End
   Begin VB.Image Image2 
      Height          =   720
      Left            =   120
      Picture         =   "frmStart.frx":25CA
      Top             =   1320
      Width           =   720
   End
   Begin VB.Label Label1 
      BackColor       =   &H00FFFFFF&
      Caption         =   "北京师范大学 数字流域实验室"
      BeginProperty Font 
         Name            =   "楷体"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   210
      TabIndex        =   1
      Top             =   720
      Width           =   1695
   End
   Begin VB.Label LabelStart 
      BackColor       =   &H00FFFFFF&
      Caption         =   "BTOPMC自动率定软件"
      BeginProperty Font 
         Name            =   "黑体"
         Size            =   15.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   240
      TabIndex        =   0
      Top             =   240
      Width           =   3135
   End
   Begin VB.Image Image1 
      Height          =   5055
      Left            =   0
      Picture         =   "frmStart.frx":4B94
      Top             =   -360
      Width           =   8985
   End
End
Attribute VB_Name = "frmStart"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
Dim t%
Private Sub Form_Load()

    Me.Show
    TimerStart.Enabled = True
    t = 0
End Sub



Private Sub TimerStart_Timer()
    t = t + 1
    If t > 3 Then
        Load frmMain
        frmMain.Show
        Unload Me
    End If
End Sub





