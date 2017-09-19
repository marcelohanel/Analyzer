unit uDesigner;

interface

uses
  xhConsts, ShellApi, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB,
  cxLookAndFeelPainters, cxButtons, cxEdit,
  cxLabel, cxTextEdit, cxDropDownEdit, cxListBox,
  cxCheckListBox, cxCheckBox, cxCurrencyEdit,
  cxRadioGroup,





  cxLookAndFeels,


  dxSkinsForm, cxLocalization, CEVersionInfo, cxStyles,
  cxGridTableView, cxVGrid, ExtCtrls, cxGraphics, cxControls, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, Menus,
  cxContainer, cxClasses, cxGroupBox, cxMaskEdit, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint;

function retornaABC(valor: double): string;

type
  TfrmDesigner = class(TForm)
    ADOQuery1: TADOQuery;
    ListBox2: TListBox;
    ListBox3: TListBox;
    ListBox4: TListBox;
    ADOQuery2: TADOQuery;
    lstValor: TListBox;
    lstData: TListBox;
    SpeedButton1: TcxButton;
    SpeedButton2: TcxButton;
    SpeedButton3: TcxButton;
    SpeedButton4: TcxButton;
    SpeedButton7: TcxButton;
    SpeedButton8: TcxButton;
    SpeedButton9: TcxButton;
    SpeedButton10: TcxButton;
    SpeedButton11: TcxButton;
    SpeedButton12: TcxButton;
    Label1: TcxLabel;
    Label3: TcxLabel;
    Label5: TcxLabel;
    Label6: TcxLabel;
    Label2: TcxLabel;
    ComboBox1: TcxComboBox;
    ListBox1: TcxListBox;
    CheckListBox1: TcxCheckListBox;
    CheckListBox2: TcxCheckListBox;
    CheckListBox3: TcxCheckListBox;
    lstAnaliseIgnorados: TListBox;
    lstValorIgnorados: TListBox;
    cxButton5: TcxButton;
    cbxOrdem: TcxComboBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    edtLinha: TcxCurrencyEdit;
    cxLabel3: TcxLabel;
    rgpOrdem: TcxRadioGroup;
    cxLabel4: TcxLabel;
    cxButton10: TcxButton;
    cxButton1: TcxButton;
    cxLabel5: TcxLabel;
    edtRegistros: TcxCurrencyEdit;
    cxLabel6: TcxLabel;
    CEVersionInfo1: TCEVersionInfo;
    cxLocalizer1: TcxLocalizer;
    dxSkinController1: TdxSkinController;
    bdArmazena: TADOConnection;
    bdDados: TADOConnection;
    tblAnalises: TADOTable;
    tblAnalisesID_ANALISE: TWideStringField;
    tblAnalisesDESCRICAO: TMemoField;
    tblAnalisesBASE_ORIGEM: TMemoField;
    tblAnalisesVISAO_ORIGEM: TWideStringField;
    tblAnalisesVISAO_DESTINO: TWideStringField;
    tblAnalisesINCREMENTAL: TWideStringField;
    tblAnalisesPODE_VISUALIZAR: TMemoField;
    tblAnalisesPODE_ALTERAR: TMemoField;
    tblAnalisesPODE_ATUALIZAR: TMemoField;
    tblAnalisesPODE_APAGAR: TMemoField;
    tblAnalisesDT_ATUALIZACAO: TDateTimeField;
    tblAnalisesINTERNA: TWideStringField;
    tblAnalisesANALISES_IGNORADOS: TMemoField;
    tblAnalisesVALORES_IGNORADOS: TMemoField;
    tblAnalisesGRID: TWideStringField;
    tblAnalisesGRUPO: TWideStringField;
    tblAnalisesDT_CRIACAO: TDateTimeField;
    tblCenarios: TADOTable;
    tblCenariosID_CENARIO: TWideStringField;
    tblCenariosID_USUARIO: TWideStringField;
    tblCenariosID_ANALISE: TWideStringField;
    tblCenariosID_ABC: TWideStringField;
    tblCenariosFILTROS: TMemoField;
    tblCenariosELEMENTOS: TMemoField;
    tblCenariosVALORES: TMemoField;
    tblCenariosA: TWideStringField;
    tblCenariosB: TWideStringField;
    tblCenariosC: TWideStringField;
    tblCenariosD: TWideStringField;
    tblCenariosE: TWideStringField;
    tblCenariosFOTOGRAFIA_DATA: TWideStringField;
    tblCenariosFOTOGRAFIA_VALOR: TWideStringField;
    tblCenariosFOTOGRAFIA_DT_FOT_INI: TWideStringField;
    tblCenariosFOTOGRAFIA_DT_FOT_FIM: TWideStringField;
    tblCenariosFOTOGRAFIA_DT_COM_INI: TWideStringField;
    tblCenariosFOTOGRAFIA_DT_COM_FIM: TWideStringField;
    tblCenariosFREQUENCIA_DATA: TWideStringField;
    tblCenariosFREQUENCIA_VALOR: TWideStringField;
    tblCenariosFREQUENCIA_DT_FRE_INI: TWideStringField;
    tblCenariosFREQUENCIA_DT_FRE_FIM: TWideStringField;
    tblCenariosFREQUENCIA_DATA_BASE: TWideStringField;
    tblCenariosID_FOTOGRAFIA: TWideStringField;
    tblCenariosID_FREQUENCIA: TWideStringField;
    tblCenariosORDEM: TWideStringField;
    tblCenariosORDEM_TIPO: TWideStringField;
    tblCenariosLINHAS: TIntegerField;
    tblCenariosFILTRO_PERSONALIZADO_TEXTO: TWideMemoField;
    tblCenariosFILTRO_PERSONALIZADO_GRAFICO: TBlobField;
    tblCenariosREGISTROS: TIntegerField;
    tblCenariosFREQUENCIA_DIAS: TIntegerField;
    tblCenariosFREQUENCIA_ATUAL: TWideStringField;
    qryAtualiza: TADOQuery;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    cxStyle43: TcxStyle;
    cxStyle44: TcxStyle;
    cxStyle45: TcxStyle;
    cxStyle46: TcxStyle;
    cxStyle47: TcxStyle;
    cxStyle48: TcxStyle;
    cxStyle49: TcxStyle;
    cxStyle50: TcxStyle;
    cxStyle51: TcxStyle;
    cxStyle52: TcxStyle;
    cxStyle53: TcxStyle;
    cxStyle54: TcxStyle;
    cxStyle55: TcxStyle;
    cxStyle56: TcxStyle;
    cxStyle57: TcxStyle;
    cxStyle58: TcxStyle;
    cxStyle59: TcxStyle;
    cxStyle60: TcxStyle;
    cxStyle61: TcxStyle;
    cxStyle62: TcxStyle;
    cxStyle63: TcxStyle;
    cxStyle64: TcxStyle;
    cxStyle65: TcxStyle;
    cxStyle66: TcxStyle;
    cxStyle67: TcxStyle;
    cxStyle68: TcxStyle;
    cxStyle69: TcxStyle;
    cxStyle70: TcxStyle;
    cxStyle71: TcxStyle;
    cxStyle72: TcxStyle;
    cxStyle73: TcxStyle;
    cxStyle74: TcxStyle;
    cxStyle75: TcxStyle;
    cxStyle76: TcxStyle;
    cxStyle77: TcxStyle;
    cxStyle78: TcxStyle;
    cxStyle79: TcxStyle;
    cxStyle80: TcxStyle;
    cxStyle81: TcxStyle;
    cxStyle82: TcxStyle;
    cxStyle83: TcxStyle;
    cxStyle84: TcxStyle;
    cxStyle85: TcxStyle;
    cxStyle86: TcxStyle;
    cxStyle87: TcxStyle;
    cxStyle88: TcxStyle;
    cxStyle89: TcxStyle;
    cxStyle90: TcxStyle;
    cxStyle91: TcxStyle;
    cxStyle92: TcxStyle;
    cxStyle93: TcxStyle;
    cxStyle94: TcxStyle;
    cxStyle95: TcxStyle;
    cxStyle96: TcxStyle;
    cxStyle97: TcxStyle;
    cxStyle98: TcxStyle;
    cxStyle99: TcxStyle;
    cxStyle100: TcxStyle;
    cxStyle101: TcxStyle;
    cxStyle102: TcxStyle;
    cxStyle103: TcxStyle;
    cxStyle104: TcxStyle;
    cxStyle105: TcxStyle;
    cxStyle106: TcxStyle;
    cxStyle107: TcxStyle;
    cxStyle108: TcxStyle;
    cxStyle109: TcxStyle;
    cxStyle110: TcxStyle;
    cxStyle111: TcxStyle;
    cxStyle112: TcxStyle;
    cxStyle113: TcxStyle;
    cxStyle114: TcxStyle;
    cxStyle115: TcxStyle;
    cxStyle116: TcxStyle;
    cxStyle117: TcxStyle;
    cxStyle118: TcxStyle;
    cxStyle119: TcxStyle;
    cxStyle120: TcxStyle;
    cxStyle121: TcxStyle;
    cxStyle122: TcxStyle;
    cxStyle123: TcxStyle;
    cxStyle124: TcxStyle;
    cxStyle125: TcxStyle;
    cxStyle126: TcxStyle;
    cxStyle127: TcxStyle;
    cxStyle128: TcxStyle;
    cxStyle129: TcxStyle;
    cxStyle130: TcxStyle;
    cxStyle131: TcxStyle;
    cxStyle132: TcxStyle;
    cxStyle133: TcxStyle;
    cxStyle134: TcxStyle;
    cxStyle135: TcxStyle;
    cxStyle136: TcxStyle;
    cxStyle137: TcxStyle;
    cxStyle138: TcxStyle;
    cxStyle139: TcxStyle;
    cxStyle140: TcxStyle;
    cxStyle141: TcxStyle;
    cxStyle142: TcxStyle;
    cxStyle143: TcxStyle;
    cxStyle144: TcxStyle;
    cxStyle145: TcxStyle;
    cxStyle146: TcxStyle;
    cxStyle147: TcxStyle;
    cxStyle148: TcxStyle;
    cxStyle149: TcxStyle;
    cxStyle150: TcxStyle;
    cxStyle151: TcxStyle;
    cxStyle152: TcxStyle;
    cxStyle153: TcxStyle;
    cxStyle154: TcxStyle;
    cxStyle155: TcxStyle;
    cxStyle156: TcxStyle;
    cxStyle157: TcxStyle;
    cxStyle158: TcxStyle;
    cxStyle159: TcxStyle;
    cxStyle160: TcxStyle;
    cxStyle161: TcxStyle;
    cxStyle162: TcxStyle;
    cxStyle163: TcxStyle;
    cxStyle164: TcxStyle;
    cxStyle165: TcxStyle;
    cxStyle166: TcxStyle;
    cxStyle167: TcxStyle;
    cxStyle168: TcxStyle;
    cxStyle169: TcxStyle;
    cxStyle170: TcxStyle;
    cxStyle171: TcxStyle;
    cxStyle172: TcxStyle;
    cxStyle173: TcxStyle;
    cxStyle174: TcxStyle;
    cxStyle175: TcxStyle;
    cxStyle176: TcxStyle;
    cxStyle177: TcxStyle;
    cxStyle178: TcxStyle;
    cxStyle179: TcxStyle;
    cxStyle180: TcxStyle;
    cxStyle181: TcxStyle;
    cxStyle182: TcxStyle;
    cxStyle183: TcxStyle;
    cxStyle184: TcxStyle;
    cxStyle185: TcxStyle;
    cxStyle186: TcxStyle;
    cxStyle187: TcxStyle;
    cxStyle188: TcxStyle;
    cxStyle189: TcxStyle;
    cxStyle190: TcxStyle;
    cxStyle191: TcxStyle;
    cxStyle192: TcxStyle;
    cxStyle193: TcxStyle;
    cxStyle194: TcxStyle;
    cxStyle195: TcxStyle;
    cxStyle196: TcxStyle;
    cxStyle197: TcxStyle;
    cxStyle198: TcxStyle;
    cxStyle199: TcxStyle;
    cxStyle200: TcxStyle;
    cxStyle201: TcxStyle;
    cxStyle202: TcxStyle;
    cxStyle203: TcxStyle;
    cxStyle204: TcxStyle;
    cxStyle205: TcxStyle;
    cxStyle206: TcxStyle;
    cxStyle207: TcxStyle;
    cxStyle208: TcxStyle;
    cxStyle209: TcxStyle;
    cxStyle210: TcxStyle;
    cxStyle211: TcxStyle;
    cxStyle212: TcxStyle;
    cxStyle213: TcxStyle;
    cxStyle214: TcxStyle;
    cxStyle215: TcxStyle;
    cxStyle216: TcxStyle;
    cxStyle217: TcxStyle;
    cxStyle218: TcxStyle;
    cxStyle219: TcxStyle;
    cxStyle220: TcxStyle;
    cxStyle221: TcxStyle;
    cxStyle222: TcxStyle;
    cxStyle223: TcxStyle;
    cxStyle224: TcxStyle;
    cxStyle225: TcxStyle;
    cxStyle226: TcxStyle;
    cxStyle227: TcxStyle;
    cxStyle228: TcxStyle;
    cxStyle229: TcxStyle;
    cxStyle230: TcxStyle;
    cxStyle231: TcxStyle;
    cxStyle232: TcxStyle;
    cxStyle233: TcxStyle;
    cxStyle234: TcxStyle;
    cxStyle235: TcxStyle;
    cxStyle236: TcxStyle;
    cxStyle237: TcxStyle;
    cxStyle238: TcxStyle;
    cxStyle239: TcxStyle;
    cxStyle240: TcxStyle;
    cxStyle241: TcxStyle;
    cxStyle242: TcxStyle;
    cxStyle243: TcxStyle;
    cxStyle244: TcxStyle;
    cxStyle245: TcxStyle;
    cxStyle246: TcxStyle;
    cxStyle247: TcxStyle;
    cxStyle248: TcxStyle;
    cxStyle249: TcxStyle;
    cxStyle250: TcxStyle;
    cxStyle251: TcxStyle;
    cxStyle252: TcxStyle;
    cxStyle253: TcxStyle;
    cxStyle254: TcxStyle;
    cxStyle255: TcxStyle;
    cxStyle256: TcxStyle;
    cxStyle257: TcxStyle;
    cxStyle258: TcxStyle;
    cxStyle259: TcxStyle;
    cxStyle260: TcxStyle;
    cxStyle261: TcxStyle;
    cxStyle262: TcxStyle;
    cxStyle263: TcxStyle;
    cxStyle264: TcxStyle;
    cxStyle265: TcxStyle;
    cxStyle266: TcxStyle;
    cxStyle267: TcxStyle;
    cxStyle268: TcxStyle;
    cxStyle269: TcxStyle;
    cxStyle270: TcxStyle;
    cxStyle271: TcxStyle;
    cxStyle272: TcxStyle;
    cxStyle273: TcxStyle;
    cxStyle274: TcxStyle;
    cxStyle275: TcxStyle;
    cxStyle276: TcxStyle;
    cxStyle277: TcxStyle;
    cxStyle278: TcxStyle;
    cxStyle279: TcxStyle;
    cxStyle280: TcxStyle;
    cxStyle281: TcxStyle;
    cxStyle282: TcxStyle;
    cxStyle283: TcxStyle;
    cxStyle284: TcxStyle;
    cxStyle285: TcxStyle;
    cxStyle286: TcxStyle;
    cxStyle287: TcxStyle;
    cxStyle288: TcxStyle;
    cxStyle289: TcxStyle;
    cxStyle290: TcxStyle;
    cxStyle291: TcxStyle;
    cxStyle292: TcxStyle;
    cxStyle293: TcxStyle;
    cxStyle294: TcxStyle;
    cxStyle295: TcxStyle;
    cxStyle296: TcxStyle;
    cxStyle297: TcxStyle;
    cxStyle298: TcxStyle;
    cxStyle299: TcxStyle;
    cxStyle300: TcxStyle;
    cxStyle301: TcxStyle;
    cxStyle302: TcxStyle;
    cxStyle303: TcxStyle;
    cxStyle304: TcxStyle;
    cxStyle305: TcxStyle;
    cxStyle306: TcxStyle;
    cxStyle307: TcxStyle;
    cxStyle308: TcxStyle;
    cxStyle309: TcxStyle;
    cxStyle310: TcxStyle;
    cxStyle311: TcxStyle;
    cxStyle312: TcxStyle;
    cxStyle313: TcxStyle;
    cxStyle314: TcxStyle;
    cxStyle315: TcxStyle;
    cxStyle316: TcxStyle;
    cxStyle317: TcxStyle;
    cxStyle318: TcxStyle;
    cxStyle319: TcxStyle;
    cxStyle320: TcxStyle;
    cxStyle321: TcxStyle;
    cxStyle322: TcxStyle;
    cxStyle323: TcxStyle;
    cxStyle324: TcxStyle;
    cxStyle325: TcxStyle;
    cxStyle326: TcxStyle;
    cxStyle327: TcxStyle;
    cxStyle328: TcxStyle;
    cxStyle329: TcxStyle;
    cxStyle330: TcxStyle;
    cxStyle331: TcxStyle;
    cxStyle332: TcxStyle;
    cxStyle333: TcxStyle;
    cxStyle334: TcxStyle;
    cxStyle335: TcxStyle;
    cxStyle336: TcxStyle;
    cxStyle337: TcxStyle;
    cxStyle338: TcxStyle;
    cxStyle339: TcxStyle;
    cxStyle340: TcxStyle;
    cxStyle341: TcxStyle;
    cxStyle342: TcxStyle;
    cxStyle343: TcxStyle;
    cxStyle344: TcxStyle;
    cxStyle345: TcxStyle;
    cxStyle346: TcxStyle;
    cxStyle347: TcxStyle;
    cxStyle348: TcxStyle;
    cxStyle349: TcxStyle;
    cxStyle350: TcxStyle;
    cxStyle351: TcxStyle;
    cxStyle352: TcxStyle;
    cxStyle353: TcxStyle;
    cxStyle354: TcxStyle;
    cxStyle355: TcxStyle;
    cxStyle356: TcxStyle;
    cxStyle357: TcxStyle;
    cxStyle358: TcxStyle;
    cxStyle359: TcxStyle;
    cxStyle360: TcxStyle;
    cxStyle361: TcxStyle;
    cxStyle362: TcxStyle;
    cxStyle363: TcxStyle;
    cxStyle364: TcxStyle;
    cxStyle365: TcxStyle;
    cxStyle366: TcxStyle;
    cxStyle367: TcxStyle;
    cxStyle368: TcxStyle;
    cxStyle369: TcxStyle;
    cxStyle370: TcxStyle;
    cxStyle371: TcxStyle;
    cxStyle372: TcxStyle;
    cxStyle373: TcxStyle;
    cxStyle374: TcxStyle;
    cxStyle375: TcxStyle;
    cxStyle376: TcxStyle;
    cxStyle377: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    GridTableViewStyleSheetUserFormat1: TcxGridTableViewStyleSheet;
    GridTableViewStyleSheetUserFormat2: TcxGridTableViewStyleSheet;
    GridTableViewStyleSheetUserFormat3: TcxGridTableViewStyleSheet;
    GridTableViewStyleSheetUserFormat4: TcxGridTableViewStyleSheet;
    GridTableViewStyleSheetBrick: TcxGridTableViewStyleSheet;
    GridTableViewStyleSheetDesert: TcxGridTableViewStyleSheet;
    GridTableViewStyleSheetEggplant: TcxGridTableViewStyleSheet;
    GridTableViewStyleSheetLilac: TcxGridTableViewStyleSheet;
    GridTableViewStyleSheetMaple: TcxGridTableViewStyleSheet;
    GridTableViewStyleSheetMarinehighcolor: TcxGridTableViewStyleSheet;
    GridTableViewStyleSheetPlumhighcolor: TcxGridTableViewStyleSheet;
    GridTableViewStyleSheetPumpkinlarge: TcxGridTableViewStyleSheet;
    GridTableViewStyleSheetRainyDay: TcxGridTableViewStyleSheet;
    GridTableViewStyleSheetRedWhiteandBlueVGA: TcxGridTableViewStyleSheet;
    GridTableViewStyleSheetRose: TcxGridTableViewStyleSheet;
    GridTableViewStyleSheetRoselarge: TcxGridTableViewStyleSheet;
    GridTableViewStyleSheetSlate: TcxGridTableViewStyleSheet;
    GridTableViewStyleSheetSpruce: TcxGridTableViewStyleSheet;
    GridTableViewStyleSheetStormVGA: TcxGridTableViewStyleSheet;
    GridTableViewStyleSheetTealVGA: TcxGridTableViewStyleSheet;
    GridTableViewStyleSheetWheat: TcxGridTableViewStyleSheet;
    GridTableViewStyleSheetWindowsClassic: TcxGridTableViewStyleSheet;
    GridTableViewStyleSheetWindowsClassiclarge: TcxGridTableViewStyleSheet;
    GridTableViewStyleSheetWindowsStandard: TcxGridTableViewStyleSheet;
    GridTableViewStyleSheetWindowsStandardlarge: TcxGridTableViewStyleSheet;
    GridTableViewStyleSheetHighContrast1: TcxGridTableViewStyleSheet;
    GridTableViewStyleSheetHighContrast1large: TcxGridTableViewStyleSheet;
    GridTableViewStyleSheetHighContrast2: TcxGridTableViewStyleSheet;
    GridTableViewStyleSheetHighContrast2large: TcxGridTableViewStyleSheet;
    GridTableViewStyleSheetHighContrastBlack: TcxGridTableViewStyleSheet;
    GridTableViewStyleSheetHighContrastBlacklarge: TcxGridTableViewStyleSheet;
    GridTableViewStyleSheetHighContrastWhite: TcxGridTableViewStyleSheet;
    GridTableViewStyleSheetHighContrastWhitelarge: TcxGridTableViewStyleSheet;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle378: TcxStyle;
    cxStyle379: TcxStyle;
    cxStyle380: TcxStyle;
    cxStyle381: TcxStyle;
    cxStyle382: TcxStyle;
    cxStyle383: TcxStyle;
    cxStyle384: TcxStyle;
    cxStyle385: TcxStyle;
    cxStyle386: TcxStyle;
    cxStyle387: TcxStyle;
    cxStyle388: TcxStyle;
    cxStyle389: TcxStyle;
    cxStyle390: TcxStyle;
    cxStyle391: TcxStyle;
    cxStyle392: TcxStyle;
    cxStyle393: TcxStyle;
    cxStyle394: TcxStyle;
    cxStyle395: TcxStyle;
    cxStyle396: TcxStyle;
    cxStyle397: TcxStyle;
    cxStyle398: TcxStyle;
    cxStyle399: TcxStyle;
    cxStyle400: TcxStyle;
    cxStyle401: TcxStyle;
    cxStyle402: TcxStyle;
    cxStyle403: TcxStyle;
    cxStyle404: TcxStyle;
    cxStyle405: TcxStyle;
    cxStyle406: TcxStyle;
    cxStyle407: TcxStyle;
    cxStyle408: TcxStyle;
    cxStyle409: TcxStyle;
    cxStyle410: TcxStyle;
    cxStyle411: TcxStyle;
    cxStyle412: TcxStyle;
    cxStyle413: TcxStyle;
    cxStyle414: TcxStyle;
    cxStyle415: TcxStyle;
    cxStyle416: TcxStyle;
    cxStyle417: TcxStyle;
    cxStyle418: TcxStyle;
    cxStyle419: TcxStyle;
    cxStyle420: TcxStyle;
    cxStyle421: TcxStyle;
    cxStyle422: TcxStyle;
    cxStyle423: TcxStyle;
    cxStyle424: TcxStyle;
    cxStyle425: TcxStyle;
    cxStyle426: TcxStyle;
    cxStyle427: TcxStyle;
    cxStyle428: TcxStyle;
    cxStyle429: TcxStyle;
    cxStyle430: TcxStyle;
    cxStyle431: TcxStyle;
    cxStyle432: TcxStyle;
    cxStyle433: TcxStyle;
    cxStyle434: TcxStyle;
    cxStyle435: TcxStyle;
    cxStyle436: TcxStyle;
    cxStyle437: TcxStyle;
    cxStyle438: TcxStyle;
    cxStyle439: TcxStyle;
    cxStyle440: TcxStyle;
    cxStyle441: TcxStyle;
    cxStyle442: TcxStyle;
    cxStyle443: TcxStyle;
    cxStyle444: TcxStyle;
    cxStyle445: TcxStyle;
    cxStyle446: TcxStyle;
    cxStyle447: TcxStyle;
    cxStyle448: TcxStyle;
    cxStyle449: TcxStyle;
    cxStyle450: TcxStyle;
    cxStyle451: TcxStyle;
    cxStyle452: TcxStyle;
    cxStyle453: TcxStyle;
    cxStyle454: TcxStyle;
    cxStyle455: TcxStyle;
    cxStyle456: TcxStyle;
    cxStyle457: TcxStyle;
    cxStyle458: TcxStyle;
    cxStyle459: TcxStyle;
    cxStyle460: TcxStyle;
    cxStyle461: TcxStyle;
    cxStyle462: TcxStyle;
    cxStyle463: TcxStyle;
    cxStyle464: TcxStyle;
    cxStyle465: TcxStyle;
    cxStyle466: TcxStyle;
    cxStyle467: TcxStyle;
    cxStyle468: TcxStyle;
    cxStyle469: TcxStyle;
    cxStyle470: TcxStyle;
    cxStyle471: TcxStyle;
    cxStyle472: TcxStyle;
    cxStyle473: TcxStyle;
    cxStyle474: TcxStyle;
    cxStyle475: TcxStyle;
    cxStyle476: TcxStyle;
    cxStyle477: TcxStyle;
    cxStyle478: TcxStyle;
    cxStyle479: TcxStyle;
    cxStyle480: TcxStyle;
    cxStyle481: TcxStyle;
    cxStyle482: TcxStyle;
    cxStyle483: TcxStyle;
    cxStyle484: TcxStyle;
    cxStyle485: TcxStyle;
    cxStyle486: TcxStyle;
    cxStyle487: TcxStyle;
    cxStyle488: TcxStyle;
    cxStyle489: TcxStyle;
    cxStyle490: TcxStyle;
    cxStyle491: TcxStyle;
    cxStyle492: TcxStyle;
    cxStyle493: TcxStyle;
    cxStyle494: TcxStyle;
    cxStyle495: TcxStyle;
    cxStyle496: TcxStyle;
    cxStyle497: TcxStyle;
    cxStyle498: TcxStyle;
    cxStyle499: TcxStyle;
    cxStyle500: TcxStyle;
    cxStyle501: TcxStyle;
    cxStyle502: TcxStyle;
    cxStyle503: TcxStyle;
    cxStyle504: TcxStyle;
    cxStyle505: TcxStyle;
    cxStyle506: TcxStyle;
    cxStyle507: TcxStyle;
    cxStyle508: TcxStyle;
    cxStyle509: TcxStyle;
    cxStyle510: TcxStyle;
    cxStyle511: TcxStyle;
    cxStyle512: TcxStyle;
    cxStyle513: TcxStyle;
    cxStyle514: TcxStyle;
    cxStyle515: TcxStyle;
    cxStyle516: TcxStyle;
    cxStyle517: TcxStyle;
    cxStyle518: TcxStyle;
    cxStyle519: TcxStyle;
    cxStyle520: TcxStyle;
    cxStyle521: TcxStyle;
    cxStyle522: TcxStyle;
    cxStyle523: TcxStyle;
    cxStyle524: TcxStyle;
    cxStyle525: TcxStyle;
    cxStyle526: TcxStyle;
    cxStyle527: TcxStyle;
    cxStyle528: TcxStyle;
    cxStyle529: TcxStyle;
    cxStyle530: TcxStyle;
    cxStyle531: TcxStyle;
    cxStyle532: TcxStyle;
    cxStyle533: TcxStyle;
    cxStyle534: TcxStyle;
    cxStyle535: TcxStyle;
    cxStyle536: TcxStyle;
    cxStyle537: TcxStyle;
    cxStyle538: TcxStyle;
    cxStyle539: TcxStyle;
    cxStyle540: TcxStyle;
    cxStyle541: TcxStyle;
    cxStyle542: TcxStyle;
    cxStyle543: TcxStyle;
    cxStyle544: TcxStyle;
    cxStyle545: TcxStyle;
    cxStyle546: TcxStyle;
    cxStyle547: TcxStyle;
    cxStyle548: TcxStyle;
    cxStyle549: TcxStyle;
    cxStyle550: TcxStyle;
    cxStyle551: TcxStyle;
    cxStyle552: TcxStyle;
    cxStyle553: TcxStyle;
    cxStyle554: TcxStyle;
    cxStyle555: TcxStyle;
    cxStyle556: TcxStyle;
    cxStyle557: TcxStyle;
    cxStyle558: TcxStyle;
    cxStyle559: TcxStyle;
    cxStyle560: TcxStyle;
    cxStyle561: TcxStyle;
    cxStyle562: TcxStyle;
    cxStyle563: TcxStyle;
    cxStyle564: TcxStyle;
    cxStyle565: TcxStyle;
    cxStyle566: TcxStyle;
    cxStyle567: TcxStyle;
    cxStyle568: TcxStyle;
    cxStyle569: TcxStyle;
    cxStyle570: TcxStyle;
    cxStyle571: TcxStyle;
    cxStyle572: TcxStyle;
    cxStyle573: TcxStyle;
    cxStyle574: TcxStyle;
    cxStyle575: TcxStyle;
    cxStyle576: TcxStyle;
    cxStyle577: TcxStyle;
    cxStyle578: TcxStyle;
    cxStyle579: TcxStyle;
    cxStyle580: TcxStyle;
    cxStyle581: TcxStyle;
    cxStyle582: TcxStyle;
    cxStyle583: TcxStyle;
    cxVerticalGridStyleSheetDevExpress: TcxVerticalGridStyleSheet;
    cxVerticalGridStyleSheetUserFormat1: TcxVerticalGridStyleSheet;
    cxVerticalGridStyleSheetUserFormat2: TcxVerticalGridStyleSheet;
    cxVerticalGridStyleSheetUserFormat3: TcxVerticalGridStyleSheet;
    cxVerticalGridStyleSheetUserFormat4: TcxVerticalGridStyleSheet;
    cxVerticalGridStyleSheetBrick: TcxVerticalGridStyleSheet;
    cxVerticalGridStyleDesert: TcxVerticalGridStyleSheet;
    cxVerticalGridStyleSheetEggplant: TcxVerticalGridStyleSheet;
    cxVerticalGridStyleSheetLilac: TcxVerticalGridStyleSheet;
    cxVerticalGridStyleSheetMaple: TcxVerticalGridStyleSheet;
    cxVerticalGridStyleSheetMarineHighColor: TcxVerticalGridStyleSheet;
    cxVerticalGridStyleSheetPlumHighColor: TcxVerticalGridStyleSheet;
    cxVerticalGridStyleSheetPumpkinLarge: TcxVerticalGridStyleSheet;
    cxVerticalGridStyleSheetRainyDay: TcxVerticalGridStyleSheet;
    cxVerticalGridStyleSheetRedWhiteAndBlueVGA: TcxVerticalGridStyleSheet;
    cxVerticalGridStyleSheetRose: TcxVerticalGridStyleSheet;
    cxVerticalGridStyleSheetRoseLarge: TcxVerticalGridStyleSheet;
    cxVerticalGridStyleSheetSlate: TcxVerticalGridStyleSheet;
    cxVerticalGridStyleSheetSpruce: TcxVerticalGridStyleSheet;
    cxVerticalGridStyleSheetStormVGA: TcxVerticalGridStyleSheet;
    cxVerticalGridStyleSheetTealVGA: TcxVerticalGridStyleSheet;
    cxVerticalGridStyleSheetWheat: TcxVerticalGridStyleSheet;
    cxVerticalGridStyleSheetWindowsClassic: TcxVerticalGridStyleSheet;
    cxVerticalGridStyleSheetWindowsClassicLarge: TcxVerticalGridStyleSheet;
    cxVerticalGridStyleSheetWindowsStandard: TcxVerticalGridStyleSheet;
    cxVerticalGridStyleSheetWindowsStandardLarge: TcxVerticalGridStyleSheet;
    cxVerticalGridStyleSheetHighContrast1: TcxVerticalGridStyleSheet;
    cxVerticalGridStyleSheetHighContrast1Large: TcxVerticalGridStyleSheet;
    cxVerticalGridStyleSheetHighContrast2: TcxVerticalGridStyleSheet;
    cxVerticalGridStyleSheetHighContrast2Large: TcxVerticalGridStyleSheet;
    cxVerticalGridStyleSheetHighContrastBlack: TcxVerticalGridStyleSheet;
    cxVerticalGridStyleSheetHighContrastBlackLarge: TcxVerticalGridStyleSheet;
    cxVerticalGridStyleSheetHighContrastWhite: TcxVerticalGridStyleSheet;
    cxVerticalGridStyleSheetHighContrastWhiteLarge: TcxVerticalGridStyleSheet;
    tblPadroes: TADOTable;
    tblPadroesID_USUARIO: TWideStringField;
    tblPadroesID_CENARIO: TWideStringField;
    tblPadroesID_ANALISE: TWideStringField;
    tblPadroesID_DYNAMICS: TWideStringField;
    tblPadroesID_RELATORIO: TWideStringField;
    tblPadroesID_SCORED: TWideStringField;
    tblPadroesID_ABC: TWideStringField;
    tblPadroesID_FOTOGRAFIA: TWideStringField;
    tblPadroesID_FREQUENCIA: TWideStringField;
    tblPadroesFORMULARIO: TWideStringField;
    tblPadroesCHAVE: TWideStringField;
    tblPadroesVALOR: TBlobField;
    tblPadroesID_SMARTDOCS: TWideStringField;
    tblPadroesID_ACCESS: TWideStringField;
    tblPadroesID_VISIO: TWideStringField;
    tblPadroesID_GEO: TWideStringField;
    tblPadroesID_DECISION: TWideStringField;
    tblFotografia: TADOTable;
    tblFotografiaID_FOTOGRAFIA: TWideStringField;
    tblFotografiaID_ANALISE: TWideStringField;
    tblFotografiaDESCRICAO: TMemoField;
    tblFotografiaPODE_VISUALIZAR: TMemoField;
    tblFotografiaPODE_ALTERAR: TMemoField;
    tblFotografiaPODE_APAGAR: TMemoField;
    tblFotografiaDT_CRIACAO: TDateTimeField;
    tblFrequencia: TADOTable;
    tblFrequenciaID_FREQUENCIA: TWideStringField;
    tblFrequenciaID_ANALISE: TWideStringField;
    tblFrequenciaDESCRICAO: TMemoField;
    tblFrequenciaPODE_VISUALIZAR: TMemoField;
    tblFrequenciaPODE_ALTERAR: TMemoField;
    tblFrequenciaPODE_APAGAR: TMemoField;
    tblFrequenciaDT_CRIACAO: TDateTimeField;
    tblABC: TADOTable;
    tblABCID_ABC: TWideStringField;
    tblABCID_ANALISE: TWideStringField;
    tblABCDESCRICAO: TMemoField;
    tblABCPODE_VISUALIZAR: TMemoField;
    tblABCPODE_ALTERAR: TMemoField;
    tblABCPODE_APAGAR: TMemoField;
    tblABCDT_CRIACAO: TDateTimeField;
    Timer1: TTimer;
    procedure cxButton10Click(Sender: TObject);
    procedure CheckListBox2CheckStatesToEditValue(Sender: TObject;
      const ACheckStates: TcxCheckStates; out AEditValue: Variant);
    procedure cbxOrdemPropertiesInitPopup(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MontaSelectTodos (Campo: integer);
    procedure MontaDetalheItem;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure MontaSelect;
    procedure MontaDetalheItemVisualiza;
    procedure MontaCabecalho(i: integer);
    procedure SpeedButton7Click(Sender: TObject);
    procedure MontaDetalhe;
    procedure MontaSelectCubo;
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure ComboBox1PropertiesInitPopup(Sender: TObject);
    procedure ComboBox1PropertiesChange(Sender: TObject);
    procedure MontaTela;
    procedure CheckListBox1ClickCheck(Sender: TObject; AIndex: Integer;
      APrevState, ANewState: TcxCheckBoxState);
    procedure cxButton5Click(Sender: TObject);
    procedure MontaOrdem;
    procedure cxButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tblAnalisesFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure tblCenariosBeforeDelete(DataSet: TDataSet);
    procedure tblCenariosBeforePost(DataSet: TDataSet);
    procedure tblFotografiaFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure tblFrequenciaFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure tblABCFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure tblPadroesBeforePost(DataSet: TDataSet);
  private
    procedure GroupFotografia;
    procedure GroupFrequencia;
    procedure FiltraDataFrequencia(auxFim: string; auxIni: string);
    procedure FiltraDataFotografia(var auxIni: string; var auxFim: string);
    procedure MontaFrom;
    { Private declarations }
  public
    { Public declarations }
    cAnalise               : string;
    campos                 : string;
    campos1                : string;
    ordem                  : string;
    Sumarios               : integer;
    lVisualiza             : boolean;
    lFotografiaFoto        : boolean;
    lFrequencia            : boolean;
    lFotografia            : boolean;
    vA, vB, vC, vD, vE     : integer;
    sFOTOGRAFIA_data       : string;
    sFOTOGRAFIA_valor      : string;
    sFOTOGRAFIA_dt_fot_ini : string;
    sFOTOGRAFIA_dt_fot_fim : string;
    sFOTOGRAFIA_dt_com_ini : string;
    sFOTOGRAFIA_dt_com_fim : string;
    sFREQUENCIA_data       : string;
    sFREQUENCIA_data_base  : string;
    sFREQUENCIA_valor      : string;
    sFREQUENCIA_dias       : integer;
    sFREQUENCIA_atual      : string;
    sFREQUENCIA_dt_fre_ini : string;
    sFREQUENCIA_dt_fre_fim : string;
    cFiltroPersonalizado   : string;
    sStream                : TMemoryStream;
    sCubo                  : string;
    lCancelaFiltroPersonalizado : boolean;
    lCancFiltroPersonalizado : boolean;
    cCubo                  : string;
    sPedeFiltro            : string;
    sOperacao              : string;
    cFotografia            : string;
    cFrequencia            : string;
    cABC                   : string;

    sUsuario : string;
    sSGBD : string;
    sSkin : string;
    sBanco : string;
    sTempDirUsuario : string;
  end;

var
  frmDesigner: TfrmDesigner;

implementation

uses uFuncoes, uAguarde, uDescricao, uFiltroPersonalizado, uCriaDynamics,
  uFotografar, uFrequencia, uVisualiza;

{$R *.dfm}

function retornaABC(valor: double): string;
var
    aux : string;
begin
    if Valor <= frmDesigner.vA then
       aux := 'A'
    else
    if Valor <= frmDesigner.vA + frmDesigner.vB then
       aux := 'B'
    else
    if Valor <= frmDesigner.vA + frmDesigner.vB + frmDesigner.vC then
       aux := 'C'
    else
    if Valor <= frmDesigner.vA + frmDesigner.vB + frmDesigner.vC + frmDesigner.vD then
       aux := 'D'
    else
       aux := 'E';

    Result := aux;
end;

procedure TfrmDesigner.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if (sOperacao = 'Cubo')       or
       (sOperacao = 'Frequencia') or
       (sOperacao = 'Fotografia') or
       (sOperacao = 'ABC')        then
       SpeedButton9.OnClick(Self);

    GeraLog(frmDesigner.bdDados,frmDesigner.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    tblABC.Close;
    tblFrequencia.Close;
    tblFotografia.Close;
    tblPadroes.Close;
    tblCenarios.Close;
    tblAnalises.Close;

    bdDados.Close;
    bdArmazena.Close;

    try
      DeleteFile(ParamStr(2));
    except
    end;
end;

procedure TfrmDesigner.FormCreate(Sender: TObject);
var
    sAux : TMemo;
begin
    Timer1.Enabled := False;

    if ParamStr(1) <> 'kc4570mh' then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_417'), mtError, [mbOK], 0);
        Application.Terminate;
    end;

    sStream := TMemoryStream.Create;

    SetLanguage(2, cxLocalizer1);

    if FileExists(ParamStr(2)) then
    begin
        sAux := TMemo.Create(Application);
        sAux.Parent := Self;
        sAux.ScrollBars := ssBoth;

        sAux.Lines.LoadFromFile(ParamStr(2));
    end
    else
       Application.Terminate;

    sSkin           := sAux.Lines.Strings[0];
    sSGBD           := sAux.Lines.Strings[3];
    sUsuario        := sAux.Lines.Strings[4];
    sBanco          := sAux.Lines.Strings[5];
    sOperacao       := sAux.Lines.Strings[6];
    cCubo           := sAux.Lines.Strings[7];
    sPedeFiltro     := sAux.Lines.Strings[8];
    cAnalise        := sAux.Lines.Strings[9];
    cFotografia     := sAux.Lines.Strings[10];
    cFrequencia     := sAux.Lines.Strings[11];
    cABC            := sAux.Lines.Strings[12];
    sTempDirUsuario := 'C:\Analyzer\Temp\' + sUsuario + '\';

    dxSkinController1.SkinName := sSkin;
    if sSkin <> 'Nenhum' then
       dxSkinController1.UseSkins := True
    else
       dxSkinController1.UseSkins := False;

    try
      bdDados.Close;
      bdDados.ConnectionString := sAux.Lines.Strings[1];

      bdArmazena.Close;
      bdArmazena.ConnectionString := sAux.Lines.Strings[2];
    except
      on E: Exception do
      begin
          MessageDlg(HCLResourceStrings.FindID('sString_40') + E.Message, mtInformation, [mbOK], 0);
          Application.Terminate;
      end;
    end;

    FreeAndNil(sAux);

    Self.Caption := CEVersionInfo1.ProductName + ' - ' + CEVersionInfo1.FileVersion;

    tblAnalises.Close;
    tblAnalises.Filtered := True;
    tblAnalises.Open;

    tblFotografia.Close;
    tblFotografia.Filtered := True;
    tblFotografia.Open;

    tblFrequencia.Close;
    tblFrequencia.Filtered := True;
    tblFrequencia.Open;

    tblABC.Close;
    tblABC.Filtered := True;
    tblABC.Open;

    tblCenarios.Open;
    tblPadroes.Open;

    if cABC <> '' then
    begin
       tblABC.Locate('ID_ABC',cABC,[]);
       Self.Caption := Self.Caption + ' - ' + cABC;
    end;

    if cFotografia <> '' then
    begin
       tblFotografia.Locate('ID_FOTOGRAFIA',cFotografia,[]);
       Self.Caption := Self.Caption + ' - ' + cFotografia;
    end;

    if cFrequencia <> '' then
    begin
       tblFrequencia.Locate('ID_FREQUENCIA',cFrequencia,[]);
       Self.Caption := Self.Caption + ' - ' + cFrequencia;
    end;
end;

procedure TfrmDesigner.GroupFotografia;
begin
  if (frmDesigner.sSGBD = 'Microsoft Access 2007')        or
     (frmDesigner.sSGBD = 'Microsoft Access 2010')        or
     (frmDesigner.sSGBD = 'Microsoft SQL Server 2000')    or
     (frmDesigner.sSGBD = 'Microsoft SQL Server 2005')    or
     (frmDesigner.sSGBD = 'Microsoft SQL Server 2008')    or
     (frmDesigner.sSGBD = 'Microsoft SQL Server 2008 R2') or
     (frmDesigner.sSGBD = 'Microsoft SQL Server 2012')    then
  begin
    ADOQuery1.SQL.Add('SUM([' + frmFotografar.ComboBox2.Text + ']) AS _vFotografado,');
    ADOQuery1.SQL.Add('SUM([' + frmFotografar.ComboBox2.Text + ']) AS _vComparado,');
    ADOQuery1.SQL.Add('SUM([' + frmFotografar.ComboBox2.Text + ']) AS _vDiferenca,');
    ADOQuery1.SQL.Add('99.99 AS _vVariacao,');
    ADOQuery1.SQL.Add('COUNT([' + frmFotografar.ComboBox2.Text + ']) AS _qFotografado,');
    ADOQuery1.SQL.Add('COUNT([' + frmFotografar.ComboBox2.Text + ']) AS _qComparado,');
    ADOQuery1.SQL.Add('COUNT([' + frmFotografar.ComboBox2.Text + ']) AS _qDiferenca,');
    ADOQuery1.SQL.Add('99.99 AS _qVariacao,');
    ADOQuery1.SQL.Add('AVG([' + frmFotografar.ComboBox2.Text + ']) AS _uFotografado,');
    ADOQuery1.SQL.Add('AVG([' + frmFotografar.ComboBox2.Text + ']) AS _uComparado,');
    ADOQuery1.SQL.Add('AVG([' + frmFotografar.ComboBox2.Text + ']) AS _uDiferenca,');
    ADOQuery1.SQL.Add('99.99 AS _uVariacao');
  end;
  if frmDesigner.sSGBD = 'Sun MySQL 5.x' then
  begin
    ADOQuery1.SQL.Add('SUM(`' + frmFotografar.ComboBox2.Text + '`) AS _vFotografado,');
    ADOQuery1.SQL.Add('SUM(`' + frmFotografar.ComboBox2.Text + '`) AS _vComparado,');
    ADOQuery1.SQL.Add('SUM(`' + frmFotografar.ComboBox2.Text + '`) AS _vDiferenca,');
    ADOQuery1.SQL.Add('99.99 AS _vVariacao,');
    ADOQuery1.SQL.Add('COUNT(`' + frmFotografar.ComboBox2.Text + '`) AS _qFotografado,');
    ADOQuery1.SQL.Add('COUNT(`' + frmFotografar.ComboBox2.Text + '`) AS _qComparado,');
    ADOQuery1.SQL.Add('COUNT(`' + frmFotografar.ComboBox2.Text + '`) AS _qDiferenca,');
    ADOQuery1.SQL.Add('99.99 AS _qVariacao,');
    ADOQuery1.SQL.Add('AVG(`' + frmFotografar.ComboBox2.Text + '`) AS _uFotografado,');
    ADOQuery1.SQL.Add('AVG(`' + frmFotografar.ComboBox2.Text + '`) AS _uComparado,');
    ADOQuery1.SQL.Add('AVG(`' + frmFotografar.ComboBox2.Text + '`) AS _uDiferenca,');
    ADOQuery1.SQL.Add('99.99 AS _uVariacao');
  end;
end;

procedure TfrmDesigner.GroupFrequencia;
begin
  if (frmDesigner.sSGBD = 'Microsoft Access 2007')        or
     (frmDesigner.sSGBD = 'Microsoft Access 2010')        or
     (frmDesigner.sSGBD = 'Microsoft SQL Server 2000')    or
     (frmDesigner.sSGBD = 'Microsoft SQL Server 2005')    or
     (frmDesigner.sSGBD = 'Microsoft SQL Server 2008')    or
     (frmDesigner.sSGBD = 'Microsoft SQL Server 2008 R2') or
     (frmDesigner.sSGBD = 'Microsoft SQL Server 2012')    then
  begin
    ADOQuery1.SQL.Add('MIN([' + frmFrequencia.ComboBox1.Text + ']) AS _minFrequencia,');
    ADOQuery1.SQL.Add('MAX([' + frmFrequencia.ComboBox1.Text + ']) AS _maxFrequencia,');
    ADOQuery1.SQL.Add('COUNT([' + frmFrequencia.ComboBox1.Text + ']) AS _countFrequencia,');
    ADOQuery1.SQL.Add('SUM([' + frmFrequencia.ComboBox2.Text + ']) AS _somaFrequencia,');
    ADOQuery1.SQL.Add(' 0 AS _diasFrequencia,');
    ADOQuery1.SQL.Add(' 99.99 AS _frequenciaFrequencia,');
    ADOQuery1.SQL.Add(' 0 AS _ressenciaFrequencia,');
    ADOQuery1.SQL.Add('SUM([' + frmFrequencia.ComboBox2.Text + ']) AS _individualFrequencia,');
    ADOQuery1.SQL.Add(' 0 AS _diasAcima');
  end;
  if frmDesigner.sSGBD = 'Sun MySQL 5.x' then
  begin
    ADOQuery1.SQL.Add('MIN(`' + frmFrequencia.ComboBox1.Text + '`) AS _minFrequencia,');
    ADOQuery1.SQL.Add('MAX(`' + frmFrequencia.ComboBox1.Text + '`) AS _maxFrequencia,');
    ADOQuery1.SQL.Add('COUNT(`' + frmFrequencia.ComboBox1.Text + '`) AS _countFrequencia,');
    ADOQuery1.SQL.Add('SUM(`' + frmFrequencia.ComboBox2.Text + '`) AS _somaFrequencia,');
    ADOQuery1.SQL.Add(' 0 AS _diasFrequencia,');
    ADOQuery1.SQL.Add(' 99.99 AS _frequenciaFrequencia,');
    ADOQuery1.SQL.Add(' 0 AS _ressenciaFrequencia,');
    ADOQuery1.SQL.Add('SUM(`' + frmFrequencia.ComboBox2.Text + '`) AS _individualFrequencia,');
    ADOQuery1.SQL.Add(' 0 AS _diasAcima');
  end;
end;

procedure TfrmDesigner.FiltraDataFrequencia(auxFim: string; auxIni: string);
begin
  if (frmDesigner.sSGBD = 'Microsoft Access 2007') or
     (frmDesigner.sSGBD = 'Microsoft Access 2010') then
  begin
    if (ListBox2.Items.Count > 0) or (cFiltroPersonalizado <> '') then
    begin
      ADOQuery1.SQL.Add('AND [' + frmFrequencia.ComboBox1.Text + '] >= CVDATE(' + #39 + DateToStr(frmFrequencia.edtFre_ini.Date) + #39 + ')');
      ADOQuery1.SQL.Add('AND [' + frmFrequencia.ComboBox1.Text + '] <= CVDATE(' + #39 + DateToStr(frmFrequencia.edtFre_fim.Date) + #39 + ')');
    end
    else
    begin
      ADOQuery1.SQL.Add('WHERE [' + frmFrequencia.ComboBox1.Text + '] >= CVDATE(' + #39 + DateToStr(frmFrequencia.edtFre_ini.Date) + #39 + ')');
      ADOQuery1.SQL.Add('AND   [' + frmFrequencia.ComboBox1.Text + '] <= CVDATE(' + #39 + DateToStr(frmFrequencia.edtFre_fim.Date) + #39 + ')');
    end;
  end;

  if (frmDesigner.sSGBD = 'Microsoft SQL Server 2000')    or
     (frmDesigner.sSGBD = 'Microsoft SQL Server 2005')    or
     (frmDesigner.sSGBD = 'Microsoft SQL Server 2008')    or
     (frmDesigner.sSGBD = 'Microsoft SQL Server 2008 R2') or
     (frmDesigner.sSGBD = 'Microsoft SQL Server 2012')    then
  begin
    if (ListBox2.Items.Count > 0) or (cFiltroPersonalizado <> '') then
    begin
      ADOQuery1.SQL.Add('AND [' + frmFrequencia.ComboBox1.Text + '] >= CONVERT(DATETIME,' + #39 + DateToStr(frmFrequencia.edtFre_ini.Date) + #39 + ',103)');
      ADOQuery1.SQL.Add('AND [' + frmFrequencia.ComboBox1.Text + '] <= CONVERT(DATETIME,' + #39 + DateToStr(frmFrequencia.edtFre_fim.Date) + #39 + ',103)');
    end
    else
    begin
      ADOQuery1.SQL.Add('WHERE [' + frmFrequencia.ComboBox1.Text + '] >= CONVERT(DATETIME,' + #39 + DateToStr(frmFrequencia.edtFre_ini.Date) + #39 + ',103)');
      ADOQuery1.SQL.Add('AND   [' + frmFrequencia.ComboBox1.Text + '] <= CONVERT(DATETIME,' + #39 + DateToStr(frmFrequencia.edtFre_fim.Date) + #39 + ',103)');
    end;
  end;

  if frmDesigner.sSGBD = 'Sun MySQL 5.x' then
  begin
    auxIni := #39 + NumEntry(3, DateToStr(frmFrequencia.edtFre_ini.Date), '/') + '-' + NumEntry(2, DateToStr(frmFrequencia.edtFre_ini.Date), '/') + '-' + NumEntry(1, DateToStr(frmFrequencia.edtFre_ini.Date), '/') + #39;
    auxFim := #39 + NumEntry(3, DateToStr(frmFrequencia.edtFre_fim.Date), '/') + '-' + NumEntry(2, DateToStr(frmFrequencia.edtFre_fim.Date), '/') + '-' + NumEntry(1, DateToStr(frmFrequencia.edtFre_fim.Date), '/') + #39;
    if (ListBox2.Items.Count > 0) or (cFiltroPersonalizado <> '') then
    begin
      ADOQuery1.SQL.Add('AND `' + frmFrequencia.ComboBox1.Text + '` >= CAST(' + auxIni + ' AS DATE)');
      ADOQuery1.SQL.Add('AND `' + frmFrequencia.ComboBox1.Text + '` <= CAST(' + auxFim + ' AS DATE)');
    end
    else
    begin
      ADOQuery1.SQL.Add('WHERE `' + frmFrequencia.ComboBox1.Text + '` >= CAST(' + auxIni + ' AS DATE)');
      ADOQuery1.SQL.Add('AND `' + frmFrequencia.ComboBox1.Text + '` <= CAST(' + auxFim + ' AS DATE)');
    end;
  end;
end;

procedure TfrmDesigner.FiltraDataFotografia(var auxIni: string; var auxFim: string);
begin
  if (frmDesigner.sSGBD = 'Microsoft Access 2007') or
     (frmDesigner.sSGBD = 'Microsoft Access 2010') then
  begin
    if lFotografiaFoto then
    begin
      if (ListBox2.Items.Count > 0) or (cFiltroPersonalizado <> '') then
      begin
        ADOQuery1.SQL.Add('AND [' + frmFotografar.ComboBox1.Text + '] >= CVDATE(' + #39 + DateToStr(frmFotografar.edtFot_ini.Date) + #39 + ')');
        ADOQuery1.SQL.Add('AND [' + frmFotografar.ComboBox1.Text + '] <= CVDATE(' + #39 + DateToStr(frmFotografar.edtFot_fim.Date) + #39 + ')');
      end
      else
      begin
        ADOQuery1.SQL.Add('WHERE [' + frmFotografar.ComboBox1.Text + '] >= CVDATE(' + #39 + DateToStr(frmFotografar.edtFot_ini.Date) + #39 + ')');
        ADOQuery1.SQL.Add('AND   [' + frmFotografar.ComboBox1.Text + '] <= CVDATE(' + #39 + DateToStr(frmFotografar.edtFot_fim.Date) + #39 + ')');
      end;
    end
    else
    begin
      if (ListBox2.Items.Count > 0) or (cFiltroPersonalizado <> '') then
      begin
        ADOQuery1.SQL.Add('AND [' + frmFotografar.ComboBox1.Text + '] >= CVDATE(' + #39 + DateToStr(frmFotografar.edtCom_ini.Date) + #39 + ')');
        ADOQuery1.SQL.Add('AND [' + frmFotografar.ComboBox1.Text + '] <= CVDATE(' + #39 + DateToStr(frmFotografar.edtCom_fim.Date) + #39 + ')');
      end
      else
      begin
        ADOQuery1.SQL.Add('WHERE [' + frmFotografar.ComboBox1.Text + '] >= CVDATE(' + #39 + DateToStr(frmFotografar.edtCom_ini.Date) + #39 + ')');
        ADOQuery1.SQL.Add('AND   [' + frmFotografar.ComboBox1.Text + '] <= CVDATE(' + #39 + DateToStr(frmFotografar.edtCom_fim.Date) + #39 + ')');
      end;
    end;
  end;

  if (frmDesigner.sSGBD = 'Microsoft SQL Server 2000')    or
     (frmDesigner.sSGBD = 'Microsoft SQL Server 2005')    or
     (frmDesigner.sSGBD = 'Microsoft SQL Server 2008')    or
     (frmDesigner.sSGBD = 'Microsoft SQL Server 2008 R2') or
     (frmDesigner.sSGBD = 'Microsoft SQL Server 2012')    then
  begin
    if lFotografiaFoto then
    begin
      if (ListBox2.Items.Count > 0) or (cFiltroPersonalizado <> '') then
      begin
        ADOQuery1.SQL.Add('AND [' + frmFotografar.ComboBox1.Text + '] >= CONVERT(DATETIME,' + #39 + DateToStr(frmFotografar.edtFot_ini.Date) + #39 + ',103)');
        ADOQuery1.SQL.Add('AND [' + frmFotografar.ComboBox1.Text + '] <= CONVERT(DATETIME,' + #39 + DateToStr(frmFotografar.edtFot_fim.Date) + #39 + ',103)');
      end
      else
      begin
        ADOQuery1.SQL.Add('WHERE [' + frmFotografar.ComboBox1.Text + '] >= CONVERT(DATETIME,' + #39 + DateToStr(frmFotografar.edtFot_ini.Date) + #39 + ',103)');
        ADOQuery1.SQL.Add('AND   [' + frmFotografar.ComboBox1.Text + '] <= CONVERT(DATETIME,' + #39 + DateToStr(frmFotografar.edtFot_fim.Date) + #39 + ',103)');
      end;
    end
    else
    begin
      if (ListBox2.Items.Count > 0) or (cFiltroPersonalizado <> '') then
      begin
        ADOQuery1.SQL.Add('AND [' + frmFotografar.ComboBox1.Text + '] >= CONVERT(DATETIME,' + #39 + DateToStr(frmFotografar.edtCom_ini.Date) + #39 + ',103)');
        ADOQuery1.SQL.Add('AND [' + frmFotografar.ComboBox1.Text + '] <= CONVERT(DATETIME,' + #39 + DateToStr(frmFotografar.edtCom_fim.Date) + #39 + ',103)');
      end
      else
      begin
        ADOQuery1.SQL.Add('WHERE [' + frmFotografar.ComboBox1.Text + '] >= CONVERT(DATETIME,' + #39 + DateToStr(frmFotografar.edtCom_ini.Date) + #39 + ',103)');
        ADOQuery1.SQL.Add('AND   [' + frmFotografar.ComboBox1.Text + '] <= CONVERT(DATETIME,' + #39 + DateToStr(frmFotografar.edtCom_fim.Date) + #39 + ',103)');
      end;
    end;
  end;

  if frmDesigner.sSGBD = 'Sun MySQL 5.x' then
  begin
    if lFotografiaFoto then
    begin
      auxIni := #39 + NumEntry(3, DateToStr(frmFotografar.edtFot_ini.Date), '/') + '-' + NumEntry(2, DateToStr(frmFotografar.edtFot_ini.Date), '/') + '-' + NumEntry(1, DateToStr(frmFotografar.edtFot_ini.Date), '/') + #39;
      auxFim := #39 + NumEntry(3, DateToStr(frmFotografar.edtFot_fim.Date), '/') + '-' + NumEntry(2, DateToStr(frmFotografar.edtFot_fim.Date), '/') + '-' + NumEntry(1, DateToStr(frmFotografar.edtFot_fim.Date), '/') + #39;
    end
    else
    begin
      auxIni := #39 + NumEntry(3, DateToStr(frmFotografar.edtCom_ini.Date), '/') + '-' + NumEntry(2, DateToStr(frmFotografar.edtCom_ini.Date), '/') + '-' + NumEntry(1, DateToStr(frmFotografar.edtCom_ini.Date), '/') + #39;
      auxFim := #39 + NumEntry(3, DateToStr(frmFotografar.edtCom_fim.Date), '/') + '-' + NumEntry(2, DateToStr(frmFotografar.edtCom_fim.Date), '/') + '-' + NumEntry(1, DateToStr(frmFotografar.edtCom_fim.Date), '/') + #39;
    end;
    if (ListBox2.Items.Count > 0) or (cFiltroPersonalizado <> '') then
    begin
      ADOQuery1.SQL.Add('AND `' + frmFotografar.ComboBox1.Text + '` >= CAST(' + auxIni + ' AS DATE)');
      ADOQuery1.SQL.Add('AND `' + frmFotografar.ComboBox1.Text + '` <= CAST(' + auxFim + ' AS DATE)');
    end
    else
    begin
      ADOQuery1.SQL.Add('WHERE `' + frmFotografar.ComboBox1.Text + '` >= CAST(' + auxIni + ' AS DATE)');
      ADOQuery1.SQL.Add('AND `' + frmFotografar.ComboBox1.Text + '` <= CAST(' + auxFim + ' AS DATE)');
    end;
  end;
end;

procedure TfrmDesigner.MontaFrom;
begin
  if (frmDesigner.sSGBD = 'Microsoft Access 2007')        or
     (frmDesigner.sSGBD = 'Microsoft Access 2010')        or
     (frmDesigner.sSGBD = 'Microsoft SQL Server 2000')    or
     (frmDesigner.sSGBD = 'Microsoft SQL Server 2005')    or
     (frmDesigner.sSGBD = 'Microsoft SQL Server 2008')    or
     (frmDesigner.sSGBD = 'Microsoft SQL Server 2008 R2') or
     (frmDesigner.sSGBD = 'Microsoft SQL Server 2012')    then
  begin
    if (frmDesigner.tblAnalisesBASE_ORIGEM.Value = '.') and (frmDesigner.tblAnalisesVISAO_ORIGEM.Value = '.') then
      ADOQuery1.SQL.Add('FROM ' + '[' + frmDesigner.tblAnalisesVISAO_DESTINO.Value + ']')
    else
      ADOQuery1.SQL.Add('FROM ' + '[_' + frmDesigner.tblAnalisesVISAO_DESTINO.Value + ']');
  end;
  if frmDesigner.sSGBD = 'Sun MySQL 5.x' then
  begin
    if (frmDesigner.tblAnalisesBASE_ORIGEM.Value = '.') and (frmDesigner.tblAnalisesVISAO_ORIGEM.Value = '.') then
      ADOQuery1.SQL.Add('FROM ' + '`' + frmDesigner.tblAnalisesVISAO_DESTINO.Value + '`')
    else
      ADOQuery1.SQL.Add('FROM ' + '`_' + frmDesigner.tblAnalisesVISAO_DESTINO.Value + '`');
  end;
end;

procedure TfrmDesigner.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmDesigner.MontaTela;
var
    i,a : integer;
    lPode : boolean;
begin
    vA := 100;
    vB := 90;
    vC := 80;
    vD := 70;
    vE := 40;

    rgpOrdem.Properties.Items.Items[0].Caption := HCLResourceStrings.FindID('sString_332');
    rgpOrdem.Properties.Items.Items[1].Caption := HCLResourceStrings.FindID('sString_333');

    cbxOrdem.Properties.Items.Clear;

    cbxOrdem.Properties.Items.Add(HCLResourceStrings.FindID('sString_331'));
    cbxOrdem.Text := HCLResourceStrings.FindID('sString_331');

    lstAnaliseIgnorados.Items.Clear;
    lstValorIgnorados.Items.Clear;

    lstAnaliseIgnorados.Items.Text := frmDesigner.tblAnalisesANALISES_IGNORADOS.Value;
    lstValorIgnorados.Items.Text   := frmDesigner.tblAnalisesVALORES_IGNORADOS.Value;

    CheckListBox2.Items.Clear;

    if (frmDesigner.tblAnalisesBASE_ORIGEM.Value  = '.') and
       (frmDesigner.tblAnalisesVISAO_ORIGEM.Value = '.') then
        frmDesigner.bdArmazena.GetFieldNames(frmDesigner.tblAnalisesVISAO_DESTINO.Value,ListBox1.Items)
    else
       frmDesigner.bdArmazena.GetFieldNames('_' + frmDesigner.tblAnalisesVISAO_DESTINO.Value,ListBox1.Items);

    for i := 0 to ListBox1.Items.Count - 1 do
        CheckListBox2.Items.Add.Text := ListBox1.Items.Strings[i];

    a := 0;
    while a <= CheckListBox2.Items.Count - 1 do
    begin
        lPode := True;
        for i := 0 to lstAnaliseIgnorados.Items.Count - 1 do
            if lstAnaliseIgnorados.Items.Strings[i] = CheckListBox2.Items.Items[a].Text then
            begin
                CheckListBox2.Items.Delete(a);
                lPode := False;
            end;
        if lPode then
           a := a + 1;
    end;

    lstValor.Clear;
    lstData.Clear;

    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;

    if (frmDesigner.sSGBD = 'Microsoft Access 2007')        or
       (frmDesigner.sSGBD = 'Microsoft Access 2010')        or
       (frmDesigner.sSGBD = 'Microsoft SQL Server 2000')    or
       (frmDesigner.sSGBD = 'Microsoft SQL Server 2005')    or
       (frmDesigner.sSGBD = 'Microsoft SQL Server 2008')    or
       (frmDesigner.sSGBD = 'Microsoft SQL Server 2008 R2') or
       (frmDesigner.sSGBD = 'Microsoft SQL Server 2012')    then
    begin
        if (frmDesigner.tblAnalisesBASE_ORIGEM.Value  = '.') and
           (frmDesigner.tblAnalisesVISAO_ORIGEM.Value = '.') then
            ADOQuery1.SQL.Add('SELECT TOP 1 * FROM ' + '[' + frmDesigner.tblAnalisesVISAO_DESTINO.Value + ']')
        else
            ADOQuery1.SQL.Add('SELECT TOP 1 * FROM ' + '[_' + frmDesigner.tblAnalisesVISAO_DESTINO.Value + ']');
    end;

    if frmDesigner.sSGBD = 'Sun MySQL 5.x' then
    begin
        if (frmDesigner.tblAnalisesBASE_ORIGEM.Value  = '.') and
           (frmDesigner.tblAnalisesVISAO_ORIGEM.Value = '.') then
        begin
            ADOQuery1.SQL.Add('SELECT * FROM ' + '`' + frmDesigner.tblAnalisesVISAO_DESTINO.Value + '`');
            ADOQuery1.SQL.Add('LIMIT 0,1');
        end
        else
        begin
            ADOQuery1.SQL.Add('SELECT * FROM ' + '`_' + frmDesigner.tblAnalisesVISAO_DESTINO.Value + '`');
            ADOQuery1.SQL.Add('LIMIT 0,1');
        end;
    end;

    ADOQuery1.Open;
    CheckListBox3.Items.Clear;

    for i := 0 to ADOQuery1.Fields.Count - 1 do
    begin
       if (ADOQuery1.FieldByName(ADOQuery1.Fields[i].FieldName).DataType = ftSmallint) or
          (ADOQuery1.FieldByName(ADOQuery1.Fields[i].FieldName).DataType = ftInteger)  or
          (ADOQuery1.FieldByName(ADOQuery1.Fields[i].FieldName).DataType = ftWord)     or
          (ADOQuery1.FieldByName(ADOQuery1.Fields[i].FieldName).DataType = ftFloat)    or
          (ADOQuery1.FieldByName(ADOQuery1.Fields[i].FieldName).DataType = ftCurrency) or
          (ADOQuery1.FieldByName(ADOQuery1.Fields[i].FieldName).DataType = ftBCD)      or
          (ADOQuery1.FieldByName(ADOQuery1.Fields[i].FieldName).DataType = ftAutoInc)  or
          (ADOQuery1.FieldByName(ADOQuery1.Fields[i].FieldName).DataType = ftLargeint) then
       begin
           lPode := True;
           for a := 0 to lstValorIgnorados.Items.Count - 1 do
               if lstValorIgnorados.Items.Strings[a] = ADOQuery1.Fields[i].FieldName then
                  lPode := False;
           if lPode then
           begin
               CheckListBox3.Items.Add.Text := (HCLResourceStrings.FindID('sString_234') + ' ' + ADOQuery1.Fields[i].FieldName);
               CheckListBox3.Items.Add.Text := (HCLResourceStrings.FindID('sString_235') + ' ' + ADOQuery1.Fields[i].FieldName);
               CheckListBox3.Items.Add.Text := (HCLResourceStrings.FindID('sString_236') + ' ' + ADOQuery1.Fields[i].FieldName);
               CheckListBox3.Items.Add.Text := (HCLResourceStrings.FindID('sString_237') + ' ' + ADOQuery1.Fields[i].FieldName);
               CheckListBox3.Items.Add.Text := (HCLResourceStrings.FindID('sString_238') + ' ' + ADOQuery1.Fields[i].FieldName);
               lstValor.Items.Add(ADOQuery1.Fields[i].FieldName);
           end;
       end
       else
       if (ADOQuery1.FieldByName(ADOQuery1.Fields[i].FieldName).DataType = ftDate)     or
          (ADOQuery1.FieldByName(ADOQuery1.Fields[i].FieldName).DataType = ftDateTime) then
       begin
           lPode := True;
           for a := 0 to lstAnaliseIgnorados.Items.Count - 1 do
               if lstAnaliseIgnorados.Items.Strings[a] = ADOQuery1.Fields[i].FieldName then
                  lPode := False;
           if lPode then
           begin
               CheckListBox2.Items.Add.Text := (HCLResourceStrings.FindID('sString_239') + ' ' + ADOQuery1.Fields[i].FieldName);
               CheckListBox2.Items.Add.Text := (HCLResourceStrings.FindID('sString_240') + ' ' + ADOQuery1.Fields[i].FieldName);
               CheckListBox2.Items.Add.Text := (HCLResourceStrings.FindID('sString_241') + ' ' + ADOQuery1.Fields[i].FieldName);
               lstData.Items.Add(ADOQuery1.Fields[i].FieldName);
           end;
       end;
    end;
    ADOQuery1.Close;
end;

procedure TfrmDesigner.FormShow(Sender: TObject);
begin
    if (sOperacao = 'Visualizar') then
    begin
        tblAnalises.Locate('ID_ANALISE',cAnalise,[]);
        MontaTela;
        Self.Caption := Self.Caption + ' - ' + cAnalise;
    end;

    if (sOperacao = 'Frequencia') or (sOperacao = 'VisualizarFrequencia') then
    begin
        tblAnalises.Locate('ID_ANALISE',cAnalise,[]);
        tblCenarios.Locate('ID_FREQUENCIA;ID_USUARIO',VarArrayOf([cFrequencia,sUsuario]),[]);

        MontaTela;
        ComboBox1.Properties.Items.Clear;
        ComboBox1.Properties.Items.Add(tblCenariosID_CENARIO.Value);
        ComboBox1.Text := tblCenariosID_CENARIO.Value;

        cbxOrdem.Text := tblCenariosORDEM.Value;

        if tblCenariosORDEM.Value = 'C' then
           rgpOrdem.ItemIndex := 0
        else
           rgpOrdem.ItemIndex := 1;

        edtLinha.EditValue := tblCenariosLINHAS.Value;

        ComboBox1.Enabled     := False;
        SpeedButton9.Enabled  := False;
        SpeedButton10.Enabled := False;
        cxButton5.Enabled     := False;
        SpeedButton11.Enabled := False;
        SpeedButton4.Enabled  := False;
        SpeedButton7.Enabled  := False;

        if sOperacao = 'VisualizarFrequencia' then
           Timer1.Enabled := True;
    end;

    if (sOperacao = 'ABC') or (sOperacao = 'VisualizarABC') then
    begin
        tblAnalises.Locate('ID_ANALISE',cAnalise,[]);
        tblCenarios.Locate('ID_ABC;ID_USUARIO',VarArrayOf([cABC,sUsuario]),[]);

        MontaTela;
        ComboBox1.Properties.Items.Clear;
        ComboBox1.Properties.Items.Add(tblCenariosID_CENARIO.Value);
        ComboBox1.Text := tblCenariosID_CENARIO.Value;

        ComboBox1.Enabled     := False;
        SpeedButton9.Enabled  := False;
        SpeedButton10.Enabled := False;
        cxButton5.Enabled     := False;
        SpeedButton11.Enabled := False;
        SpeedButton4.Enabled  := False;
        SpeedButton12.Enabled := False;

        if sOperacao = 'VisualizarABC' then
           Timer1.Enabled := True;
    end;

    if (sOperacao = 'Fotografia') or (sOperacao = 'VisualizarFotografia') then
    begin
        tblAnalises.Locate('ID_ANALISE',cAnalise,[]);
        tblCenarios.Locate('ID_FOTOGRAFIA;ID_USUARIO',VarArrayOf([cFotografia,sUsuario]),[]);

        MontaTela;
        ComboBox1.Properties.Items.Clear;
        ComboBox1.Properties.Items.Add(tblCenariosID_CENARIO.Value);
        ComboBox1.Text := tblCenariosID_CENARIO.Value;

        cbxOrdem.Text := tblCenariosORDEM.Value;

        if tblCenariosORDEM.Value = 'C' then
           rgpOrdem.ItemIndex := 0
        else
           rgpOrdem.ItemIndex := 1;

        edtLinha.EditValue := tblCenariosLINHAS.Value;

        ComboBox1.Enabled     := False;
        SpeedButton9.Enabled  := False;
        SpeedButton10.Enabled := False;
        cxButton5.Enabled     := False;
        SpeedButton12.Enabled := False;
        SpeedButton4.Enabled  := False;
        SpeedButton7.Enabled  := False;

        if sOperacao = 'VisualizarFotografia' then
           Timer1.Enabled := True;
    end;

    GeraLog(frmDesigner.bdDados,frmDesigner.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);
end;

procedure TfrmDesigner.ListBox1Click(Sender: TObject);
var
    i, a : integer;
    aux : string;
begin
    frmAguarde := TfrmAguarde.Create(Self);
    frmAguarde.cMensagem := HCLResourceStrings.FindID('sString_100');
    frmAguarde.Show;
    frmAguarde.Update;

    CheckListBox1.Enabled := False;

    try
       ADOQuery1.Close;
       ADOQuery1.SQL.Clear;
       if (frmDesigner.tblAnalisesBASE_ORIGEM.Value  = '.') and
          (frmDesigner.tblAnalisesVISAO_ORIGEM.Value = '.') then
       begin
           if (frmDesigner.sSGBD = 'Microsoft Access 2007')        or
              (frmDesigner.sSGBD = 'Microsoft Access 2010')        or
              (frmDesigner.sSGBD = 'Microsoft SQL Server 2000')    or
              (frmDesigner.sSGBD = 'Microsoft SQL Server 2005')    or
              (frmDesigner.sSGBD = 'Microsoft SQL Server 2008')    or
              (frmDesigner.sSGBD = 'Microsoft SQL Server 2008 R2') or
              (frmDesigner.sSGBD = 'Microsoft SQL Server 2012')    then
           begin
               if edtRegistros.Value <> 0 then
                  ADOQuery1.SQL.Add('SELECT TOP ' + edtRegistros.Text + ' [' + ListBox1.Items.Strings[ListBox1.ItemIndex] + '] FROM ' + '[' + frmDesigner.tblAnalisesVISAO_DESTINO.Value + ']')
               else
                  ADOQuery1.SQL.Add('SELECT [' + ListBox1.Items.Strings[ListBox1.ItemIndex] + '] FROM ' + '[' + frmDesigner.tblAnalisesVISAO_DESTINO.Value + ']');
           end;

           if frmDesigner.sSGBD = 'Sun MySQL 5.x' then
              ADOQuery1.SQL.Add('SELECT `' + ListBox1.Items.Strings[ListBox1.ItemIndex] + '` FROM `' + frmDesigner.tblAnalisesVISAO_DESTINO.Value + '`');
       end
       else
       begin
           if (frmDesigner.sSGBD = 'Microsoft Access 2007')        or
              (frmDesigner.sSGBD = 'Microsoft Access 2010')        or
              (frmDesigner.sSGBD = 'Microsoft SQL Server 2000')    or
              (frmDesigner.sSGBD = 'Microsoft SQL Server 2005')    or
              (frmDesigner.sSGBD = 'Microsoft SQL Server 2008')    or
              (frmDesigner.sSGBD = 'Microsoft SQL Server 2008 R2') or
              (frmDesigner.sSGBD = 'Microsoft SQL Server 2012')    then
           begin
               if edtRegistros.Value <> 0 then
                  ADOQuery1.SQL.Add('SELECT TOP ' + edtRegistros.Text + ' [' + ListBox1.Items.Strings[ListBox1.ItemIndex] + '] FROM ' + '[_' + frmDesigner.tblAnalisesVISAO_DESTINO.Value + ']')
               else
                  ADOQuery1.SQL.Add('SELECT [' + ListBox1.Items.Strings[ListBox1.ItemIndex] + '] FROM ' + '[_' + frmDesigner.tblAnalisesVISAO_DESTINO.Value + ']');
           end;

           if frmDesigner.sSGBD = 'Sun MySQL 5.x' then
              ADOQuery1.SQL.Add('SELECT `' + ListBox1.Items.Strings[ListBox1.ItemIndex] + '` FROM ' + '`_' + frmDesigner.tblAnalisesVISAO_DESTINO.Value + '`');
       end;

       if (frmDesigner.sSGBD = 'Microsoft Access 2007')        or
          (frmDesigner.sSGBD = 'Microsoft Access 2010')        or
          (frmDesigner.sSGBD = 'Microsoft SQL Server 2000')    or
          (frmDesigner.sSGBD = 'Microsoft SQL Server 2005')    or
          (frmDesigner.sSGBD = 'Microsoft SQL Server 2008')    or
          (frmDesigner.sSGBD = 'Microsoft SQL Server 2008 R2') or
          (frmDesigner.sSGBD = 'Microsoft SQL Server 2012')    then
          ADOQuery1.SQL.Add('GROUP BY [' + ListBox1.Items.Strings[ListBox1.ItemIndex] + ']');

       if frmDesigner.sSGBD = 'Sun MySQL 5.x' then
       begin
          if edtRegistros.Value <> 0 then
             ADOQuery1.SQL.Add('GROUP BY `' + ListBox1.Items.Strings[ListBox1.ItemIndex] + '` LIMIT 0,' + edtRegistros.Text)
          else
             ADOQuery1.SQL.Add('GROUP BY `' + ListBox1.Items.Strings[ListBox1.ItemIndex] + '`');
       end;

       ADOQuery1.Open;

       CheckListBox1.Items.Clear;
       ListBox3.Clear;

       frmAguarde.Label2.Visible := False;
       frmAguarde.cxProgressBar1.Visible := True;
       frmAguarde.cxProgressBar1.Properties.Max := ADOQuery1.RecordCount;
       frmAguarde.cxProgressBar1.Position := 0;
       frmAguarde.Update;

       ADOQuery1.First;
       while not ADOQuery1.Eof do
       begin
           CheckListBox1.Items.Add.Text := ADOQuery1.Fields[0].AsString;

           if ADOQuery1.Fields[0].IsNull then
           begin
               ListBox3.Items.Add(' Is Null');
           end
           else
           begin
               if (ADOQuery1.Fields[0].DataType = ftSmallint) or
                  (ADOQuery1.Fields[0].DataType = ftInteger)  or
                  (ADOQuery1.Fields[0].DataType = ftWord)     or
                  (ADOQuery1.Fields[0].DataType = ftFloat)    or
                  (ADOQuery1.Fields[0].DataType = ftCurrency) or
                  (ADOQuery1.Fields[0].DataType = ftBCD)      or
                  (ADOQuery1.Fields[0].DataType = ftAutoInc)  or
                  (ADOQuery1.Fields[0].DataType = ftLargeint) then
               begin
                  aux := StringReplace(ADOQuery1.Fields[0].AsString,'.','',[rfReplaceAll]);
                  aux := StringReplace(aux,',','.',[rfReplaceAll]);

                  ListBox3.Items.Add(' = ' + aux);
               end
               else
               if (ADOQuery1.Fields[0].DataType = ftDate)     or
                  (ADOQuery1.Fields[0].DataType = ftDateTime) then
               begin
                   if (frmDesigner.sSGBD = 'Microsoft Access 2007') or
                      (frmDesigner.sSGBD = 'Microsoft Access 2010') then
                      ListBox3.Items.Add(' = CVDATE(' + #39 + ADOQuery1.Fields[0].AsString + #39 + ')');

                   if (frmDesigner.sSGBD = 'Microsoft SQL Server 2000')    or
                      (frmDesigner.sSGBD = 'Microsoft SQL Server 2005')    or
                      (frmDesigner.sSGBD = 'Microsoft SQL Server 2008')    or
                      (frmDesigner.sSGBD = 'Microsoft SQL Server 2008 R2') or
                      (frmDesigner.sSGBD = 'Microsoft SQL Server 2012')    then
                      ListBox3.Items.Add(' = CONVERT(DATETIME,' + #39 + ADOQuery1.Fields[0].AsString + #39 + ',103)');

                   if frmDesigner.sSGBD = 'Sun MySQL 5.x' then
                      ListBox3.Items.Add(' = CAST(' + #39 + NumEntry(3,ADOQuery1.Fields[0].AsString,'/') + '-' + NumEntry(2,ADOQuery1.Fields[0].AsString,'/') + '-' + NumEntry(1,ADOQuery1.Fields[0].AsString,'/') + #39 + ' AS DATE)');
               end
               else
               begin
                   ListBox3.Items.Add(' = ' + #39 + ADOQuery1.Fields[0].AsString + #39)
               end;
           end;
           frmAguarde.cxProgressBar1.Position := frmAguarde.cxProgressBar1.Position + 1;
           frmAguarde.Update;

           ADOQuery1.Next;
       end;
       ADOQuery1.Close;

       frmAguarde.cxProgressBar1.Visible := False;
       frmAguarde.Label2.Visible := True;
       frmAguarde.Label2.Caption := HCLResourceStrings.FindID('sString_100');
       frmAguarde.Update;

       for i := 0 to ListBox2.Items.Count - 1 do
       begin
           for a := 0 to CheckListBox1.Items.Count - 1 do
           begin
               if (frmDesigner.sSGBD = 'Microsoft Access 2007')        or
                  (frmDesigner.sSGBD = 'Microsoft Access 2010')        or
                  (frmDesigner.sSGBD = 'Microsoft SQL Server 2000')    or
                  (frmDesigner.sSGBD = 'Microsoft SQL Server 2005')    or
                  (frmDesigner.sSGBD = 'Microsoft SQL Server 2008')    or
                  (frmDesigner.sSGBD = 'Microsoft SQL Server 2008 R2') or
                  (frmDesigner.sSGBD = 'Microsoft SQL Server 2012')    then
                  if ListBox2.Items.Strings[i] = '[' + ListBox1.Items.Strings[ListBox1.ItemIndex] + ']' + ListBox3.Items.Strings[a] then
                     CheckListBox1.Items.Items[a].Checked := True;

               if frmDesigner.sSGBD = 'Sun MySQL 5.x' then
                  if ListBox2.Items.Strings[i] = '`' + ListBox1.Items.Strings[ListBox1.ItemIndex] + '`' + ListBox3.Items.Strings[a] then
                     CheckListBox1.Items.Items[a].Checked := True;
           end;
       end;
    except
    end;

    CheckListBox1.Enabled := True;
    
    FreeAndNil(frmAguarde);
end;

procedure TfrmDesigner.SpeedButton2Click(Sender: TObject);
var
    i : integer;
begin
    for i := 0 to CheckListBox1.Items.Count - 1 do
    begin
        if not CheckListBox1.Items.Items[i].Checked then
        begin
            CheckListBox1.Items.Items[i].Checked := True;

            if (frmDesigner.sSGBD = 'Microsoft Access 2007')        or
               (frmDesigner.sSGBD = 'Microsoft Access 2010')        or
               (frmDesigner.sSGBD = 'Microsoft SQL Server 2000')    or
               (frmDesigner.sSGBD = 'Microsoft SQL Server 2005')    or
               (frmDesigner.sSGBD = 'Microsoft SQL Server 2008')    or
               (frmDesigner.sSGBD = 'Microsoft SQL Server 2008 R2') or
               (frmDesigner.sSGBD = 'Microsoft SQL Server 2012')    then
               ListBox2.Items.Add('[' + ListBox1.Items.Strings[ListBox1.ItemIndex] + ']' + ListBox3.Items.Strings[i]);

            if frmDesigner.sSGBD = 'Sun MySQL 5.x' then
               ListBox2.Items.Add('`' + ListBox1.Items.Strings[ListBox1.ItemIndex] + '`' + ListBox3.Items.Strings[i]);
        end;
    end;
end;

procedure TfrmDesigner.SpeedButton3Click(Sender: TObject);
var
    i, a : integer;
begin
    for i := 0 to CheckListBox1.Items.Count - 1 do
    begin
        if CheckListBox1.Items.Items[i].Checked then
        begin
            CheckListBox1.Items.Items[i].Checked := False;
            a := 0;
            while a <= ListBox2.Items.Count - 1 do
            begin
                if (frmDesigner.sSGBD = 'Microsoft Access 2007')        or
                   (frmDesigner.sSGBD = 'Microsoft Access 2010')        or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2000')    or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2005')    or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2008')    or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2008 R2') or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2012')    then
                begin
                    if ListBox2.Items.Strings[a] = '[' + ListBox1.Items.Strings[ListBox1.ItemIndex] + ']' + ListBox3.Items.Strings[i] then
                       ListBox2.Items.Delete(a)
                    else
                       a := a + 1;
                end;
                if frmDesigner.sSGBD = 'Sun MySQL 5.x' then
                begin
                    if ListBox2.Items.Strings[a] = '`' + ListBox1.Items.Strings[ListBox1.ItemIndex] + '`' + ListBox3.Items.Strings[i] then
                       ListBox2.Items.Delete(a)
                    else
                       a := a + 1;
                end;
            end;
        end;
    end;
end;

procedure TfrmDesigner.MontaCabecalho(i: integer);
var
    nome       : string;
    a          : integer;
    lCampoData : boolean;
begin
    if CheckListBox2.Items.Items[i].Checked then
    begin
       lCampoData := False;
       nome       := Trim(Copy(CheckListBox2.Items.Items[i].Text, 10, Length(CheckListBox2.Items.Items[i].Text) - 9));

       for a := 0 to lstData.Items.Count - 1 do
           if lstData.Items.Strings[a] = CheckListBox2.Items.Items[i].Text then
              lCampoData := True;

       if campos <> '' then
       begin
           campos  := campos  + ', ';
           campos1 := campos1 + ', ';
       end;

       if Copy(CheckListBox2.Items.Items[i].Text, 1, 9) = HCLResourceStrings.FindID('sString_239') then
       begin
           if (frmDesigner.sSGBD = 'Microsoft Access 2007')        or
              (frmDesigner.sSGBD = 'Microsoft Access 2010')        or
              (frmDesigner.sSGBD = 'Microsoft SQL Server 2000')    or
              (frmDesigner.sSGBD = 'Microsoft SQL Server 2005')    or
              (frmDesigner.sSGBD = 'Microsoft SQL Server 2008')    or
              (frmDesigner.sSGBD = 'Microsoft SQL Server 2008 R2') or
              (frmDesigner.sSGBD = 'Microsoft SQL Server 2012')    then
           begin
               campos  := campos  + 'DAY([' + nome + ']) AS [Dia' + nome + ']';
               campos1 := campos1 + 'DAY([' + nome + '])';
           end;
           if frmDesigner.sSGBD = 'Sun MySQL 5.x' then
           begin
               campos  := campos  + 'DAY(`' + nome + '`) AS `Dia' + nome + '`';
               campos1 := campos1 + 'DAY(`' + nome + '`)';
           end;
       end
       else
       if Copy(CheckListBox2.Items.Items[i].Text, 1, 9) = HCLResourceStrings.FindID('sString_240') then
       begin
           if (frmDesigner.sSGBD = 'Microsoft Access 2007')        or
              (frmDesigner.sSGBD = 'Microsoft Access 2010')        or
              (frmDesigner.sSGBD = 'Microsoft SQL Server 2000')    or
              (frmDesigner.sSGBD = 'Microsoft SQL Server 2005')    or
              (frmDesigner.sSGBD = 'Microsoft SQL Server 2008')    or
              (frmDesigner.sSGBD = 'Microsoft SQL Server 2008 R2') or
              (frmDesigner.sSGBD = 'Microsoft SQL Server 2012')    then
           begin
               campos  := campos  + 'MONTH([' + nome + ']) AS [Mes' + nome + ']';
               campos1 := campos1 + 'MONTH([' + nome + '])';
           end;
           if frmDesigner.sSGBD = 'Sun MySQL 5.x' then
           begin
               campos  := campos  + 'MONTH(`' + nome + '`) AS `Mes' + nome + '`';
               campos1 := campos1 + 'MONTH(`' + nome + '`)';
           end;
       end
       else
       if Copy(CheckListBox2.Items.Items[i].Text, 1, 9) = HCLResourceStrings.FindID('sString_241') then
       begin
           if (frmDesigner.sSGBD = 'Microsoft Access 2007')        or
              (frmDesigner.sSGBD = 'Microsoft Access 2010')        or
              (frmDesigner.sSGBD = 'Microsoft SQL Server 2000')    or
              (frmDesigner.sSGBD = 'Microsoft SQL Server 2005')    or
              (frmDesigner.sSGBD = 'Microsoft SQL Server 2008')    or
              (frmDesigner.sSGBD = 'Microsoft SQL Server 2008 R2') or
              (frmDesigner.sSGBD = 'Microsoft SQL Server 2012')    then
           begin
               campos  := campos  + 'YEAR([' + nome + ']) AS [Ano' + nome + ']';
               campos1 := campos1 + 'YEAR([' + nome + '])';
           end;
           if frmDesigner.sSGBD = 'Sun MySQL 5.x' then
           begin
               campos  := campos  + 'YEAR(`' + nome + '`) AS `Ano' + nome + '`';
               campos1 := campos1 + 'YEAR(`' + nome + '`)';
           end;
       end
       else
       if lCampoData then
       begin
           if (frmDesigner.sSGBD = 'Microsoft Access 2007') or
              (frmDesigner.sSGBD = 'Microsoft Access 2010') then
           begin
               campos  := campos  + 'CVDate([' + CheckListBox2.Items.Items[i].Text + ']) AS [' + CheckListBox2.Items.Items[i].Text + ']';
               campos1 := campos1 + 'CVDate([' + CheckListBox2.Items.Items[i].Text + '])';
           end;

           if (frmDesigner.sSGBD = 'Microsoft SQL Server 2000')    or
              (frmDesigner.sSGBD = 'Microsoft SQL Server 2005')    or
              (frmDesigner.sSGBD = 'Microsoft SQL Server 2008')    or
              (frmDesigner.sSGBD = 'Microsoft SQL Server 2008 R2') or
              (frmDesigner.sSGBD = 'Microsoft SQL Server 2012')    then
           begin
               campos  := campos  + 'CONVERT(DATETIME,[' + CheckListBox2.Items.Items[i].Text + '],103) AS [' + CheckListBox2.Items.Items[i].Text + ']';
               campos1 := campos1 + 'CONVERT(DATETIME,[' + CheckListBox2.Items.Items[i].Text + '],103)';
           end;

           if frmDesigner.sSGBD = 'Sun MySQL 5.x' then
           begin
               campos  := campos  + 'date_format(`' + CheckListBox2.Items.Items[i].Text + '`,' + #39 + '%d/%m/%Y' + #39 + ') AS `' + CheckListBox2.Items.Items[i].Text + '`';
               campos1 := campos1 + 'date_format(`' + CheckListBox2.Items.Items[i].Text + '`,' + #39 + '%d/%m/%Y' + #39 + ')';
           end;
       end
       else
       begin
           if (frmDesigner.sSGBD = 'Microsoft Access 2007')        or
              (frmDesigner.sSGBD = 'Microsoft Access 2010')        or
              (frmDesigner.sSGBD = 'Microsoft SQL Server 2000')    or
              (frmDesigner.sSGBD = 'Microsoft SQL Server 2005')    or
              (frmDesigner.sSGBD = 'Microsoft SQL Server 2008')    or
              (frmDesigner.sSGBD = 'Microsoft SQL Server 2008 R2') or
              (frmDesigner.sSGBD = 'Microsoft SQL Server 2012')    then
           begin
               campos  := campos  + '[' + CheckListBox2.Items.Items[i].Text + ']';
               campos1 := campos1 + '[' + CheckListBox2.Items.Items[i].Text + ']';
           end;
           if frmDesigner.sSGBD = 'Sun MySQL 5.x' then
           begin
               campos  := campos  + '`' + CheckListBox2.Items.Items[i].Text + '`';
               campos1 := campos1 + '`' + CheckListBox2.Items.Items[i].Text + '`';
           end;
       end;
    end;
end;

procedure TfrmDesigner.MontaDetalheItemVisualiza;
var
    i,a   : integer;
    nome  : string;
    aux   : string;
begin
    a := 0;
    for i := 0 to CheckListBox3.Items.Count - 1 do
    begin
        if CheckListBox3.Items.Items[i].Checked then
        begin
            aux := '1';
            nome := Trim(Copy(CheckListBox3.Items.Items[i].Text, 11, Length(CheckListBox3.Items.Items[i].Text) - 10));

            if Copy(CheckListBox3.Items.Items[i].Text, 1, 10) = HCLResourceStrings.FindID('sString_234') then
            begin
                if (frmDesigner.sSGBD = 'Microsoft Access 2007')        or
                   (frmDesigner.sSGBD = 'Microsoft Access 2010')        or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2000')    or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2005')    or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2008')    or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2008 R2') or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2012')    then
                begin
                    if a <> 0 then
                       ADOQuery1.SQL.Add(', SUM([' + nome + ']) AS [_Soma_' + nome + '], (SUM([' + nome + ']) * 100 / ' + aux + ') AS [_PercSoma_' + nome + '], ' + #39 + 'A' + #39 + ' AS [_ABCSoma_' + nome + '], 99.99 ' + ' AS [_ABCAcum_' + nome + ']')
                    else
                       ADOQuery1.SQL.Add('SUM([' + nome + ']) AS [_Soma_' + nome + '], (SUM([' + nome + ']) * 100 / ' + aux + ') AS [_PercSoma_' + nome + '], ' + #39 + 'A' + #39 + ' AS [_ABCSoma_' + nome + '], 99.99 ' + ' AS [_ABCAcum_' + nome + ']');
                end;
                if frmDesigner.sSGBD = 'Sun MySQL 5.x' then
                begin
                    if a <> 0 then
                       ADOQuery1.SQL.Add(', SUM(`' + nome + '`) AS `_Soma_' + nome + '`, (SUM(`' + nome + '`) * 100 / ' + aux + ') AS `_PercSoma_' + nome + '`, ' + #39 + 'A' + #39 + ' AS `_ABCSoma_' + nome + '`, 99.99' + ' AS `_ABCAcum_' + nome + '`')
                    else
                       ADOQuery1.SQL.Add('SUM(`' + nome + '`) AS `_Soma_' + nome + '`, (SUM(`' + nome + '`) * 100 / ' + aux + ') AS `_PercSoma_' + nome + '`, ' + #39 + 'A' + #39 + ' AS `_ABCSoma_' + nome + '`, 99.99' + ' AS `_ABCAcum_' + nome + '`');
                end;
            end
            else
            if Copy(CheckListBox3.Items.Items[i].Text, 1, 10) = HCLResourceStrings.FindID('sString_235') then
            begin
                if (frmDesigner.sSGBD = 'Microsoft Access 2007')        or
                   (frmDesigner.sSGBD = 'Microsoft Access 2010')        or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2000')    or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2005')    or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2008')    or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2008 R2') or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2012')    then
                begin
                   if a <> 0 then
                      ADOQuery1.SQL.Add(', COUNT([' + nome + ']) AS [_Contagem_' + nome + '], (COUNT([' + nome + ']) * 100 / ' + aux + ') AS [_PercContagem_' + nome + '], ' + #39 + 'A' + #39 + ' AS [_ABCContagem_' + nome + '], 99.99' + ' AS [_ABCAcum_' + nome + ']')
                   else
                      ADOQuery1.SQL.Add('COUNT([' + nome + ']) AS [_Contagem_' + nome + '], (COUNT([' + nome + ']) * 100 / ' + aux + ') AS [_PercContagem_' + nome + '], ' + #39 + 'A' + #39 + ' AS [_ABCContagem_' + nome + '], 99.99' + ' AS [_ABCAcum_' + nome + ']');
                end;
                if frmDesigner.sSGBD = 'Sun MySQL 5.x' then
                begin
                   if a <> 0 then
                      ADOQuery1.SQL.Add(', COUNT(`' + nome + '`) AS `_Contagem_' + nome + '`, (COUNT(`' + nome + '`) * 100 / ' + aux + ') AS `_PercContagem_' + nome + '`, ' + #39 + 'A' + #39 + ' AS `_ABCContagem_' + nome + '`, 99.99' + ' AS `_ABCAcum_' + nome + '`')
                   else
                      ADOQuery1.SQL.Add('COUNT(`' + nome + '`) AS `_Contagem_' + nome + '`, (COUNT(`' + nome + '`) * 100 / ' + aux + ') AS `_PercContagem_' + nome + '`, ' + #39 + 'A' + #39 + ' AS `_ABCContagem_' + nome + '`, 99.99' + ' AS `_ABCAcum_' + nome + '`');
                end;
            end
            else
            if Copy(CheckListBox3.Items.Items[i].Text, 1, 10) = HCLResourceStrings.FindID('sString_236') then
            begin
                if (frmDesigner.sSGBD = 'Microsoft Access 2007')        or
                   (frmDesigner.sSGBD = 'Microsoft Access 2010')        or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2000')    or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2005')    or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2008')    or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2008 R2') or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2012')    then
                begin
                   if a <> 0 then
                      ADOQuery1.SQL.Add(', AVG([' + nome + ']) AS [_Media_' + nome + '], (AVG([' + nome + ']) * 100 / ' + aux + ') AS [_PercMedia_' + nome + '], ' + #39 + 'A' + #39 + ' AS [_ABCMedia_' + nome + '], 99.99' + ' AS [_ABCAcum_' + nome + ']')
                   else
                      ADOQuery1.SQL.Add('AVG([' + nome + ']) AS [_Media_' + nome + '], (AVG([' + nome + ']) * 100 / ' + aux + ') AS [_PercMedia_' + nome + '], ' + #39 + 'A' + #39 + ' AS [_ABCMedia_' + nome + '], 99.99' + ' AS [_ABCAcum_' + nome + ']');
                end;
                if frmDesigner.sSGBD = 'Sun MySQL 5.x' then
                begin
                   if a <> 0 then
                      ADOQuery1.SQL.Add(', AVG(`' + nome + '`) AS `_Media_' + nome + '`, (AVG(`' + nome + '`) * 100 / ' + aux + ') AS `_PercMedia_' + nome + '`, ' + #39 + 'A' + #39 + ' AS `_ABCMedia_' + nome + '`, 99.99' + ' AS `_ABCAcum_' + nome + '`')
                   else
                      ADOQuery1.SQL.Add('AVG(`' + nome + '`) AS `_Media_' + nome + '`, (AVG(`' + nome + '`) * 100 / ' + aux + ') AS `_PercMedia_' + nome + '`, ' + #39 + 'A' + #39 + ' AS `_ABCMedia_' + nome + '`, 99.99' + ' AS `_ABCAcum_' + nome + '`');
                end;
            end
            else
            if Copy(CheckListBox3.Items.Items[i].Text, 1, 10) = HCLResourceStrings.FindID('sString_237') then
            begin
                if (frmDesigner.sSGBD = 'Microsoft Access 2007')        or
                   (frmDesigner.sSGBD = 'Microsoft Access 2010')        or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2000')    or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2005')    or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2008')    or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2008 R2') or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2012')    then
                begin
                   if a <> 0 then
                      ADOQuery1.SQL.Add(', MIN([' + nome + ']) AS [_Minimo_' + nome + '], (MIN([' + nome + ']) * 100 / ' + aux + ') AS [_PercMinimo_' + nome + '], ' + #39 + 'A' + #39 + ' AS [_ABCMinimo_' + nome + '], 99.99' + ' AS [_ABCAcum_' + nome + ']')
                   else
                      ADOQuery1.SQL.Add('MIN([' + nome + ']) AS [_Minimo_' + nome + '], (MIN([' + nome + ']) * 100 / ' + aux + ') AS [_PercMinimo_' + nome + '], ' + #39 + 'A' + #39 + ' AS [_ABCMinimo_' + nome + '], 99.99' + ' AS [_ABCAcum_' + nome + ']');
                end;
                if frmDesigner.sSGBD = 'Sun MySQL 5.x' then
                begin
                   if a <> 0 then
                      ADOQuery1.SQL.Add(', MIN(`' + nome + '`) AS `_Minimo_' + nome + '`, (MIN(`' + nome + '`) * 100 / ' + aux + ') AS `_PercMinimo_' + nome + '`, ' + #39 + 'A' + #39 + ' AS `_ABCMinimo_' + nome + '`, 99.99' + ' AS `_ABCAcum_' + nome + '`')
                   else
                      ADOQuery1.SQL.Add('MIN(`' + nome + '`) AS `_Minimo_' + nome + '`, (MIN(`' + nome + '`) * 100 / ' + aux + ') AS `_PercMinimo_' + nome + '`, ' + #39 + 'A' + #39 + ' AS `_ABCMinimo_' + nome + '`, 99.99' + ' AS `_ABCAcum_' + nome + '`');
                end;
            end
            else
            if Copy(CheckListBox3.Items.Items[i].Text, 1, 10) = HCLResourceStrings.FindID('sString_238') then
            begin
                if (frmDesigner.sSGBD = 'Microsoft Access 2007')        or
                   (frmDesigner.sSGBD = 'Microsoft Access 2010')        or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2000')    or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2005')    or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2008')    or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2008 R2') or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2012')    then
                begin
                   if a <> 0 then
                      ADOQuery1.SQL.Add(', MAX([' + nome + ']) AS [_Maximo_' + nome + '], (MAX([' + nome + ']) * 100 / ' + aux + ') AS [_PercMaximo_' + nome + '], ' + #39 + 'A' + #39 + ' AS [_ABCMaximo_' + nome + '], 99.99' + ' AS [_ABCAcum_' + nome + ']')
                   else
                      ADOQuery1.SQL.Add('MAX([' + nome + ']) AS [_Maximo_' + nome + '], (MAX([' + nome + ']) * 100 / ' + aux + ') AS [_PercMaximo_' + nome + '], ' + #39 + 'A' + #39 + ' AS [_ABCMaximo_' + nome + '], 99.99' + ' AS [_ABCAcum_' + nome + ']');
                end;
                if frmDesigner.sSGBD = 'Sun MySQL 5.x' then
                begin
                   if a <> 0 then
                      ADOQuery1.SQL.Add(', MAX(`' + nome + '`) AS `_Maximo_' + nome + '`, (MAX(`' + nome + '`) * 100 / ' + aux + ') AS `_PercMaximo_' + nome + '`, ' + #39 + 'A' + #39 + ' AS `_ABCMaximo_' + nome + '`, 99.99' + ' AS `_ABCAcum_' + nome + '`')
                   else
                      ADOQuery1.SQL.Add('MAX(`' + nome + '`) AS `_Maximo_' + nome + '`, (MAX(`' + nome + '`) * 100 / ' + aux + ') AS `_PercMaximo_' + nome + '`, ' + #39 + 'A' + #39 + ' AS `_ABCMaximo_' + nome + '`, 99.99' + ' AS `_ABCAcum_' + nome + '`');
                end;
            end;

            a := a + 1;
        end;
    end;
end;

procedure TfrmDesigner.MontaDetalheItem;
var
    i,a     : integer;
    nome    : string;
begin
    a := 0;
    for i := 0 to CheckListBox3.Items.Count - 1 do
    begin
        if CheckListBox3.Items.Items[i].Checked then
        begin
            nome := Trim(Copy(CheckListBox3.Items.Items[i].Text, 11, Length(CheckListBox3.Items.Items[i].Text) - 10));

            if Copy(CheckListBox3.Items.Items[i].Text, 1, 10) = HCLResourceStrings.FindID('sString_234') then
            begin
                if (frmDesigner.sSGBD = 'Microsoft Access 2007')        or
                   (frmDesigner.sSGBD = 'Microsoft Access 2010')        or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2000')    or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2005')    or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2008')    or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2008 R2') or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2012')    then
                begin
                   if a <> 0 then
                      ADOQuery1.SQL.Add(', SUM([' + nome + ']) AS [_Soma_' + nome + ']')
                   else
                      ADOQuery1.SQL.Add('SUM([' + nome + ']) AS [_Soma_' + nome + ']');
                end;
                if frmDesigner.sSGBD = 'Sun MySQL 5.x' then
                begin
                   if a <> 0 then
                      ADOQuery1.SQL.Add(', SUM(`' + nome + '`) AS `_Soma_' + nome + '`')
                   else
                      ADOQuery1.SQL.Add('SUM(`' + nome + '`) AS `_Soma_' + nome + '`');
                end;
            end
            else
            if Copy(CheckListBox3.Items.Items[i].Text, 1, 10) = HCLResourceStrings.FindID('sString_235') then
            begin
                if (frmDesigner.sSGBD = 'Microsoft Access 2007')        or
                   (frmDesigner.sSGBD = 'Microsoft Access 2010')        or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2000')    or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2005')    or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2008')    or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2008 R2') or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2012')    then
                begin
                   if a <> 0 then
                      ADOQuery1.SQL.Add(', COUNT([' + nome + ']) AS [_Contagem_' + nome + ']')
                   else
                      ADOQuery1.SQL.Add('COUNT([' + nome + ']) AS [_Contagem_' + nome + ']');
                end;
                if frmDesigner.sSGBD = 'Sun MySQL 5.x' then
                begin
                   if a <> 0 then
                      ADOQuery1.SQL.Add(', COUNT(`' + nome + '`) AS `_Contagem_' + nome + '`')
                   else
                      ADOQuery1.SQL.Add('COUNT(`' + nome + '`) AS `_Contagem_' + nome + '`');
                end;
            end
            else
            if Copy(CheckListBox3.Items.Items[i].Text, 1, 10) = HCLResourceStrings.FindID('sString_236') then
            begin
                if (frmDesigner.sSGBD = 'Microsoft Access 2007')        or
                   (frmDesigner.sSGBD = 'Microsoft Access 2010')        or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2000')    or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2005')    or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2008')    or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2008 R2') or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2012')    then
                begin
                   if a <> 0 then
                      ADOQuery1.SQL.Add(', AVG([' + nome + ']) AS [_Media_' + nome + ']')
                   else
                      ADOQuery1.SQL.Add('AVG([' + nome + ']) AS [_Media_' + nome + ']');
                end;
                if frmDesigner.sSGBD = 'Sun MySQL 5.x' then
                begin
                   if a <> 0 then
                      ADOQuery1.SQL.Add(', AVG(`' + nome + '`) AS `_Media_' + nome + '`')
                   else
                      ADOQuery1.SQL.Add('AVG(`' + nome + '`) AS `_Media_' + nome + '`');
                end;
            end
            else
            if Copy(CheckListBox3.Items.Items[i].Text, 1, 10) = HCLResourceStrings.FindID('sString_237') then
            begin
                if (frmDesigner.sSGBD = 'Microsoft Access 2007')        or
                   (frmDesigner.sSGBD = 'Microsoft Access 2010')        or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2000')    or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2005')    or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2008')    or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2008 R2') or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2012')    then
                begin
                   if a <> 0 then
                      ADOQuery1.SQL.Add(', MIN([' + nome + ']) AS [_Minimo_' + nome + ']')
                   else
                      ADOQuery1.SQL.Add('MIN([' + nome + ']) AS [_Minimo_' + nome + ']');
                end;
                if frmDesigner.sSGBD = 'Sun MySQL 5.x' then
                begin
                   if a <> 0 then
                      ADOQuery1.SQL.Add(', MIN(`' + nome + '`) AS `_Minimo_' + nome + '`')
                   else
                      ADOQuery1.SQL.Add('MIN(`' + nome + '`) AS `_Minimo_' + nome + '`');
                end;
            end
            else
            if Copy(CheckListBox3.Items.Items[i].Text, 1, 10) = HCLResourceStrings.FindID('sString_238') then
            begin
                if (frmDesigner.sSGBD = 'Microsoft Access 2007')        or
                   (frmDesigner.sSGBD = 'Microsoft Access 2010')        or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2000')    or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2005')    or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2008')    or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2008 R2') or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2012')    then
                begin
                   if a <> 0 then
                      ADOQuery1.SQL.Add(', MAX([' + nome + ']) AS [_Maximo_' + nome + ']')
                   else
                      ADOQuery1.SQL.Add('MAX([' + nome + ']) AS [_Maximo_' + nome + ']');
                end;
                if frmDesigner.sSGBD = 'Sun MySQL 5.x' then
                begin
                   if a <> 0 then
                      ADOQuery1.SQL.Add(', MAX(`' + nome + '`) AS `_Maximo_' + nome + '`')
                   else
                      ADOQuery1.SQL.Add('MAX(`' + nome + '`) AS `_Maximo_' + nome + '`');
                end;
            end;

            a := a + 1;
        end;
    end;
end;

procedure TfrmDesigner.MontaDetalhe;
var
    i,a : integer;
  auxIni: string;
  auxFim: string;
begin
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;

    if (frmDesigner.sSGBD = 'Microsoft Access 2007')        or
       (frmDesigner.sSGBD = 'Microsoft Access 2010')        or
       (frmDesigner.sSGBD = 'Microsoft SQL Server 2000')    or
       (frmDesigner.sSGBD = 'Microsoft SQL Server 2005')    or
       (frmDesigner.sSGBD = 'Microsoft SQL Server 2008')    or
       (frmDesigner.sSGBD = 'Microsoft SQL Server 2008 R2') or
       (frmDesigner.sSGBD = 'Microsoft SQL Server 2012')    then
    begin
        if edtLinha.EditValue = 0 then
           ADOQuery1.SQL.Add('SELECT ' + campos + ', ')
        else
           ADOQuery1.SQL.Add('SELECT TOP ' + VarToStr(edtLinha.EditValue) + ' ' + campos + ', ');
    end;

    if frmDesigner.sSGBD = 'Sun MySQL 5.x' then
       ADOQuery1.SQL.Add('SELECT ' + campos + ', ');

    if lFotografia then
       GroupFotografia
    else
    if lFrequencia then
       GroupFrequencia
    else
    if lVisualiza then
       MontaDetalheItemVisualiza
    else
       MontaDetalheItem;

    MontaFrom;

    if ListBox2.Items.Count > 0 then
    begin
        ADOQuery1.SQL.Add('WHERE');

        a := 0;

        for i := 0 to ListBox2.Items.Count - 1 do
        begin
            if a <> 0 then
               ADOQuery1.SQL.Add('OR ' + ListBox2.Items.Strings[i])
            else
               ADOQuery1.SQL.Add(ListBox2.Items.Strings[i]);

            a := a + 1;
        end;
    end;

    if cFiltroPersonalizado <> '' then
    begin
        if ListBox2.Items.Count > 0 then
           ADOQuery1.SQL.Add('OR (' + cFiltroPersonalizado + ')')
        else
           ADOQuery1.SQL.Add('WHERE (' + cFiltroPersonalizado + ')');
    end;

    if lFotografia then
       FiltraDataFotografia(auxIni, auxFim);

    if lFrequencia then
       FiltraDataFrequencia(auxFim, auxIni);

    ADOQuery1.SQL.Add('GROUP BY ' + campos1);

    if (not lFrequencia) and
       (not lFotografia) then
    begin
        MontaOrdem;

        if cbxOrdem.ItemIndex > 0 then // ordem natual
           if rgpOrdem.ItemIndex = 0 then
              ADOQuery1.SQL.Add('ORDER BY ' + ordem)
           else
              ADOQuery1.SQL.Add('ORDER BY ' + ordem + ' DESC');
    end;

    if frmDesigner.sSGBD = 'Sun MySQL 5.x' then
       if edtLinha.EditValue > 0 then
          ADOQuery1.SQL.Add('LIMIT 0, ' + VarToStr(edtLinha.EditValue));

    ADOQuery1.Open;
end;

procedure TfrmDesigner.MontaOrdem;
var
    nome : string;
    lCampoData : boolean;
    i : integer;
    itipo : integer;
begin
    ordem := '';
    itipo  := 0;

    if cbxOrdem.ItemIndex > 0 then // Ordem Natural
    begin
        for i := 0 to CheckListBox2.Items.Count - 1 do
            if CheckListBox2.Items.Items[i].Checked then
               if CheckListBox2.Items.Items[i].Text = cbxOrdem.Text then
                  itipo := 1;

        if itipo = 0 then
           for i := 0 to CheckListBox3.Items.Count - 1 do
               if CheckListBox3.Items.Items[i].Checked then
                  if CheckListBox3.Items.Items[i].Text = cbxOrdem.Text then
                     itipo := 2;

        if itipo = 1 then
        begin
            lCampoData := False;
            nome       := Trim(Copy(cbxOrdem.Text, 10, Length(cbxOrdem.Text) - 9));

            for i := 0 to lstData.Items.Count - 1 do
                if lstData.Items.Strings[i] = cbxOrdem.Text then
                   lCampoData := True;

            if (frmDesigner.sSGBD = 'Microsoft Access 2007') or
               (frmDesigner.sSGBD = 'Microsoft Access 2010') then
            begin
                if Copy(cbxOrdem.Text, 1, 9) = HCLResourceStrings.FindID('sString_239') then
                   ordem := 'DAY([' + nome + '])'
                else
                if Copy(cbxOrdem.Text, 1, 9) = HCLResourceStrings.FindID('sString_240') then
                   ordem := 'MONTH([' + nome + '])'
                else
                if Copy(cbxOrdem.Text, 1, 9) = HCLResourceStrings.FindID('sString_241') then
                   ordem := 'YEAR([' + nome + '])'
                else
                if lCampoData then
                begin
                   ordem := 'CVDate([' + cbxOrdem.Text + ']) & ' + #39 + #39;
                end
                else
                   ordem := '[' + cbxOrdem.Text + ']';
            end;

            if (frmDesigner.sSGBD = 'Microsoft SQL Server 2000')    or
               (frmDesigner.sSGBD = 'Microsoft SQL Server 2005')    or
               (frmDesigner.sSGBD = 'Microsoft SQL Server 2008')    or
               (frmDesigner.sSGBD = 'Microsoft SQL Server 2008 R2') or
               (frmDesigner.sSGBD = 'Microsoft SQL Server 2012')    then
            begin
                if Copy(cbxOrdem.Text, 1, 9) = HCLResourceStrings.FindID('sString_239') then
                   ordem := 'DAY([' + nome + '])'
                else
                if Copy(cbxOrdem.Text, 1, 9) = HCLResourceStrings.FindID('sString_240') then
                   ordem := 'MONTH([' + nome + '])'
                else
                if Copy(cbxOrdem.Text, 1, 9) = HCLResourceStrings.FindID('sString_241') then
                   ordem := 'YEAR([' + nome + '])'
                else
                if lCampoData then
                begin
                   ordem := 'CONVERT(DATETIME,[' + cbxOrdem.Text + '],103) & ' + #39 + #39;
                end
                else
                   ordem := '[' + cbxOrdem.Text + ']';
            end;

            if frmDesigner.sSGBD = 'Sun MySQL 5.x' then
            begin
                if Copy(cbxOrdem.Text, 1, 9) = HCLResourceStrings.FindID('sString_239') then
                   ordem := 'DAY(`' + nome + '`)'
                else
                if Copy(cbxOrdem.Text, 1, 9) = HCLResourceStrings.FindID('sString_240') then
                   ordem := 'MONTH(`' + nome + '`)'
                else
                if Copy(cbxOrdem.Text, 1, 9) = HCLResourceStrings.FindID('sString_241') then
                   ordem := 'YEAR(`' + nome + '`)'
                else
                if lCampoData then
                begin
                   ordem := 'date_format(`' + cbxOrdem.Text + '`,' + #39 + '%d/%m/%Y' + #39 + ')';
                end
                else
                   ordem := cbxOrdem.Text;
            end;
        end;

        if itipo = 2 then
        begin
            nome := Trim(Copy(cbxOrdem.Text, 11, Length(cbxOrdem.Text) - 10));

            if (frmDesigner.sSGBD = 'Microsoft Access 2007')        or
               (frmDesigner.sSGBD = 'Microsoft Access 2010')        or
               (frmDesigner.sSGBD = 'Microsoft SQL Server 2000')    or
               (frmDesigner.sSGBD = 'Microsoft SQL Server 2005')    or
               (frmDesigner.sSGBD = 'Microsoft SQL Server 2008')    or
               (frmDesigner.sSGBD = 'Microsoft SQL Server 2008 R2') or
               (frmDesigner.sSGBD = 'Microsoft SQL Server 2012')    then
            begin
                if Copy(cbxOrdem.Text, 1, 10) = HCLResourceStrings.FindID('sString_234') then
                   ordem := 'SUM([' + nome + '])'
                else
                if Copy(cbxOrdem.Text, 1, 10) = HCLResourceStrings.FindID('sString_235') then
                   ordem := 'COUNT([' + nome + '])'
                else
                if Copy(cbxOrdem.Text, 1, 10) = HCLResourceStrings.FindID('sString_236') then
                   ordem := 'AVG([' + nome + '])'
                else
                if Copy(cbxOrdem.Text, 1, 10) = HCLResourceStrings.FindID('sString_237') then
                   ordem := 'MIN([' + nome + '])'
                else
                if Copy(cbxOrdem.Text, 1, 10) = HCLResourceStrings.FindID('sString_238') then
                   ordem := 'MAX([' + nome + '])'
            end;
            if frmDesigner.sSGBD = 'Sun MySQL 5.x' then
            begin
                if Copy(cbxOrdem.Text, 1, 10) = HCLResourceStrings.FindID('sString_234') then
                   ordem := 'SUM(`' + nome + '`)'
                else
                if Copy(cbxOrdem.Text, 1, 10) = HCLResourceStrings.FindID('sString_235') then
                   ordem := 'COUNT(`' + nome + '`)'
                else
                if Copy(cbxOrdem.Text, 1, 10) = HCLResourceStrings.FindID('sString_236') then
                   ordem := 'AVG(`' + nome + '`)'
                else
                if Copy(cbxOrdem.Text, 1, 10) = HCLResourceStrings.FindID('sString_237') then
                   ordem := 'MIN(`' + nome + '`)'
                else
                if Copy(cbxOrdem.Text, 1, 10) = HCLResourceStrings.FindID('sString_238') then
                   ordem := 'MAX(`' + nome + '`)'
            end;
        end;
    end;
end;

procedure TfrmDesigner.MontaSelect;
var
    i : integer;
begin
    campos  := '';
    campos1 := '';

    for i := 0 to CheckListBox2.Items.Count - 1 do
    begin
        MontaCabecalho(i);
    end;

    MontaDetalhe;
end;

procedure TfrmDesigner.MontaSelectCubo;
var
    i,a,b : integer;
    nome : string;
    vetSumarios : array of string;
    lPode : boolean;
begin
    campos   := '';
    campos1  := '';
    Sumarios := 0;

    for i := 0 to CheckListBox2.Items.Count - 1 do
        MontaCabecalho(i);

    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;

    if (frmDesigner.sSGBD = 'Microsoft Access 2007')        or
       (frmDesigner.sSGBD = 'Microsoft Access 2010')        or
       (frmDesigner.sSGBD = 'Microsoft SQL Server 2000')    or
       (frmDesigner.sSGBD = 'Microsoft SQL Server 2005')    or
       (frmDesigner.sSGBD = 'Microsoft SQL Server 2008')    or
       (frmDesigner.sSGBD = 'Microsoft SQL Server 2008 R2') or
       (frmDesigner.sSGBD = 'Microsoft SQL Server 2012')    then
    begin
        if edtLinha.EditValue = 0 then
           ADOQuery1.SQL.Add('SELECT ' + campos + ', ')
        else
           ADOQuery1.SQL.Add('SELECT TOP ' + VarToStr(edtLinha.EditValue) + ' ' + campos + ', ');
    end;
    
    if frmDesigner.sSGBD = 'Sun MySQL 5.x' then
       ADOQuery1.SQL.Add('SELECT ' + campos + ', ');

    a := 0;
    for i := 0 to CheckListBox3.Items.Count - 1 do
    begin
        if CheckListBox3.Items.Items[i].Checked then
        begin
            nome  := Trim(Copy(CheckListBox3.Items.Items[i].Text, 11, Length(CheckListBox3.Items.Items[i].Text) - 10));
            lPode := True;
            for b := 0 to Length(vetSumarios) - 1 do
                if vetSumarios[b] = nome then
                   lPode := False;

            if lPode then
            begin
                Sumarios := Sumarios + 1;
                SetLength(vetSumarios, Length(vetSumarios) + 1);
                vetSumarios[Length(vetSumarios) - 1] := nome;

                if (frmDesigner.sSGBD = 'Microsoft Access 2007')        or
                   (frmDesigner.sSGBD = 'Microsoft Access 2010')        or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2000')    or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2005')    or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2008')    or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2008 R2') or
                   (frmDesigner.sSGBD = 'Microsoft SQL Server 2012')    then
                begin
                    if a <> 0 then
                       ADOQuery1.SQL.Add(', [' + nome + '] AS [' + nome + ']')
                    else
                       ADOQuery1.SQL.Add('[' + nome + '] AS [' + nome + ']');
                end;
                if frmDesigner.sSGBD = 'Sun MySQL 5.x' then
                begin
                    if a <> 0 then
                       ADOQuery1.SQL.Add(', `' + nome + '` AS `' + nome + '`')
                    else
                       ADOQuery1.SQL.Add('`' + nome + '` AS `' + nome + '`');
                end;

                a := a + 1;
            end;
        end;
    end;

    if (frmDesigner.sSGBD = 'Microsoft Access 2007')        or
       (frmDesigner.sSGBD = 'Microsoft Access 2010')        or
       (frmDesigner.sSGBD = 'Microsoft SQL Server 2000')    or
       (frmDesigner.sSGBD = 'Microsoft SQL Server 2005')    or
       (frmDesigner.sSGBD = 'Microsoft SQL Server 2008')    or
       (frmDesigner.sSGBD = 'Microsoft SQL Server 2008 R2') or
       (frmDesigner.sSGBD = 'Microsoft SQL Server 2012')    then
    begin
        if (frmDesigner.tblAnalisesBASE_ORIGEM.Value  = '.') and
           (frmDesigner.tblAnalisesVISAO_ORIGEM.Value = '.') then
            ADOQuery1.SQL.Add('FROM ' + '[' + frmDesigner.tblAnalisesVISAO_DESTINO.Value + ']')
        else
            ADOQuery1.SQL.Add('FROM ' + '[_' + frmDesigner.tblAnalisesVISAO_DESTINO.Value + ']');
    end;
    if frmDesigner.sSGBD = 'Sun MySQL 5.x' then
    begin
        if (frmDesigner.tblAnalisesBASE_ORIGEM.Value  = '.') and
           (frmDesigner.tblAnalisesVISAO_ORIGEM.Value = '.') then
            ADOQuery1.SQL.Add('FROM ' + '`' + frmDesigner.tblAnalisesVISAO_DESTINO.Value + '`')
        else
            ADOQuery1.SQL.Add('FROM ' + '`_' + frmDesigner.tblAnalisesVISAO_DESTINO.Value + '`');
    end;

    if ListBox2.Items.Count > 0 then
    begin
        ADOQuery1.SQL.Add('WHERE');
        a := 0;
        for i := 0 to ListBox2.Items.Count - 1 do
        begin
            if a <> 0 then
               ADOQuery1.SQL.Add('OR ' + ListBox2.Items.Strings[i])
            else
               ADOQuery1.SQL.Add(ListBox2.Items.Strings[i]);

            a := a + 1;
        end;
    end;

    if cFiltroPersonalizado <> '' then
    begin
        if ListBox2.Items.Count > 0 then
           ADOQuery1.SQL.Add('OR (' + cFiltroPersonalizado + ')')
        else
           ADOQuery1.SQL.Add('WHERE (' + cFiltroPersonalizado + ')');
    end;

    if frmDesigner.sSGBD = 'Sun MySQL 5.x' then
       if edtLinha.EditValue > 0 then
          ADOQuery1.SQL.Add('LIMIT 0, ' + VarToStr(edtLinha.EditValue));
end;

procedure TfrmDesigner.MontaSelectTodos(Campo: Integer);
begin
    campos  := '';
    campos1 := '';

    MontaCabecalho(Campo);
    MontaDetalhe;
end;

procedure TfrmDesigner.SpeedButton4Click(Sender: TObject);
var
    Elementos, i : integer;
  s_cubo_skin: string;
  s_cubo_Connection: string;
  s_cubo_analise: string;
  s_cubo_cubo: string;
  s_cubo_cenario: string;
  s_cubo_usuario: string;
  s_cubo_descricao: string;
  s_cubo_sql: string;
  s_cubo_armazena: string;
  s_cubo_elementos: string;
  s_cubo_sumarios: string;
  s_cubo_ele: string;
  s_cubo_val: string;

  comando : TStrings;
  s_cubo_filtros: string;
  s_cubo_a: string;
  s_cubo_b: string;
  s_cubo_c: string;
  s_cubo_d: string;
  s_cubo_e: string;
  s_cubo_fot_data: string;
  s_cubo_fot_valor: string;
  s_cubo_fot_dt_fot_ini: string;
  s_cubo_fot_dt_fot_fim: string;
  s_cubo_fot_dt_com_ini: string;
  s_cubo_fot_dt_com_fim: string;
  s_cubo_fre_data: string;
  s_cubo_fre_data_base: string;
  s_cubo_fre_valor: string;
  s_cubo_fre_dias: string;
  s_cubo_fre_atual: string;
  s_cubo_fre_dt_fre_ini: string;
  s_cubo_fre_dt_fre_fim: string;
  s_cubo_ordem: string;
  s_cubo_linhas: string;
  s_cubo_registros: string;
  s_cubo_ordem_tipo: string;
begin
    Elementos := 0;
    for i := 0 to CheckListBox2.Items.Count - 1 do
    begin
        if CheckListBox2.Items.Items[i].Checked then
           Elementos := Elementos + 1;
    end;

    if Elementos = 0 then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_26'), mtInformation, [mbOK], 0);
        Exit;
    end;

    Sumarios := 0;
    for i := 0 to CheckListBox3.Items.Count - 1 do
    begin
        if CheckListBox3.Items.Items[i].Checked then
           Sumarios := Sumarios + 1;
    end;

    if Sumarios = 0 then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_28'), mtInformation, [mbOK], 0);
        Exit;
    end;

    frmAguarde := TfrmAguarde.Create(Self);
    frmAguarde.cMensagem := HCLResourceStrings.FindID('sString_416');
    frmAguarde.Show;
    frmAguarde.Update;

    MontaSelectCubo;
    ADOQuery1.SQL.SaveToFile(frmDesigner.sTempDirUsuario + 'cubo.txt');

    frmDesigner.ListBox4.Clear;
    for i := 0 to frmDesigner.CheckListBox2.Items.Count - 1 do
    begin
        if frmDesigner.CheckListBox2.Items.Items[i].Checked = True then
        begin
           frmDesigner.ListBox4.Items.Add(frmDesigner.CheckListBox2.Items.Items[i].Text);

           if s_cubo_ele = '' then
              s_cubo_ele := frmDesigner.CheckListBox2.Items.Items[i].Text
           else
              s_cubo_ele := s_cubo_ele + '#' + frmDesigner.CheckListBox2.Items.Items[i].Text;
        end;
    end;

    frmDesigner.ListBox4.Clear;
    for i := 0 to frmDesigner.CheckListBox3.Items.Count - 1 do
    begin
        if frmDesigner.CheckListBox3.Items.Items[i].Checked = True then
        begin
           frmDesigner.ListBox4.Items.Add(frmDesigner.CheckListBox3.Items.Items[i].Text);

           if s_cubo_val = '' then
              s_cubo_val := frmDesigner.CheckListBox3.Items.Items[i].Text
           else
              s_cubo_val := s_cubo_val + '#' + frmDesigner.CheckListBox3.Items.Items[i].Text
        end;
    end;

    s_cubo_skin           := frmDesigner.dxSkinController1.SkinName;
    s_cubo_connection     := frmDesigner.bdDados.ConnectionString;
    s_cubo_analise        := cAnalise;
    s_cubo_cubo           := frmDesigner.cCubo;
    s_cubo_cenario        := ComboBox1.Text;
    s_cubo_usuario        := frmDesigner.sUsuario;
    s_cubo_descricao      := '';
    s_cubo_sql            := frmDesigner.sTempDirUsuario + 'cubo.txt';
    s_cubo_armazena       := frmDesigner.bdArmazena.ConnectionString;
    s_cubo_elementos      := IntToStr(Elementos);
    s_cubo_sumarios       := IntToStr(Sumarios);
    s_cubo_filtros        := ListBox2.Items.Text;

    s_cubo_a              := IntToStr(vA);
    s_cubo_b              := IntToStr(vB);
    s_cubo_c              := IntToStr(vC);
    s_cubo_d              := IntToStr(vD);
    s_cubo_e              := IntToStr(vE);
    s_cubo_fot_data       := sFOTOGRAFIA_data;
    s_cubo_fot_valor      := sFOTOGRAFIA_valor;
    s_cubo_fot_dt_fot_ini := sFOTOGRAFIA_dt_fot_ini;
    s_cubo_fot_dt_fot_fim := sFOTOGRAFIA_dt_fot_fim;
    s_cubo_fot_dt_com_ini := sFOTOGRAFIA_dt_com_ini;
    s_cubo_fot_dt_com_fim := sFOTOGRAFIA_dt_com_fim;
    s_cubo_fre_data       := sFREQUENCIA_data;
    s_cubo_fre_data_base  := sFREQUENCIA_data_base;
    s_cubo_fre_valor      := sFREQUENCIA_valor;
    s_cubo_fre_dias       := IntToStr(sFREQUENCIA_dias);
    s_cubo_fre_atual      := sFREQUENCIA_atual;
    s_cubo_fre_dt_fre_ini := sFREQUENCIA_dt_fre_ini;
    s_cubo_fre_dt_fre_fim := sFREQUENCIA_dt_fre_fim;

    if rgpOrdem.ItemIndex = 0 then
       s_cubo_ordem_tipo := 'C'
    else
       s_cubo_ordem_tipo := 'D';

    s_cubo_linhas    := edtLinha.EditValue;
    s_cubo_registros := edtRegistros.EditValue;
    s_cubo_ordem     := cbxOrdem.Text;

    comando := TStringList.Create;

    comando.Clear;
    comando.Add(s_cubo_skin);
    comando.Add(s_cubo_connection);
    comando.Add(s_cubo_analise);
    comando.Add(s_cubo_cubo);
    comando.Add(s_cubo_cenario);
    comando.Add(s_cubo_usuario);
    comando.Add(s_cubo_descricao);
    comando.Add(s_cubo_sql);
    comando.Add(s_cubo_armazena);
    comando.Add(s_cubo_ele);
    comando.Add(s_cubo_val);
    comando.Add(s_cubo_filtros);
    comando.Add(s_cubo_ordem);
    comando.Add(s_cubo_ordem_tipo);
    comando.Add(s_cubo_registros);
    comando.SaveToFile(frmDesigner.sTempDirUsuario + 'comandocubo.txt');

    comando.Free;

    ShellExecute(handle,'open',
                 pchar(ExtractFilePath(Application.ExeName) + 'pCubo.exe'),
                 pchar('"' + frmDesigner.sTempDirUsuario + 'comandocubo.txt" "' + s_cubo_elementos + '" "' + s_cubo_sumarios + '" "' + frmDesigner.sUsuario + '"'),
                 nil, sw_shownormal);

    Sleep(5000);
    FreeAndNil(frmAguarde);
end;

procedure TfrmDesigner.SpeedButton7Click(Sender: TObject);
var
    i, a : integer;
begin
    Timer1.Enabled := False;

    a := 0;
    for i := 0 to CheckListBox2.Items.Count - 1 do
    begin
        if CheckListBox2.Items.Items[i].Checked then
           a := 1
    end;

    if a = 0 then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_26'), mtInformation, [mbOK], 0);
        Exit;
    end;

    a := 0;
    for i := 0 to CheckListBox3.Items.Count - 1 do
    begin
        if CheckListBox3.Items.Items[i].Checked then
           a := 1
    end;

    if a = 0 then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_28'), mtInformation, [mbOK], 0);
        Exit;
    end;

    if frmVisualiza = nil then
    begin
        lVisualiza := True;
        frmVisualiza := TfrmVisualiza.Create(Self);
        frmVisualiza.ShowModal;
        FreeAndNil(frmVisualiza);
        lVisualiza := False;
    end
    else
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
        FreeAndNil(frmVisualiza);
    end;

    if sOperacao = 'VisualizarABC' then
       Close;
end;

procedure TfrmDesigner.SpeedButton8Click(Sender: TObject);
begin
    SpeedButton3.Click;
    ListBox2.Clear;
end;

procedure TfrmDesigner.SpeedButton9Click(Sender: TObject);
var
    aux : string;
    i : integer;
begin
    if ComboBox1.Text = '' then
    begin
        aux := InputBox(HCLResourceStrings.FindID('sString_32'),HCLResourceStrings.FindID('sString_34'),'');

        if aux = '' then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_35'), mtInformation, [mbOK], 0);
            Exit;
        end;

        if frmDesigner.tblCenarios.Locate('ID_CENARIO',aux,[]) then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_36'), mtInformation, [mbOK], 0);
            Exit;
        end;

        frmDesigner.tblCenarios.Insert;
        frmDesigner.tblCenariosID_CENARIO.Value := aux;
    end
    else
    begin
        if frmDesigner.tblCenarios.Locate('ID_CENARIO',ComboBox1.Text,[]) then
           frmDesigner.tblCenarios.Edit
        else
           frmDesigner.tblCenarios.Insert;

        frmDesigner.tblCenariosID_CENARIO.Value := ComboBox1.Text;
    end;

    ListBox4.Clear;
    for i := 0 to CheckListBox2.Items.Count - 1 do
    begin
        if CheckListBox2.Items.Items[i].Checked = True then
           ListBox4.Items.Add(CheckListBox2.Items.Items[i].Text);
    end;
    frmDesigner.tblCenariosELEMENTOS.Value := ListBox4.Items.Text;

    ListBox4.Clear;
    for i := 0 to CheckListBox3.Items.Count - 1 do
    begin
        if CheckListBox3.Items.Items[i].Checked = True then
           ListBox4.Items.Add(CheckListBox3.Items.Items[i].Text);
    end;
    frmDesigner.tblCenariosVALORES.Value := ListBox4.Items.Text;

    frmDesigner.tblCenariosID_ANALISE.Value                 := cAnalise;
    frmDesigner.tblCenariosID_USUARIO.Value                 := frmDesigner.sUsuario;
    frmDesigner.tblCenariosFILTROS.Value                    := ListBox2.Items.Text;
    frmDesigner.tblCenariosA.AsInteger                      := vA;
    frmDesigner.tblCenariosB.AsInteger                      := vB;
    frmDesigner.tblCenariosC.AsInteger                      := vC;
    frmDesigner.tblCenariosD.AsInteger                      := vD;
    frmDesigner.tblCenariosE.AsInteger                      := vE;
    frmDesigner.tblCenariosFOTOGRAFIA_DATA.Value            := sFOTOGRAFIA_data;
    frmDesigner.tblCenariosFOTOGRAFIA_VALOR.Value           := sFOTOGRAFIA_valor;
    frmDesigner.tblCenariosFOTOGRAFIA_DT_FOT_INI.Value      := sFOTOGRAFIA_dt_fot_ini;
    frmDesigner.tblCenariosFOTOGRAFIA_DT_FOT_FIM.Value      := sFOTOGRAFIA_dt_fot_fim;
    frmDesigner.tblCenariosFOTOGRAFIA_DT_COM_INI.Value      := sFOTOGRAFIA_dt_com_ini;
    frmDesigner.tblCenariosFOTOGRAFIA_DT_COM_FIM.Value      := sFOTOGRAFIA_dt_com_fim;
    frmDesigner.tblCenariosFREQUENCIA_DATA.Value            := sFREQUENCIA_data;
    frmDesigner.tblCenariosFREQUENCIA_DATA_BASE.Value       := sFREQUENCIA_data_base;
    frmDesigner.tblCenariosFREQUENCIA_VALOR.Value           := sFREQUENCIA_valor;
    frmDesigner.tblCenariosFREQUENCIA_DIAS.Value            := sFREQUENCIA_dias;
    frmDesigner.tblCenariosFREQUENCIA_ATUAL.Value           := sFREQUENCIA_atual;
    frmDesigner.tblCenariosFREQUENCIA_DT_FRE_INI.Value      := sFREQUENCIA_dt_fre_ini;
    frmDesigner.tblCenariosFREQUENCIA_DT_FRE_FIM.Value      := sFREQUENCIA_dt_fre_fim;
    frmDesigner.tblCenariosORDEM.Value                      := cbxOrdem.Text;
    frmDesigner.tblCenariosFILTRO_PERSONALIZADO_TEXTO.Value := cFiltroPersonalizado;

    sStream.Position := 0;
    frmDesigner.tblCenariosFILTRO_PERSONALIZADO_GRAFICO.LoadFromStream(sStream);

    if rgpOrdem.ItemIndex = 0 then
       frmDesigner.tblCenariosORDEM_TIPO.Value         := 'C'
    else
       frmDesigner.tblCenariosORDEM_TIPO.Value         := 'D';

    frmDesigner.tblCenariosLINHAS.Value                := edtLinha.EditValue;
    frmDesigner.tblCenariosREGISTROS.Value             := edtRegistros.EditValue;

    frmDesigner.tblCenarios.Post;

    ComboBox1.Text := frmDesigner.tblCenariosID_CENARIO.Value;
end;

procedure TfrmDesigner.tblABCFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
    Accept := False;

    if EncontraLista(DataSet.FieldByName('PODE_VISUALIZAR').Value,'*',',') then
       Accept := True
    else
    if EncontraLista(DataSet.FieldByName('PODE_VISUALIZAR').Value,sUsuario,',') then
       Accept := True;
end;

procedure TfrmDesigner.tblAnalisesFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
    Accept := False;

    if EncontraLista(DataSet.FieldByName('PODE_VISUALIZAR').Value,'*',',') then
       Accept := True
    else
    if EncontraLista(DataSet.FieldByName('PODE_VISUALIZAR').Value,sUsuario,',') then
       Accept := True;
end;

procedure TfrmDesigner.tblCenariosBeforeDelete(DataSet: TDataSet);
var
    aux : string;
    lPode : boolean;
begin
    lPode := True;
    try
       aux := #39 + tblCenariosID_CENARIO.AsString + #39;
    except
       lPode := False;
    end;

    if lPode then
       if not DeleteCascade(bdDados,0,'PADROES','ID_CENARIO',aux) then Abort;

    GeraLog(bdDados,sUsuario,DataSet.Name,HCLResourceStrings.FindID('sString_358'),'Chave: ' + aux);
end;

procedure TfrmDesigner.tblCenariosBeforePost(DataSet: TDataSet);
var
    aux, auxAntigo, auxNovo : string;
    lPode : boolean;
begin
    lPode := True;
    try
       aux := #39 + tblCenariosID_FREQUENCIA.Value + #39;
    except
       lPode := False;
    end;
    if lPode then
       if not Integridade(bdDados,0,'FREQUENCIA','ID_FREQUENCIA',aux) then abort;

    lPode := True;
    try
       aux := #39 + tblCenariosID_ANALISE.Value + #39;
    except
       lPode := False;
    end;
    if lPode then
       if not Integridade(bdDados,0,'ANALISES','ID_ANALISE',aux) then abort;

    lPode := True;
    try
       aux := #39 + tblCenariosID_FOTOGRAFIA.Value + #39;
    except
       lPode := False;
    end;
    if lPode then
       if not Integridade(bdDados,0,'FOTOGRAFIA','ID_FOTOGRAFIA',aux) then abort;

    lPode := True;
    try
       aux := #39 + tblCenariosID_ABC.Value + #39;
    except
       lPode := False;
    end;
    if lPode then
       if not Integridade(bdDados,0,'ABC','ID_ABC',aux) then abort;

    lPode := True;
    try
       aux := #39 + tblCenariosID_USUARIO.Value + #39;
    except
       lPode := False;
    end;
    if lPode then
       if not Integridade(bdDados,0,'USUARIOS','ID_USUARIO',aux) then abort;

    lPode := True;
    try
       auxAntigo := #39 + tblCenariosID_CENARIO.OldValue + #39;
       auxNovo   := #39 + tblCenariosID_CENARIO.Value    + #39;
    except
       lPode := False;
    end;

    if lPode then
       if not UpdateCascade(bdDados,0,'PADROES','ID_CENARIO',auxAntigo, auxNovo) then Abort;
end;

procedure TfrmDesigner.tblFotografiaFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
    Accept := False;

    if EncontraLista(DataSet.FieldByName('PODE_VISUALIZAR').Value,'*',',') then
       Accept := True
    else
    if EncontraLista(DataSet.FieldByName('PODE_VISUALIZAR').Value,sUsuario,',') then
       Accept := True;
end;

procedure TfrmDesigner.tblFrequenciaFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
    Accept := False;

    if EncontraLista(DataSet.FieldByName('PODE_VISUALIZAR').Value,'*',',') then
       Accept := True
    else
    if EncontraLista(DataSet.FieldByName('PODE_VISUALIZAR').Value,sUsuario,',') then
       Accept := True;
end;

procedure TfrmDesigner.tblPadroesBeforePost(DataSet: TDataSet);
var
    aux : string;
    lPode : boolean;
begin
    tblPadroesID_USUARIO.Value := frmDesigner.sUsuario;

    lPode := True;
    try
       aux := #39 + tblPadroesID_ANALISE.Value + #39;
    except
       lPode := False;
    end;
    if lPode then
       if not Integridade(bdDados,0,'ANALISES','ID_ANALISE',aux) then abort;

    lPode := True;
    try
       aux := #39 + tblPadroesID_CENARIO.Value + #39;
    except
       lPode := False;
    end;
    if lPode then
       if not Integridade(bdDados,0,'CENARIOS','ID_CENARIO',aux) then abort;

    lPode := True;
    try
       aux := #39 + tblPadroesID_SCORED.Value + #39;
    except lPode := False;
    end;
    if lPode then
       if not Integridade(bdDados,0,'SCORED_CARD','ID_SCORED',aux) then abort;

    lPode := True;
    try
       aux := #39 + tblPadroesID_FREQUENCIA.Value + #39;
    except
       lPode := False;
    end;
    if lPode then
       if not Integridade(bdDados,0,'FREQUENCIA','ID_FREQUENCIA',aux) then abort;

    lPode := True;
    try
       aux := #39 + tblPadroesID_ABC.Value + #39;
    except
       lPode := False;
    end;
    if lPode then
       if not Integridade(bdDados,0,'ABC','ID_ABC',aux) then abort;

    lPode := True;
    try
       aux := #39 + tblPadroesID_DYNAMICS.Value + #39;
    except
       lPode := False;
    end;
    if lPode then
       if not Integridade(bdDados,0,'DYNAMICS', 'ID_DYNAMICS',aux) then abort;

    lPode := True;
    try
       aux := #39 + tblPadroesID_USUARIO.Value + #39;
    except
       lPode := False;
    end;
    if lPode then
       if not Integridade(bdDados,0,'USUARIOS', 'ID_USUARIO',aux) then abort;

    lPode := True;
    try
       aux := #39 + tblPadroesID_RELATORIO.Value + #39;
    except
       lPode := False;
    end;
    if lPode then
       if not Integridade(bdDados,0,'RELATORIOS', 'ID_RELATORIO',aux) then abort;

    lPode := True;
    try
       aux := #39 + tblPadroesID_FOTOGRAFIA.Value + #39;
    except
       lPode := False;
    end;
    if lPode then
       if not Integridade(bdDados,0,'FOTOGRAFIA', 'ID_FOTOGRAFIA',aux) then abort;

    lPode := True;
    try
       aux := #39 + tblPadroesID_SMARTDOCS.Value + #39;
    except
       lPode := False;
    end;
    if lPode then
       if not Integridade(bdDados,0,'SMARTDOCS', 'ID_SMARTDOCS',aux) then abort;

    lPode := True;
    try
       aux := #39 + tblPadroesID_ACCESS.Value + #39;
    except
       lPode := False;
    end;
    if lPode then
       if not Integridade(bdDados,0,'ACCESS', 'ID_ACCESS',aux) then abort;

    lPode := True;
    try
       aux := #39 + tblPadroesID_VISIO.Value + #39;
    except
       lPode := False;
    end;
    if lPode then
       if not Integridade(bdDados,0,'VISIO', 'ID_VISIO',aux) then abort;
end;

procedure TfrmDesigner.Timer1Timer(Sender: TObject);
begin
    if sOperacao = 'VisualizarFrequencia' then
       SpeedButton12.OnClick(Self)
    else
    if sOperacao = 'VisualizarFotografia' then
       SpeedButton11.OnClick(Self)
    else
    if sOperacao = 'VisualizarABC' then
       SpeedButton7.OnClick(Self);

    Timer1.Enabled := False;
end;

procedure TfrmDesigner.SpeedButton10Click(Sender: TObject);
var
    i : integer;
begin
    if ComboBox1.Text = '' then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_38'), mtInformation, [mbOK], 0);
        Exit;
    end;

    if ComboBox1.Text <> '' then
    begin
        if MessageDlg(HCLResourceStrings.FindID('sString_39'), mtConfirmation, [mbYes,mbNo], 0) = mrYes then
        begin
            if frmDesigner.tblCenarios.Locate('ID_CENARIO',ComboBox1.Text,[]) then
            begin
                sFOTOGRAFIA_data       := '';
                sFOTOGRAFIA_valor      := '';
                sFOTOGRAFIA_dt_fot_ini := '';
                sFOTOGRAFIA_dt_fot_fim := '';
                sFOTOGRAFIA_dt_com_ini := '';
                sFOTOGRAFIA_dt_com_fim := '';
                sFREQUENCIA_data       := '';
                sFREQUENCIA_data_base  := '';
                sFREQUENCIA_valor      := '';
                sFREQUENCIA_dias       := 0;
                sFREQUENCIA_atual      := 'N';
                sFREQUENCIA_dt_fre_ini := '';
                sFREQUENCIA_dt_fre_fim := '';
                cbxOrdem.Text          := HCLResourceStrings.FindID('sString_331');
                rgpOrdem.ItemIndex     := 0;
                edtLinha.EditValue     := 0;
                edtRegistros.EditValue := 0;

                vA := 100;
                vB := 90;
                vC := 80;
                vD := 70;
                vE := 40;

                frmDesigner.tblCenarios.Delete;
                ComboBox1.Text := '';
                ListBox2.Clear;
                CheckListBox1.Clear;

                for i := 0 to CheckListBox2.Items.Count - 1 do
                begin
                    CheckListBox2.Items.Items[i].Checked := false;
                end;

                for i := 0 to CheckListBox3.Items.Count - 1 do
                begin
                    CheckListBox3.Items.Items[i].Checked := false;
                end;
            end;
        end;
    end;
end;

procedure TfrmDesigner.SpeedButton11Click(Sender: TObject);
var
    Elementos, i : integer;
begin
    Timer1.Enabled := False;

    Elementos := 0;
    for i := 0 to CheckListBox2.Items.Count - 1 do
    begin
        if CheckListBox2.Items.Items[i].Checked then
           Elementos := Elementos + 1;
    end;

    if Elementos = 0 then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_26'), mtInformation, [mbOK], 0);
        Exit;
    end;

    if frmFotografar = nil then
    begin
        lFotografia := True;

        frmFotografar := TfrmFotografar.Create(Self);
        frmFotografar.Caption := HCLResourceStrings.FindID('sString_138') + cAnalise;
        frmFotografar.MontaDados;

        if sOperacao <> 'VisualizarFotografia' then
        begin
            frmFotografar.ShowModal;
        end
        else
        begin
            if cFotografia = '' then
               frmFotografar.ShowModal
            else
               frmFotografar.SpeedButton3.OnClick(Self);
        end;

        FreeAndNil(frmFotografar);

        lFotografia := False;
    end
    else
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
        FreeAndNil(frmFotografar);
    end;

    if sOperacao = 'VisualizarFotografia' then
       Close;
end;

procedure TfrmDesigner.SpeedButton12Click(Sender: TObject);
var
    Elementos, i : integer;
begin
    Timer1.Enabled := False;

    Elementos := 0;
    for i := 0 to CheckListBox2.Items.Count - 1 do
    begin
        if CheckListBox2.Items.Items[i].Checked then
           Elementos := Elementos + 1;
    end;

    if Elementos = 0 then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_26'), mtInformation, [mbOK], 0);
        Exit;
    end;

    if frmFrequencia = nil then
    begin
        lFrequencia := True;

        frmFrequencia := TfrmFrequencia.Create(Self);
        frmFrequencia.Caption := HCLResourceStrings.FindID('sString_144') + cAnalise;
        frmFrequencia.MontaDados;

        if sOperacao <> 'VisualizarFrequencia' then
        begin
            frmFrequencia.ShowModal;
        end
        else
        begin
            if cFrequencia = '' then
               frmFrequencia.ShowModal
            else
               frmFrequencia.SpeedButton3.OnClick(Self);
        end;

        FreeAndNil(frmFrequencia);

        lFrequencia := False;
    end
    else
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
        FreeAndNil(frmFrequencia);
    end;

    if sOperacao = 'VisualizarFrequencia' then
       Close;
end;

procedure TfrmDesigner.ComboBox1PropertiesInitPopup(Sender: TObject);
var
    aux : string;
begin
    aux := ComboBox1.Text;

    ComboBox1.Properties.Items.Clear;
    ComboBox1.Clear;
    ADOQuery2.Close;
    ADOQuery2.SQL.Clear;
    ADOQuery2.SQL.Add('SELECT ID_CENARIO, ID_ABC, ID_FOTOGRAFIA, ID_FREQUENCIA FROM CENARIOS');
    ADOQuery2.SQL.Add('WHERE ID_USUARIO = ' + #39 + frmDesigner.sUsuario + #39);
    ADOQuery2.SQL.Add('AND ID_ANALISE = ' + #39 + cAnalise + #39);
    ADOQuery2.SQL.Add('ORDER BY ID_CENARIO');
    ADOQuery2.Open;

    ADOQuery2.First;
    while not ADOQuery2.Eof do
    begin
        if (ADOQuery2.Fields[1].AsString = '') and
           (ADOQuery2.Fields[2].AsString = '') and
           (ADOQuery2.Fields[3].AsString = '') then
           ComboBox1.Properties.Items.Add(ADOQuery2.Fields[0].AsString);

        ADOQuery2.Next;
    end;

    ADOQuery2.Close;
    ComboBox1.Text := aux;
end;

procedure TfrmDesigner.ComboBox1PropertiesChange(Sender: TObject);
var
    i, a : integer;
begin
    CheckListBox2.Enabled  := True;
    CheckListBox3.Enabled  := True;

    if ComboBox1.Text <> '' then
    begin
        if frmDesigner.tblCenarios.Locate('ID_CENARIO',ComboBox1.Text,[]) then
        begin
            cFiltroPersonalizado   := frmDesigner.tblCenariosFILTRO_PERSONALIZADO_TEXTO.Value;

            sStream.Free;
            sStream := TMemoryStream.Create;
            frmDesigner.tblCenariosFILTRO_PERSONALIZADO_GRAFICO.SaveToStream(sStream);

            sFOTOGRAFIA_data       := frmDesigner.tblCenariosFOTOGRAFIA_DATA.Value;
            sFOTOGRAFIA_valor      := frmDesigner.tblCenariosFOTOGRAFIA_VALOR.Value;
            sFOTOGRAFIA_dt_fot_ini := frmDesigner.tblCenariosFOTOGRAFIA_DT_FOT_INI.Value;
            sFOTOGRAFIA_dt_fot_fim := frmDesigner.tblCenariosFOTOGRAFIA_DT_FOT_FIM.Value;
            sFOTOGRAFIA_dt_com_ini := frmDesigner.tblCenariosFOTOGRAFIA_DT_COM_INI.Value;
            sFOTOGRAFIA_dt_com_fim := frmDesigner.tblCenariosFOTOGRAFIA_DT_COM_FIM.Value;

            sFREQUENCIA_data       := frmDesigner.tblCenariosFREQUENCIA_DATA.Value;
            sFREQUENCIA_data_base  := frmDesigner.tblCenariosFREQUENCIA_DATA_BASE.Value;
            sFREQUENCIA_valor      := frmDesigner.tblCenariosFREQUENCIA_VALOR.Value;
            sFREQUENCIA_dias       := frmDesigner.tblCenariosFREQUENCIA_DIAS.Value;
            sFREQUENCIA_atual      := frmDesigner.tblCenariosFREQUENCIA_ATUAL.Value;
            sFREQUENCIA_dt_fre_ini := frmDesigner.tblCenariosFREQUENCIA_DT_FRE_INI.Value;
            sFREQUENCIA_dt_fre_fim := frmDesigner.tblCenariosFREQUENCIA_DT_FRE_FIM.Value;

            vA                     := frmDesigner.tblCenariosA.AsInteger;
            vB                     := frmDesigner.tblCenariosB.AsInteger;
            vC                     := frmDesigner.tblCenariosC.AsInteger;
            vD                     := frmDesigner.tblCenariosD.AsInteger;
            vE                     := frmDesigner.tblCenariosE.AsInteger;

            ListBox2.Items.Text    := frmDesigner.tblCenariosFILTROS.Value;
            ListBox4.Items.Text    := frmDesigner.tblCenariosELEMENTOS.Value;

            cbxOrdem.Properties.Items.Add(frmDesigner.tblCenariosORDEM.Value);
            cbxOrdem.Text          := frmDesigner.tblCenariosORDEM.Value;

            if frmDesigner.tblCenariosORDEM_TIPO.Value = 'C' then
               rgpOrdem.ItemIndex := 0
            else
               rgpOrdem.ItemIndex := 1;

            edtLinha.EditValue     := frmDesigner.tblCenariosLINHAS.Value;
            edtRegistros.EditValue := frmDesigner.tblCenariosREGISTROS.Value;

            for i := 0 to CheckListBox2.Items.Count - 1 do
            begin
                CheckListBox2.Items.Items[i].Checked := false;
                for a := 0 to ListBox4.Items.Count - 1 do
                begin
                    if CheckListBox2.Items.Items[i].Text = ListBox4.Items.Strings[a] then
                       CheckListBox2.Items.Items[i].Checked := True;
                end;
            end;

            ListBox4.Items.Text := frmDesigner.tblCenariosVALORES.Value;
            for i := 0 to CheckListBox3.Items.Count - 1 do
            begin
                CheckListBox3.Items.Items[i].Checked := false;
                for a := 0 to ListBox4.Items.Count - 1 do
                begin
                    if CheckListBox3.Items.Items[i].Text = ListBox4.Items.Strings[a] then
                       CheckListBox3.Items.Items[i].Checked := True;
                end;
            end;

            CheckListBox1.Clear;
        end;
    end
    else
    begin
        ListBox2.Clear;
        CheckListBox1.Clear;
        vA := 100;
        vB := 90;
        vC := 80;
        vD := 70;
        vE := 40;
        cbxOrdem.Text          := HCLResourceStrings.FindID('sString_331');
        rgpOrdem.ItemIndex     := 0;
        edtLinha.EditValue     := 0;
        edtRegistros.EditValue := 0;
    end;
end;

procedure TfrmDesigner.cbxOrdemPropertiesInitPopup(Sender: TObject);
var
    i : integer;
begin
    cbxOrdem.Properties.Items.Clear;
    cbxOrdem.Properties.Items.Add(HCLResourceStrings.FindID('sString_331'));
    cbxOrdem.Text := HCLResourceStrings.FindID('sString_331');

    for i := 0 to CheckListBox2.Items.Count - 1 do
    begin
        if CheckListBox2.Items.Items[i].Checked then
           cbxOrdem.Properties.Items.Add(CheckListBox2.Items.Items[i].Text);
    end;

    for i := 0 to CheckListBox3.Items.Count - 1 do
    begin
        if CheckListBox3.Items.Items[i].Checked then
           cbxOrdem.Properties.Items.Add(CheckListBox3.Items.Items[i].Text);
    end;
end;

procedure TfrmDesigner.CheckListBox1ClickCheck(Sender: TObject;
  AIndex: Integer; APrevState, ANewState: TcxCheckBoxState);
var
    i : integer;
begin
    if (frmDesigner.sSGBD = 'Microsoft Access 2007')        or
       (frmDesigner.sSGBD = 'Microsoft Access 2010')        or
       (frmDesigner.sSGBD = 'Microsoft SQL Server 2000')    or
       (frmDesigner.sSGBD = 'Microsoft SQL Server 2005')    or
       (frmDesigner.sSGBD = 'Microsoft SQL Server 2008')    or
       (frmDesigner.sSGBD = 'Microsoft SQL Server 2008 R2') or
       (frmDesigner.sSGBD = 'Microsoft SQL Server 2012')    then
    begin
        if CheckListBox1.Items.Items[CheckListBox1.ItemIndex].Checked then
        begin
            ListBox2.Items.Add('[' + ListBox1.Items.Strings[ListBox1.ItemIndex] + ']' + ListBox3.Items.Strings[CheckListBox1.ItemIndex]);
        end
        else
        begin
            i := 0;
            while i <= ListBox2.Items.Count - 1 do
            begin
                if ListBox2.Items.Strings[i] = '[' + ListBox1.Items.Strings[ListBox1.ItemIndex] + ']' + ListBox3.Items.Strings[CheckListBox1.ItemIndex] then
                   ListBox2.Items.Delete(i)
                else
                   i := i + 1;
            end;
        end;
    end;

    if frmDesigner.sSGBD = 'Sun MySQL 5.x' then
    begin
        if CheckListBox1.Items.Items[CheckListBox1.ItemIndex].Checked then
        begin
            ListBox2.Items.Add('`' + ListBox1.Items.Strings[ListBox1.ItemIndex] + '`' + ListBox3.Items.Strings[CheckListBox1.ItemIndex]);
        end
        else
        begin
            i := 0;
            while i <= ListBox2.Items.Count - 1 do
            begin
                if ListBox2.Items.Strings[i] = '`' + ListBox1.Items.Strings[ListBox1.ItemIndex] + '`' + ListBox3.Items.Strings[CheckListBox1.ItemIndex] then
                   ListBox2.Items.Delete(i)
                else
                   i := i + 1;
            end;
        end;
    end;
end;

procedure TfrmDesigner.CheckListBox2CheckStatesToEditValue(Sender: TObject;
  const ACheckStates: TcxCheckStates; out AEditValue: Variant);
var
    i : integer;
    lPode : boolean;
begin
    lPode := True;
    for i := 0 to CheckListBox2.Items.Count - 1 do
    begin
        if CheckListBox2.Items.Items[i].Checked then
           if CheckListBox2.Items.Items[i].Text = cbxOrdem.Text then
              lPode := False;
    end;

    if lPode then
    begin
        for i := 0 to CheckListBox3.Items.Count - 1 do
        begin
            if CheckListBox3.Items.Items[i].Checked then
               if CheckListBox3.Items.Items[i].Text = cbxOrdem.Text then
                  lPode := False;
        end;
    end;

    if lPode then
    begin
        cbxOrdem.Properties.Items.Clear;
        cbxOrdem.Properties.Items.Add(HCLResourceStrings.FindID('sString_331'));
        cbxOrdem.Text := HCLResourceStrings.FindID('sString_331');

        rgpOrdem.ItemIndex := 0;
    end;
end;

procedure TfrmDesigner.cxButton10Click(Sender: TObject);
begin
    if frmDescricao = nil then
    begin
        frmDescricao := TfrmDescricao.Create(Self);

        frmDescricao.cxMemo1.Clear;
        frmDescricao.cxMemo1.Lines.Text := frmDesigner.tblAnalisesDESCRICAO.Value;

        frmDescricao.ShowModal;
        FreeAndNil(frmDescricao);
    end
    else
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
        FreeAndNil(frmDescricao);
    end;
end;

procedure TfrmDesigner.cxButton1Click(Sender: TObject);
begin
    frmDesigner.lCancFiltroPersonalizado := True;

    if frmFiltroPersonalizado = nil then
    begin
        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;

        if (frmDesigner.sSGBD = 'Microsoft Access 2007')        or
           (frmDesigner.sSGBD = 'Microsoft Access 2010')        or
           (frmDesigner.sSGBD = 'Microsoft SQL Server 2000')    or
           (frmDesigner.sSGBD = 'Microsoft SQL Server 2005')    or
           (frmDesigner.sSGBD = 'Microsoft SQL Server 2008')    or
           (frmDesigner.sSGBD = 'Microsoft SQL Server 2008 R2') or
           (frmDesigner.sSGBD = 'Microsoft SQL Server 2012')    then
        begin
            if (frmDesigner.tblAnalisesBASE_ORIGEM.Value  = '.') and
               (frmDesigner.tblAnalisesVISAO_ORIGEM.Value = '.') then
                ADOQuery1.SQL.Add('SELECT TOP 1 * FROM ' + '[' + frmDesigner.tblAnalisesVISAO_DESTINO.Value + ']')
            else
                ADOQuery1.SQL.Add('SELECT TOP 1 * FROM ' + '[_' + frmDesigner.tblAnalisesVISAO_DESTINO.Value + ']');
        end;

        if frmDesigner.sSGBD = 'Sun MySQL 5.x' then
        begin
            if (frmDesigner.tblAnalisesBASE_ORIGEM.Value  = '.') and
               (frmDesigner.tblAnalisesVISAO_ORIGEM.Value = '.') then
                ADOQuery1.SQL.Add('SELECT * FROM ' + '`' + frmDesigner.tblAnalisesVISAO_DESTINO.Value + '`' + ' LIMIT 0,1')
            else
                ADOQuery1.SQL.Add('SELECT * FROM ' + '`_' + frmDesigner.tblAnalisesVISAO_DESTINO.Value + '` LIMIT 0,1');
        end;

        ADOQuery1.Open;

        frmFiltroPersonalizado := TfrmFiltroPersonalizado.Create(Self);
        frmFiltroPersonalizado.Caption := frmFiltroPersonalizado.Caption + ' ' + cAnalise;

        try
           sStream.Position := 0;
           frmFiltroPersonalizado.cxDBFilterControl1.LoadFromStream(sStream);
        except
        end;

        frmFiltroPersonalizado.sCubo := sCubo;
        frmFiltroPersonalizado.ShowModal;
        FreeAndNil(frmFiltroPersonalizado);

        ADOQuery1.Close;
    end
    else
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
        FreeAndNil(frmFiltroPersonalizado);
    end;
end;

procedure TfrmDesigner.cxButton5Click(Sender: TObject);
var
    i, a : integer;
begin
    a := 0;
    for i := 0 to CheckListBox2.Items.Count - 1 do
    begin
        if CheckListBox2.Items.Items[i].Checked then
           a := 1
    end;

    if a = 0 then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_26'), mtInformation, [mbOK], 0);
        Exit;
    end;

    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;

    campos  := '';
    campos1 := '';

    for i := 0 to CheckListBox2.Items.Count - 1 do
        MontaCabecalho(i);

    if (frmDesigner.sSGBD = 'Microsoft Access 2007')        or
       (frmDesigner.sSGBD = 'Microsoft Access 2010')        or
       (frmDesigner.sSGBD = 'Microsoft SQL Server 2000')    or
       (frmDesigner.sSGBD = 'Microsoft SQL Server 2005')    or
       (frmDesigner.sSGBD = 'Microsoft SQL Server 2008')    or
       (frmDesigner.sSGBD = 'Microsoft SQL Server 2008 R2') or
       (frmDesigner.sSGBD = 'Microsoft SQL Server 2012')    then
    begin
        if edtLinha.EditValue = 0 then
           ADOQuery1.SQL.Add('SELECT ' + campos)
        else
           ADOQuery1.SQL.Add('SELECT TOP ' + VarToStr(edtLinha.EditValue) + ' ' + campos);
    end;

    if frmDesigner.sSGBD = 'Sun MySQL 5.x' then
       ADOQuery1.SQL.Add('SELECT ' + campos);

    if (frmDesigner.sSGBD = 'Microsoft Access 2007')        or
       (frmDesigner.sSGBD = 'Microsoft Access 2010')        or
       (frmDesigner.sSGBD = 'Microsoft SQL Server 2000')    or
       (frmDesigner.sSGBD = 'Microsoft SQL Server 2005')    or
       (frmDesigner.sSGBD = 'Microsoft SQL Server 2008')    or
       (frmDesigner.sSGBD = 'Microsoft SQL Server 2008 R2') or
       (frmDesigner.sSGBD = 'Microsoft SQL Server 2012')    then
    begin
        if (frmDesigner.tblAnalisesBASE_ORIGEM.Value  = '.') and
           (frmDesigner.tblAnalisesVISAO_ORIGEM.Value = '.') then
            ADOQuery1.SQL.Add('FROM ' + '[' + frmDesigner.tblAnalisesVISAO_DESTINO.Value + ']')
        else
            ADOQuery1.SQL.Add('FROM ' + '[_' + frmDesigner.tblAnalisesVISAO_DESTINO.Value + ']');
    end;

    if frmDesigner.sSGBD = 'Sun MySQL 5.x' then
    begin
        if (frmDesigner.tblAnalisesBASE_ORIGEM.Value  = '.') and
           (frmDesigner.tblAnalisesVISAO_ORIGEM.Value = '.') then
            ADOQuery1.SQL.Add('FROM ' + '`' + frmDesigner.tblAnalisesVISAO_DESTINO.Value + '`')
        else
            ADOQuery1.SQL.Add('FROM ' + '`_' + frmDesigner.tblAnalisesVISAO_DESTINO.Value + '`');
    end;

    if ListBox2.Items.Count > 0 then
    begin
        ADOQuery1.SQL.Add('WHERE');

        a := 0;
        for i := 0 to ListBox2.Items.Count - 1 do
        begin
            if a <> 0 then
               ADOQuery1.SQL.Add('OR ' + ListBox2.Items.Strings[i])
            else
               ADOQuery1.SQL.Add(ListBox2.Items.Strings[i]);

            a := a + 1;
        end;
    end;

    if cFiltroPersonalizado <> '' then
    begin
        if ListBox2.Items.Count > 0 then
           ADOQuery1.SQL.Add('OR (' + cFiltroPersonalizado + ')')
        else
           ADOQuery1.SQL.Add('WHERE (' + cFiltroPersonalizado + ')');
    end;

    if frmDesigner.sSGBD = 'Sun MySQL 5.x' then
       if edtLinha.EditValue > 0 then
          ADOQuery1.SQL.Add('LIMIT 0, ' + VarToStr(edtLinha.EditValue));

    if frmCriaDynamics = nil then
    begin
        frmCriaDynamics := TfrmCriaDynamics.Create(Self);
        frmCriaDynamics.SQL  := ADOQuery1.SQL.Text;
        frmCriaDynamics.ShowModal;
        FreeAndNil(frmCriaDynamics);
    end
    else
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
        FreeAndNil(frmCriaDynamics);
    end;

    ADOQuery1.Close;
end;

Initialization
Begin
    SetLanguage(1, nil);
end;

end.

