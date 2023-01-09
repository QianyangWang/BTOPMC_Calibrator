VERSION 5.00
Object = "{75634CE7-D088-4C44-8F7C-3C117CE5857B}#8.0#0"; "olch2xu8.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "richtx32.ocx"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "tabctl32.ocx"
Object = "{86300752-BAB5-4008-BE7D-1ADDDC8924B4}#7.0#0"; "TabSwitch.ocx"
Begin VB.Form frmMain 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "BTOPMC模型参数率定软件 v1.2.2 多进程版"
   ClientHeight    =   7305
   ClientLeft      =   45
   ClientTop       =   390
   ClientWidth     =   12735
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   ScaleHeight     =   7305
   ScaleWidth      =   12735
   StartUpPosition =   2  'CenterScreen
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   10200
      Top             =   0
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Frame Frame10 
      Caption         =   "BTOPMC主程序"
      BeginProperty Font 
         Name            =   "楷体"
         Size            =   15
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   7440
      TabIndex        =   75
      Top             =   1010
      Width           =   5175
      Begin VB.TextBox TextModel 
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
         Left            =   120
         TabIndex        =   77
         Text            =   "Text1"
         Top             =   360
         Width           =   4095
      End
      Begin VB.CommandButton CommandModel 
         DisabledPicture =   "Form1.frx":6988A
         Height          =   375
         Left            =   4320
         Picture         =   "Form1.frx":69DBC
         Style           =   1  'Graphical
         TabIndex        =   76
         Top             =   360
         Width           =   735
      End
   End
   Begin VB.Timer Timer2 
      Interval        =   500
      Left            =   3720
      Top             =   6360
   End
   Begin VB.Timer Timer1 
      Interval        =   5000
      Left            =   6000
      Top             =   6360
   End
   Begin MSComctlLib.ProgressBar ProgressBar1 
      Height          =   315
      Left            =   4185
      TabIndex        =   69
      Top             =   6880
      Width           =   8385
      _ExtentX        =   14790
      _ExtentY        =   556
      _Version        =   393216
      Appearance      =   0
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Height          =   375
      Left            =   120
      TabIndex        =   68
      Top             =   6840
      Width           =   12510
      _ExtentX        =   22066
      _ExtentY        =   661
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   3
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   6
            Object.Width           =   3528
            MinWidth        =   3528
            TextSave        =   "2022/1/20"
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   5
            Object.Width           =   3528
            MinWidth        =   3528
            TextSave        =   "9:43"
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   1
            Object.Width           =   14923
         EndProperty
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Times New Roman"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.Frame Frame4 
      Caption         =   "工程文件夹路径"
      BeginProperty Font 
         Name            =   "楷体"
         Size            =   15
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   7440
      TabIndex        =   20
      Top             =   120
      Width           =   5175
      Begin VB.CommandButton Command1 
         DisabledPicture =   "Form1.frx":6A2EE
         Height          =   375
         Left            =   4320
         Picture         =   "Form1.frx":6A820
         Style           =   1  'Graphical
         TabIndex        =   22
         Top             =   360
         Width           =   735
      End
      Begin VB.TextBox TextPath 
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
         Left            =   120
         TabIndex        =   21
         Text            =   "Text1"
         Top             =   360
         Width           =   4095
      End
   End
   Begin VB.Frame Frame3 
      Caption         =   "控制区"
      BeginProperty Font 
         Name            =   "楷体"
         Size            =   15
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   7440
      TabIndex        =   19
      Top             =   1920
      Width           =   5175
      Begin VB.CommandButton CommandStop 
         BackColor       =   &H008080FF&
         Caption         =   "停止"
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
         Left            =   4080
         MaskColor       =   &H008080FF&
         Style           =   1  'Graphical
         TabIndex        =   24
         Top             =   360
         Width           =   975
      End
      Begin VB.CommandButton CommandStart 
         BackColor       =   &H00C0FFC0&
         Caption         =   "开始"
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
         Left            =   2880
         MaskColor       =   &H00C0FFC0&
         Style           =   1  'Graphical
         TabIndex        =   23
         Top             =   360
         Width           =   975
      End
      Begin VB.Label Label6 
         Caption         =   ":"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   1080
         TabIndex        =   74
         Top             =   440
         Width           =   135
      End
      Begin VB.Label LabelTime 
         Caption         =   "-h-m-s"
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
         Left            =   1320
         TabIndex        =   26
         Top             =   440
         Width           =   1935
      End
      Begin VB.Label Label5 
         Caption         =   "剩余时间"
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
         Left            =   120
         TabIndex        =   25
         Top             =   440
         Width           =   1935
      End
   End
   Begin VB.Frame FramePlot 
      Caption         =   "算法优化状态"
      BeginProperty Font 
         Name            =   "楷体"
         Size            =   15
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3975
      Left            =   7440
      TabIndex        =   16
      Top             =   2785
      Width           =   5175
      Begin TabDlg.SSTab SSTab1 
         Height          =   3495
         Left            =   120
         TabIndex        =   71
         Top             =   360
         Width           =   4935
         _ExtentX        =   8705
         _ExtentY        =   6165
         _Version        =   393216
         Tabs            =   2
         TabsPerRow      =   2
         TabHeight       =   520
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "楷体"
            Size            =   9.75
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         TabCaption(0)   =   "优化适宜度曲线"
         TabPicture(0)   =   "Form1.frx":6AD52
         Tab(0).ControlEnabled=   -1  'True
         Tab(0).Control(0)=   "Chart2D1"
         Tab(0).Control(0).Enabled=   0   'False
         Tab(0).ControlCount=   1
         TabCaption(1)   =   "模拟流量过程线"
         TabPicture(1)   =   "Form1.frx":6AD6E
         Tab(1).ControlEnabled=   0   'False
         Tab(1).Control(0)=   "Chart2D2"
         Tab(1).ControlCount=   1
         Begin C1Chart2D8U.Chart2D Chart2D2 
            Height          =   2655
            Left            =   -74880
            TabIndex        =   72
            Top             =   600
            Width           =   4455
            _Version        =   524288
            _Revision       =   8
            _ExtentX        =   7858
            _ExtentY        =   4683
            _StockProps     =   0
            ControlProperties=   "Form1.frx":6AD8A
         End
         Begin C1Chart2D8U.Chart2D Chart2D1 
            Height          =   2655
            Left            =   120
            TabIndex        =   73
            Top             =   600
            Width           =   4455
            _Version        =   524288
            _Revision       =   8
            _ExtentX        =   7858
            _ExtentY        =   4683
            _StockProps     =   0
            ControlProperties=   "Form1.frx":705C2
         End
      End
   End
   Begin VB.ComboBox ComboT0 
      BeginProperty Font 
         Name            =   "楷体"
         Size            =   11.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   345
      Left            =   5520
      TabIndex        =   14
      Text            =   "Combo1"
      Top             =   1080
      Width           =   1575
   End
   Begin VB.TextBox TextIter 
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
      Left            =   1800
      TabIndex        =   7
      Text            =   "Text1"
      Top             =   2040
      Width           =   1575
   End
   Begin VB.Frame Frame2 
      Caption         =   "参数边界设置"
      BeginProperty Font 
         Name            =   "楷体"
         Size            =   15
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3285
      Left            =   120
      TabIndex        =   1
      Top             =   3485
      Width           =   7215
      Begin VB.Frame Frame7 
         Caption         =   "产汇流模型参数组-2"
         BeginProperty Font 
            Name            =   "楷体"
            Size            =   9.75
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   2775
         Left            =   3720
         TabIndex        =   35
         Top             =   360
         Width           =   3375
         Begin VB.Frame Frame9 
            Caption         =   "Srmax"
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   1095
            Left            =   120
            TabIndex        =   67
            Top             =   1560
            Width           =   3135
            Begin RichTextLib.RichTextBox TextBoxSrm 
               Height          =   735
               Left            =   120
               TabIndex        =   70
               Top             =   240
               Width           =   2895
               _ExtentX        =   5106
               _ExtentY        =   1296
               _Version        =   393217
               ScrollBars      =   3
               TextRTF         =   $"Form1.frx":7129C
               BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                  Name            =   "Times New Roman"
                  Size            =   9
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
            End
         End
         Begin VB.Frame Frame8 
            Caption         =   "T0"
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   1335
            Left            =   120
            TabIndex        =   54
            Top             =   240
            Width           =   3135
            Begin VB.TextBox TextSiltu 
               BeginProperty Font 
                  Name            =   "Times New Roman"
                  Size            =   9.75
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   350
               Left            =   2160
               TabIndex        =   66
               Text            =   "Text1"
               Top             =   960
               Width           =   855
            End
            Begin VB.TextBox TextSiltl 
               BeginProperty Font 
                  Name            =   "Times New Roman"
                  Size            =   9.75
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   350
               Left            =   960
               TabIndex        =   64
               Text            =   "Text1"
               Top             =   960
               Width           =   855
            End
            Begin VB.TextBox TextClayl 
               BeginProperty Font 
                  Name            =   "Times New Roman"
                  Size            =   9.75
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   350
               Left            =   960
               TabIndex        =   58
               Text            =   "Text1"
               Top             =   240
               Width           =   855
            End
            Begin VB.TextBox TextClayu 
               BeginProperty Font 
                  Name            =   "Times New Roman"
                  Size            =   9.75
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   350
               Left            =   2160
               TabIndex        =   57
               Text            =   "Text1"
               Top             =   240
               Width           =   855
            End
            Begin VB.TextBox TextSandl 
               BeginProperty Font 
                  Name            =   "Times New Roman"
                  Size            =   9.75
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   350
               Left            =   960
               TabIndex        =   56
               Text            =   "Text1"
               Top             =   600
               Width           =   855
            End
            Begin VB.TextBox TextSandu 
               BeginProperty Font 
                  Name            =   "Times New Roman"
                  Size            =   9.75
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   350
               Left            =   2160
               TabIndex        =   55
               Text            =   "Text1"
               Top             =   600
               Width           =   855
            End
            Begin VB.Label Label22 
               Caption         =   "clay:"
               BeginProperty Font 
                  Name            =   "Times New Roman"
                  Size            =   14.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   255
               Left            =   120
               TabIndex        =   62
               Top             =   240
               Width           =   1575
            End
            Begin VB.Label Label24 
               Caption         =   "~"
               BeginProperty Font 
                  Name            =   "Times New Roman"
                  Size            =   9.75
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   255
               Left            =   1920
               TabIndex        =   65
               Top             =   960
               Width           =   135
            End
            Begin VB.Label Label23 
               Caption         =   "silt:"
               BeginProperty Font 
                  Name            =   "Times New Roman"
                  Size            =   14.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   255
               Left            =   120
               TabIndex        =   63
               Top             =   960
               Width           =   1575
            End
            Begin VB.Label Label20 
               Caption         =   "~"
               BeginProperty Font 
                  Name            =   "Times New Roman"
                  Size            =   9.75
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   255
               Left            =   1920
               TabIndex        =   60
               Top             =   240
               Width           =   135
            End
            Begin VB.Label Label19 
               Caption         =   "~"
               BeginProperty Font 
                  Name            =   "Times New Roman"
                  Size            =   9.75
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   255
               Left            =   1920
               TabIndex        =   59
               Top             =   600
               Width           =   135
            End
            Begin VB.Label Label21 
               Caption         =   "sand:"
               BeginProperty Font 
                  Name            =   "Times New Roman"
                  Size            =   14.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   255
               Left            =   120
               TabIndex        =   61
               Top             =   600
               Width           =   1575
            End
         End
      End
      Begin VB.Frame Frame6 
         Caption         =   "产汇流模型参数组-1"
         BeginProperty Font 
            Name            =   "楷体"
            Size            =   9.75
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1700
         Left            =   120
         TabIndex        =   30
         Top             =   1440
         Width           =   3495
         Begin VB.TextBox TextN0u 
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   350
            Left            =   2280
            TabIndex        =   52
            Text            =   "Text1"
            Top             =   1320
            Width           =   1095
         End
         Begin VB.TextBox TextN0l 
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   350
            Left            =   840
            TabIndex        =   51
            Text            =   "Text1"
            Top             =   1320
            Width           =   1095
         End
         Begin VB.TextBox TextSdbaru 
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   350
            Left            =   2280
            TabIndex        =   50
            Text            =   "Text1"
            Top             =   960
            Width           =   1095
         End
         Begin VB.TextBox TextSdbarl 
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   350
            Left            =   840
            TabIndex        =   48
            Text            =   "Text1"
            Top             =   960
            Width           =   1095
         End
         Begin VB.TextBox TextMu 
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   350
            Left            =   2280
            TabIndex        =   46
            Text            =   "Text1"
            Top             =   600
            Width           =   1095
         End
         Begin VB.TextBox TextMl 
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   350
            Left            =   840
            TabIndex        =   45
            Text            =   "Text1"
            Top             =   600
            Width           =   1095
         End
         Begin VB.TextBox TextAlphau 
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   350
            Left            =   2280
            TabIndex        =   43
            Text            =   "Text1"
            Top             =   240
            Width           =   1095
         End
         Begin VB.TextBox TextAlphal 
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   350
            Left            =   840
            TabIndex        =   42
            Text            =   "Text1"
            Top             =   240
            Width           =   1095
         End
         Begin VB.Label Label9 
            Caption         =   "alpha:"
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   14.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   120
            TabIndex        =   31
            Top             =   240
            Width           =   1575
         End
         Begin VB.Label Label18 
            Caption         =   "~"
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   2040
            TabIndex        =   53
            Top             =   1320
            Width           =   135
         End
         Begin VB.Label Label17 
            Caption         =   "~"
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   2040
            TabIndex        =   49
            Top             =   960
            Width           =   135
         End
         Begin VB.Label Label16 
            Caption         =   "~"
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   2040
            TabIndex        =   47
            Top             =   600
            Width           =   135
         End
         Begin VB.Label Label15 
            Caption         =   "~"
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   2040
            TabIndex        =   44
            Top             =   240
            Width           =   135
         End
         Begin VB.Label Label12 
            Caption         =   "n0:"
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   14.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   120
            TabIndex        =   34
            Top             =   1320
            Width           =   1575
         End
         Begin VB.Label Label11 
            Caption         =   "sdbar:"
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   14.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   120
            TabIndex        =   33
            Top             =   960
            Width           =   1575
         End
         Begin VB.Label Label10 
            Caption         =   "m:"
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   14.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   120
            TabIndex        =   32
            Top             =   600
            Width           =   1575
         End
      End
      Begin VB.Frame Frame5 
         Caption         =   "马斯京根法步长参数"
         BeginProperty Font 
            Name            =   "楷体"
            Size            =   9.75
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   980
         Left            =   120
         TabIndex        =   27
         Top             =   360
         Width           =   3495
         Begin VB.TextBox TextDtu 
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   350
            Left            =   2280
            TabIndex        =   39
            Text            =   "Text1"
            Top             =   600
            Width           =   1095
         End
         Begin VB.TextBox TextDtl 
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   350
            Left            =   840
            TabIndex        =   38
            Text            =   "Text1"
            Top             =   600
            Width           =   1095
         End
         Begin VB.TextBox TextDlu 
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   350
            Left            =   2280
            TabIndex        =   37
            Text            =   "Text1"
            Top             =   240
            Width           =   1095
         End
         Begin VB.TextBox TextDll 
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   350
            Left            =   840
            TabIndex        =   36
            Text            =   "Text1"
            Top             =   240
            Width           =   1095
         End
         Begin VB.Label Label14 
            Caption         =   "~"
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   2040
            TabIndex        =   41
            Top             =   600
            Width           =   135
         End
         Begin VB.Label Label13 
            Caption         =   "~"
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   2040
            TabIndex        =   40
            Top             =   240
            Width           =   135
         End
         Begin VB.Label Label8 
            Caption         =   "dt:"
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   14.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   120
            TabIndex        =   29
            Top             =   600
            Width           =   1575
         End
         Begin VB.Label Label7 
            Caption         =   "dl:"
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   14.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   120
            TabIndex        =   28
            Top             =   240
            Width           =   1575
         End
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "优化算法设置"
      BeginProperty Font 
         Name            =   "楷体"
         Size            =   15
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3255
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   7215
      Begin TabSwitch.SafeSwitch SafeSwitch1 
         Height          =   345
         Left            =   1320
         TabIndex        =   83
         Top             =   2595
         Width           =   1170
         _ExtentX        =   2064
         _ExtentY        =   609
      End
      Begin VB.CommandButton CommandMinus 
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
         Left            =   3720
         TabIndex        =   82
         Top             =   2595
         Width           =   375
      End
      Begin VB.CommandButton CommandAdd 
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
         Left            =   4680
         TabIndex        =   81
         Top             =   2595
         Width           =   375
      End
      Begin VB.TextBox TextNjobs 
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
         Left            =   4080
         TabIndex        =   80
         Text            =   "Text1"
         Top             =   2600
         Width           =   615
      End
      Begin VB.CommandButton CommandAdvance 
         Caption         =   "高级选项"
         BeginProperty Font 
            Name            =   "楷体"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   500
         Left            =   5400
         TabIndex        =   78
         Top             =   2520
         Width           =   1575
      End
      Begin VB.TextBox TextValve 
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
         Left            =   5400
         TabIndex        =   18
         Text            =   "Text1"
         Top             =   1920
         Width           =   1575
      End
      Begin VB.ComboBox ComboSrm 
         BeginProperty Font 
            Name            =   "楷体"
            Size            =   11.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   345
         Left            =   5400
         TabIndex        =   15
         Text            =   "Combo1"
         Top             =   1440
         Width           =   1575
      End
      Begin VB.ComboBox ComboN0 
         BeginProperty Font 
            Name            =   "楷体"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   360
         Left            =   5400
         TabIndex        =   13
         Text            =   "Combo1"
         Top             =   480
         Width           =   1575
      End
      Begin VB.ComboBox ComboFun 
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   345
         Left            =   1680
         TabIndex        =   9
         Text            =   "Combo1"
         Top             =   960
         Width           =   1575
      End
      Begin VB.TextBox TextPop 
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
         Left            =   1680
         TabIndex        =   5
         Text            =   "Text1"
         Top             =   1440
         Width           =   1575
      End
      Begin VB.ComboBox ComboOpt 
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   345
         Left            =   1680
         TabIndex        =   2
         Text            =   "Combo1"
         Top             =   480
         Width           =   1575
      End
      Begin VB.Label Label26 
         Caption         =   "进程数:"
         BeginProperty Font 
            Name            =   "楷体"
            Size            =   14.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   2640
         TabIndex        =   84
         Top             =   2640
         Width           =   1455
      End
      Begin VB.Label Label25 
         Caption         =   "多进程:"
         BeginProperty Font 
            Name            =   "楷体"
            Size            =   14.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   240
         TabIndex        =   79
         Top             =   2620
         Width           =   1455
      End
      Begin VB.Label Label4 
         Caption         =   "停止阈值:"
         BeginProperty Font 
            Name            =   "楷体"
            Size            =   14.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   3480
         TabIndex        =   17
         Top             =   1920
         Width           =   2175
      End
      Begin VB.Label Label3 
         Caption         =   "Srm率定尺度:"
         BeginProperty Font 
            Name            =   "楷体"
            Size            =   14.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   3480
         TabIndex        =   12
         Top             =   1440
         Width           =   2175
      End
      Begin VB.Label Label2 
         Caption         =   "T0率定尺度:"
         BeginProperty Font 
            Name            =   "楷体"
            Size            =   14.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   3480
         TabIndex        =   11
         Top             =   960
         Width           =   1815
      End
      Begin VB.Label Label1 
         Caption         =   "n0率定尺度:"
         BeginProperty Font 
            Name            =   "楷体"
            Size            =   14.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   3480
         TabIndex        =   10
         Top             =   480
         Width           =   1815
      End
      Begin VB.Label LabelFun 
         Caption         =   "目标函数:"
         BeginProperty Font 
            Name            =   "楷体"
            Size            =   14.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   240
         TabIndex        =   8
         Top             =   960
         Width           =   1575
      End
      Begin VB.Label LabelIter 
         Caption         =   "迭代次数:"
         BeginProperty Font 
            Name            =   "楷体"
            Size            =   14.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   240
         TabIndex        =   6
         Top             =   1920
         Width           =   1455
      End
      Begin VB.Label LabelPop 
         Alignment       =   2  'Center
         Caption         =   "种群大小:"
         BeginProperty Font 
            Name            =   "楷体"
            Size            =   14.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   4
         Top             =   1440
         Width           =   1575
      End
      Begin VB.Label LabelOpt 
         Caption         =   "优化算法:"
         BeginProperty Font 
            Name            =   "楷体"
            Size            =   14.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   240
         TabIndex        =   3
         Top             =   480
         Width           =   1575
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private hProcess As Long

Private Sub ComboOpt_LostFocus()
    If ComboOpt.ListIndex = 4 Then
        TextPop.Enabled = False
    Else
        TextPop.Enabled = True
    End If
End Sub

Private Sub Command1_Click()
    Dim path As String
    path = GetFolder(Me.hWnd, "浏览文件夹")
    If path <> "" Then
        TextPath.Text = path
        WritePrivateProfileString "System", "project location", path, App.path & "\settings.ini"
    End If
End Sub


Private Sub CommandAdd_Click()
    Dim n_jobs As Integer
    If Val(TextNjobs.Text) < 10 Then
        n_jobs = Val(TextNjobs.Text) + 1
        TextNjobs.Text = n_jobs
    End If
End Sub

Private Sub CommandAdvance_Click()
    load frmAdvance
    frmAdvance.Show
End Sub

Private Sub CommandMinus_Click()
    Dim n_jobs As Integer
    If Val(TextNjobs.Text) > 2 Then
        n_jobs = Val(TextNjobs.Text) - 1
        TextNjobs.Text = n_jobs
    End If
End Sub

Private Sub CommandModel_Click()
    Dim modelpath As String
    CommonDialog1.ShowOpen
    modelpath = CommonDialog1.FileName
    If modelpath <> "" Then
        TextModel.Text = modelpath
        WritePrivateProfileString "System", "model location", modelpath, App.path & "\settings.ini"
    End If
End Sub

Private Sub CommandStart_Click()

    frmMain.ProgressBar1.value = 0
    WritePrivateProfileString "Progress", "progress", "0", App.path & "\settings.ini"
    ''' 算法参数设置
    If ComboOpt.ListIndex = 0 Then
        WritePrivateProfileString "System", "optimization method", "SSA", App.path & "\settings.ini"
    ElseIf ComboOpt.ListIndex = 1 Then
        WritePrivateProfileString "System", "optimization method", "SFO", App.path & "\settings.ini"
    ElseIf ComboOpt.ListIndex = 2 Then
        WritePrivateProfileString "System", "optimization method", "TSA", App.path & "\settings.ini"
    ElseIf ComboOpt.ListIndex = 3 Then
        WritePrivateProfileString "System", "optimization method", "SOA", App.path & "\settings.ini"
    ElseIf ComboOpt.ListIndex = 4 Then
        WritePrivateProfileString "System", "optimization method", "WOA", App.path & "\settings.ini"
    ElseIf ComboOpt.ListIndex = 5 Then
        WritePrivateProfileString "System", "optimization method", "GWO", App.path & "\settings.ini"
    End If
    
    If ComboFun.ListIndex = 0 Then
        WritePrivateProfileString "Method", "evaluation metric", "NSE", App.path & "\settings.ini"
    ElseIf ComboFun.ListIndex = 1 Then
        WritePrivateProfileString "Method", "evaluation metric", "MSE", App.path & "\settings.ini"
    ElseIf ComboFun.ListIndex = 2 Then
        WritePrivateProfileString "Method", "evaluation metric", "MAE", App.path & "\settings.ini"
    End If
    
    If ComboN0.ListIndex = 0 Then
        WritePrivateProfileString "Method", "n0 method", "Grid", App.path & "\settings.ini"
    ElseIf ComboN0.ListIndex = 1 Then
        WritePrivateProfileString "Method", "n0 method", "Sub-Basin", App.path & "\settings.ini"
    End If
    
    If ComboT0.ListIndex = 0 Then
        WritePrivateProfileString "Method", "t0 method", "Grid", App.path & "\settings.ini"
    ElseIf ComboT0.ListIndex = 1 Then
        WritePrivateProfileString "Method", "t0 method", "Class", App.path & "\settings.ini"
    ElseIf ComboT0.ListIndex = 2 Then
        WritePrivateProfileString "Method", "t0 method", "Particle", App.path & "\settings.ini"
    End If
    
    If ComboSrm.ListIndex = 0 Then
        WritePrivateProfileString "Method", "srmax method", "Grid", App.path & "\settings.ini"
    ElseIf ComboSrm.ListIndex = 1 Then
        WritePrivateProfileString "Method", "srmax method", "Class", App.path & "\settings.ini"
    End If
    
    WritePrivateProfileString "Method", "population", TextPop.Text, App.path & "\settings.ini"
    WritePrivateProfileString "Method", "max iteration", TextIter.Text, App.path & "\settings.ini"
    WritePrivateProfileString "Method", "stop value", TextValve.Text, App.path & "\settings.ini"
    
    If SafeSwitch1.value = False Then
        WritePrivateProfileString "System", "multi-processing", "0", App.path & "\settings.ini"
        WritePrivateProfileString "System", "n_jobs", "1", App.path & "\settings.ini"
    Else
        WritePrivateProfileString "System", "multi-processing", "1", App.path & "\settings.ini"
        WritePrivateProfileString "System", "n_jobs", TextNjobs.Text, App.path & "\settings.ini"
    End If
    
    TextNjobs.Enabled = False
    CommandAdd.Enabled = False
    CommandMinus.Enabled = False
    CommandAdvance.Enabled = False
    
    
    '''模型参数设置
    WritePrivateProfileString "Single Param Lower Bound", "dl", TextDll.Text, App.path & "\param_settings.ini"
    WritePrivateProfileString "Single Param Upper Bound", "dl", TextDlu.Text, App.path & "\param_settings.ini"
    WritePrivateProfileString "Single Param Lower Bound", "dt", TextDtl.Text, App.path & "\param_settings.ini"
    WritePrivateProfileString "Single Param Upper Bound", "dt", TextDtu.Text, App.path & "\param_settings.ini"
    WritePrivateProfileString "Single Param Lower Bound", "alpha", TextAlphal.Text, App.path & "\param_settings.ini"
    WritePrivateProfileString "Single Param Upper Bound", "alpha", TextAlphau.Text, App.path & "\param_settings.ini"
    WritePrivateProfileString "Single Param Lower Bound", "m", TextMl.Text, App.path & "\param_settings.ini"
    WritePrivateProfileString "Single Param Upper Bound", "m", TextMu.Text, App.path & "\param_settings.ini"
    WritePrivateProfileString "Single Param Lower Bound", "sdbar", TextSdbarl.Text, App.path & "\param_settings.ini"
    WritePrivateProfileString "Single Param Upper Bound", "sdbar", TextSdbaru.Text, App.path & "\param_settings.ini"
    WritePrivateProfileString "Single Param Lower Bound", "n0", TextN0l.Text, App.path & "\param_settings.ini"
    WritePrivateProfileString "Single Param Upper Bound", "n0", TextN0u.Text, App.path & "\param_settings.ini"
    
    WritePrivateProfileString "T0 Lower Bound", "clay", TextClayl.Text, App.path & "\param_settings.ini"
    WritePrivateProfileString "T0 Upper Bound", "clay", TextClayu.Text, App.path & "\param_settings.ini"
    WritePrivateProfileString "T0 Lower Bound", "sand", TextSandl.Text, App.path & "\param_settings.ini"
    WritePrivateProfileString "T0 Upper Bound", "sand", TextSandu.Text, App.path & "\param_settings.ini"
    WritePrivateProfileString "T0 Lower Bound", "Silt", TextSiltl.Text, App.path & "\param_settings.ini"
    WritePrivateProfileString "T0 Upper Bound", "Silt", TextSiltu.Text, App.path & "\param_settings.ini"
    
    WritePrivateProfileString "Srmax Bounds From UI", "bounds", TextBoxSrm.Text, App.path & "\param_settings.ini"
    
    frmMain.Timer1.Enabled = True
    frmMain.Timer2.Enabled = True
    WritePrivateProfileString "System", "stop sign", "0", App.path & "\settings.ini"
    Dim pid As Long
    
    'pid = Shell(App.path & "\main.exe", vbNormalFocus)
    DoEvents
    '''pid = Shell("cmd /c python " & App.path & "\main.py", vbHide)
    pid = Shell(App.path & "\main.exe", vbHide)
    hProcess = OpenProcess(PROCESS_TERMINATE, 0, pid)
    
End Sub

Private Sub CommandStop_Click()

    WritePrivateProfileString "System", "stop sign", "1", App.path & "\settings.ini"
    WritePrivateProfileString "System", "time remain", "-h-m-s", App.path & "\settings.ini"
    Label6.Caption = ":"
    'frmMain.Timer1.Enabled = False
    frmMain.Timer2.Enabled = False
    
    Dim l As Long
    Dim f_mdl As String
    Dim mdlpath As String
    l = TerminateProcess(hProcess, l)
    mdlpath = Space(500)
    GetPrivateProfileString "System", "model location", " ", mdlpath, 500, App.path & "\settings.ini"
    f_mdl = GetFileName(mdlpath)
    pid_kill0 = Shell("cmd /c taskkill /f /im " & "y_param2.exe", vbHide)
    pid_kill = Shell("cmd /c taskkill /f /im " & f_mdl, vbHide)
    pid_kill_cmd = Shell("cmd /c taskkill /f /im cmd.exe", vbHide)
    
    WritePrivateProfileString "Progress", "progress", "0", App.path & "\settings.ini"
    ProgressBar1.value = 0
    TextNjobs.Enabled = True
    CommandAdd.Enabled = True
    CommandMinus.Enabled = True
    CommandAdvance.Enabled = True
End Sub

Public Sub Form_Load()

    frmMain.ProgressBar1.value = 0
    WritePrivateProfileString "Progress", "progress", "0", App.path & "\settings.ini"
    WritePrivateProfileString "System", "time remain", "-h-m-s", App.path & "\settings.ini"
    
    SafeSwitch1.value = True
    TextNjobs.Text = GetPrivateProfileInt("System", "n_jobs", 4, App.path & "\settings.ini")
    TextNjobs.Enabled = True
    CommandAdd.Enabled = True
    CommandMinus.Enabled = True
    
    ComboOpt.Clear
    ComboOpt.AddItem "SSA"
    ComboOpt.AddItem "SFO"
    ComboOpt.AddItem "TSA"
    ComboOpt.AddItem "SOA"
    ComboOpt.AddItem "WOA"
    ComboOpt.AddItem "GWO"
    ComboOpt.ListIndex = 0
    
    ComboFun.Clear
    ComboFun.AddItem "NSE"
    ComboFun.AddItem "MSE"
    ComboFun.AddItem "MAE"
    ComboFun.ListIndex = 0
    
    ComboN0.Clear
    ComboN0.AddItem "按网格"
    ComboN0.AddItem "按子流域"
    ComboN0.ListIndex = 1
    
    ComboT0.Clear
    ComboT0.AddItem "按网格"
    ComboT0.AddItem "按土壤类别"
    ComboT0.AddItem "按粒径类别"
    ComboT0.ListIndex = 2
    
    ComboSrm.Clear
    ComboSrm.AddItem "按网格"
    ComboSrm.AddItem "按用地类别"
    ComboSrm.ListIndex = 1
    
    Dim Valve As String
    Dim alphal As String
    Dim alphau As String
    Dim ml As String
    Dim mu As String
    Dim sdbarl As String
    Dim sdbaru As String
    Dim n0l As String
    Dim n0u As String
    Dim clayl As String
    Dim clayu As String
    Dim sandl As String
    Dim sandu As String
    Dim siltl As String
    Dim siltu As String
    Dim srm As String
    Dim prjpath As String
    Dim mdlpath As String
    
    Valve = Space(20)
    alphal = Space(20)
    alphau = Space(20)
    ml = Space(20)
    mu = Space(20)
    sdbarl = Space(20)
    sdbaru = Space(20)
    n0l = Space(20)
    n0u = Space(20)
    clayl = Space(20)
    clayu = Space(20)
    sandl = Space(20)
    sandu = Space(20)
    siltl = Space(20)
    siltu = Space(20)
    srm = Space(500)
    prjpath = Space(500)
    mdlpath = Space(500)
    
    TextPop.Text = GetPrivateProfileInt("Method", "Population", 50, App.path & "\settings.ini")
    TextIter.Text = GetPrivateProfileInt("Method", "Max Iteration", 500, App.path & "\settings.ini")
    TextDll.Text = GetPrivateProfileInt("Single Param Lower Bound", "dl", 2, App.path & "\param_settings.ini")
    TextDlu.Text = GetPrivateProfileInt("Single Param Upper Bound", "dl", 8, App.path & "\param_settings.ini")
    TextDtl.Text = GetPrivateProfileInt("Single Param Lower Bound", "dt", 2, App.path & "\param_settings.ini")
    TextDtu.Text = GetPrivateProfileInt("Single Param Upper Bound", "dt", 8, App.path & "\param_settings.ini")
    GetPrivateProfileString "Method", "Stop Value", "0.2", Valve, 20, App.path & "\settings.ini"
    TextValve.Text = Valve
    
    GetPrivateProfileString "Single Param Lower Bound", "alpha", "-1", alphal, 20, App.path & "\param_settings.ini"
    TextAlphal.Text = alphal
    GetPrivateProfileString "Single Param Upper Bound", "alpha", "10", alphau, 20, App.path & "\param_settings.ini"
    TextAlphau.Text = alphau
    GetPrivateProfileString "Single Param Lower Bound", "m", "0.001", ml, 20, App.path & "\param_settings.ini"
    TextMl.Text = ml
    GetPrivateProfileString "Single Param Upper Bound", "m", "0.4", mu, 20, App.path & "\param_settings.ini"
    TextMu.Text = mu
    GetPrivateProfileString "Single Param Lower Bound", "sdbar", "0.001", sdbarl, 20, App.path & "\param_settings.ini"
    TextSdbarl.Text = sdbarl
    GetPrivateProfileString "Single Param Upper Bound", "sdbar", "1", sdbaru, 20, App.path & "\param_settings.ini"
    TextSdbaru.Text = sdbaru
    GetPrivateProfileString "Single Param Lower Bound", "n0", "0.001", n0l, 20, App.path & "\param_settings.ini"
    TextN0l.Text = n0l
    GetPrivateProfileString "Single Param Upper Bound", "n0", "0.04", n0u, 20, App.path & "\param_settings.ini"
    TextN0u.Text = n0u
    GetPrivateProfileString "T0 Lower Bound", "clay", "0.001", clayl, 20, App.path & "\param_settings.ini"
    TextClayl.Text = clayl
    GetPrivateProfileString "T0 Upper Bound", "clay", "110", clayu, 20, App.path & "\param_settings.ini"
    TextClayu.Text = clayu
    GetPrivateProfileString "T0 Lower Bound", "sand", "0.001", sandl, 20, App.path & "\param_settings.ini"
    TextSandl.Text = sandl
    GetPrivateProfileString "T0 Upper Bound", "sand", "110", sandu, 20, App.path & "\param_settings.ini"
    TextSandu.Text = sandu
    GetPrivateProfileString "T0 Lower Bound", "silt", "0.001", siltl, 20, App.path & "\param_settings.ini"
    TextSiltl.Text = siltl
    GetPrivateProfileString "T0 Upper Bound", "silt", "110", siltu, 20, App.path & "\param_settings.ini"
    TextSiltu.Text = siltu
    
    GetPrivateProfileString "Srmax Bounds From UI", "bounds", "Please enter.", srm, 500, App.path & "\param_settings.ini"
    TextBoxSrm.Text = srm
    
    GetPrivateProfileString "System", "project location", "请选择BTOPMC工程文件夹路径", prjpath, 500, App.path & "\settings.ini"
    TextPath.Text = prjpath
    
    GetPrivateProfileString "System", "model location", "请选择BTOPMC主控文件路径", mdlpath, 500, App.path & "\settings.ini"
    TextModel.Text = mdlpath
    
    On Error Resume Next
    Chart2D1.ChartGroups(1).Data.load "curve.dat"
    Chart2D2.ChartGroups(1).Data.load "predplot.dat"
    
    SSTab1.TabIndex = 0
    
    ProgressBar1.value = 0
    frmMain.Timer2.Enabled = False
    
End Sub

Private Sub Form_Unload(Cancel As Integer)

    'WritePrivateProfileString "Srmax Bounds From UI", "bounds", TextBoxSrm.Text, App.path & "\param_settings.ini"
    Dim l As Long
    l = TerminateProcess(hProcess, l)
    Unload frmAdvance
End Sub


Private Sub SafeSwitch1_Click(value As Boolean)
    If SafeSwitch1.value = True Then
        TextNjobs.Enabled = True
        CommandAdd.Enabled = True
        CommandMinus.Enabled = True
    Else
        TextNjobs.Text = 1
        TextNjobs.Enabled = False
        CommandAdd.Enabled = False
        CommandMinus.Enabled = False
    End If
    
End Sub

Private Sub Timer1_Timer()
    ProgressBar1.value = GetPrivateProfileInt("Progress", "Progress", 50, App.path & "\settings.ini")
    On Error Resume Next
    Chart2D1.ChartGroups(1).Data.load "curve.dat"
    'Chart2D1.Refresh
    On Error Resume Next
    Chart2D2.ChartGroups(1).Data.load "predplot.dat"
    'Chart2D2.Refresh
    Dim timeremain As String
    timeremain = Space(50)
    GetPrivateProfileString "System", "Time Remain", "未知", timeremain, 50, App.path & "\settings.ini"
    LabelTime.Caption = timeremain
    
End Sub

Private Sub Timer2_Timer()
    Dim StopSign As Integer
    StopSign = GetPrivateProfileInt("System", "stop sign", 0, App.path & "\settings.ini")
    If StopSign = 1 Then
        Label6.Caption = ":"
        Timer2.Enabled = False
        TextNjobs.Enabled = True
        CommandAdd.Enabled = True
        CommandMinus.Enabled = True
        Dim l As Long
        l = TerminateProcess(hProcess, l)
    Else
        If Label6.Caption = ":" Then
            Label6.Caption = " "
        Else
            Label6.Caption = ":"
        End If
    End If

    
End Sub




