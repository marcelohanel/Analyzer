unit uScheduler;

interface

uses
  xhConsts, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus,






  cxStyles,
  cxScheduler, cxSchedulerStorage, cxSchedulerCustomControls,
  cxSchedulerDayView,
  cxSchedulerTimeGridView,
  cxSchedulerWeekView, cxSchedulerYearView,
  DB,


  cxGridCardView, cxGridTableView, dxmdaset,
  cxGridPopupMenu, dxPScxEditorLnks,
  dxPSCore, StdCtrls, cxGridLevel, cxGridDBCardView,
  cxGridDBTableView,
  cxGridCustomView, cxGrid, cxMemo, cxPC, cxLabel,
  cxDropDownEdit, cxButtons, ExtCtrls, cxSchedulerOutlookExchange,
  cxLookAndFeels, dxSkinsForm,





  cxLocalization,



  CEVersionInfo, cxGraphics, cxControls, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter,
  cxSchedulerCustomResourceView, cxSchedulerDateNavigator, cxSchedulerHolidays,
  cxSchedulerUtils, cxSchedulerGanttView, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxDBData, cxTextEdit, cxCalendar, cxHyperLinkEdit, cxBlobEdit,
  dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer,
  dxSkinsdxBarPainter, ImgList, cxGridCustomPopupMenu, dxPSTextLnk,
  dxPScxCommon, cxGridCustomTableView, cxClasses, cxMaskEdit, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint, cxPCdxBarPopupMenu, dxSkinscxSchedulerPainter,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, cxGridCustomLayoutView, dxPScxTLLnk;

type
  TfrmScheduler = class(TForm)
    Panel1: TPanel;
    dxComponentPrinter1: TdxComponentPrinter;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGridPopupMenu1: TcxGridPopupMenu;
    dxMemData1: TdxMemData;
    dxMemData1Titulo: TStringField;
    dxMemData1Usuario: TStringField;
    dxMemData1Senha: TStringField;
    dxMemData1Validade: TDateField;
    dxMemData1URL: TStringField;
    cxGrid1DBTableView1: TcxGridDBTableView;
    DataSource1: TDataSource;
    dxMemData1Grupo: TStringField;
    cxGrid1DBTableView1Titulo: TcxGridDBColumn;
    cxGrid1DBTableView1Grupo: TcxGridDBColumn;
    cxGrid1DBTableView1Usuario: TcxGridDBColumn;
    cxGrid1DBTableView1Senha: TcxGridDBColumn;
    cxGrid1DBTableView1Validade: TcxGridDBColumn;
    cxGrid1DBTableView1URL: TcxGridDBColumn;
    cxGrid1DBTableView1Descricao: TcxGridDBColumn;
    dxMemData1Descricao: TMemoField;
    ImageList1: TImageList;
    dxComponentPrinter1Link3: TdxGridReportLink;
    cxTabSheet4: TcxTabSheet;
    dxComponentPrinter1Link4: TcxMemoReportLink;
    cxTabControl1: TcxTabControl;
    PopupMenu1: TPopupMenu;
    CriarAnotao1: TMenuItem;
    ApagarAnotao1: TMenuItem;
    cxMemo1: TcxMemo;
    cxGrid1Level2: TcxGridLevel;
    cxGrid1DBCardView1: TcxGridDBCardView;
    cxGrid1DBCardView1RecId: TcxGridDBCardViewRow;
    cxGrid1DBCardView1Titulo: TcxGridDBCardViewRow;
    cxGrid1DBCardView1Grupo: TcxGridDBCardViewRow;
    cxGrid1DBCardView1Usuario: TcxGridDBCardViewRow;
    cxGrid1DBCardView1Senha: TcxGridDBCardViewRow;
    cxGrid1DBCardView1Validade: TcxGridDBCardViewRow;
    cxGrid1DBCardView1URL: TcxGridDBCardViewRow;
    cxGrid1DBCardView1Descricao: TcxGridDBCardViewRow;
    cxStyleRepository1: TcxStyleRepository;
    Memo1: TMemo;
    cxStyleRepository2: TcxStyleRepository;
    cxScheduler1: TcxScheduler;
    dxSkinController1: TdxSkinController;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
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
    GridTableViewStyleSheetUserFormat1: TcxGridTableViewStyleSheet;
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
    GridTableViewStyleSheetUserFormat2: TcxGridTableViewStyleSheet;
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
    GridTableViewStyleSheetUserFormat3: TcxGridTableViewStyleSheet;
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
    GridTableViewStyleSheetUserFormat4: TcxGridTableViewStyleSheet;
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
    GridTableViewStyleSheetBrick: TcxGridTableViewStyleSheet;
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
    GridTableViewStyleSheetDesert: TcxGridTableViewStyleSheet;
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
    GridTableViewStyleSheetEggplant: TcxGridTableViewStyleSheet;
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
    GridTableViewStyleSheetLilac: TcxGridTableViewStyleSheet;
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
    GridTableViewStyleSheetMaple: TcxGridTableViewStyleSheet;
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
    GridTableViewStyleSheetMarinehighcolor: TcxGridTableViewStyleSheet;
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
    GridTableViewStyleSheetPlumhighcolor: TcxGridTableViewStyleSheet;
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
    GridTableViewStyleSheetPumpkinlarge: TcxGridTableViewStyleSheet;
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
    GridTableViewStyleSheetRainyDay: TcxGridTableViewStyleSheet;
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
    GridTableViewStyleSheetRedWhiteandBlueVGA: TcxGridTableViewStyleSheet;
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
    GridTableViewStyleSheetRose: TcxGridTableViewStyleSheet;
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
    GridTableViewStyleSheetRoselarge: TcxGridTableViewStyleSheet;
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
    GridTableViewStyleSheetSlate: TcxGridTableViewStyleSheet;
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
    GridTableViewStyleSheetSpruce: TcxGridTableViewStyleSheet;
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
    GridTableViewStyleSheetStormVGA: TcxGridTableViewStyleSheet;
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
    GridTableViewStyleSheetTealVGA: TcxGridTableViewStyleSheet;
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
    GridTableViewStyleSheetWheat: TcxGridTableViewStyleSheet;
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
    GridTableViewStyleSheetWindowsClassic: TcxGridTableViewStyleSheet;
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
    GridTableViewStyleSheetWindowsClassiclarge: TcxGridTableViewStyleSheet;
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
    GridTableViewStyleSheetWindowsStandard: TcxGridTableViewStyleSheet;
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
    GridTableViewStyleSheetWindowsStandardlarge: TcxGridTableViewStyleSheet;
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
    GridTableViewStyleSheetHighContrast1: TcxGridTableViewStyleSheet;
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
    GridTableViewStyleSheetHighContrast1large: TcxGridTableViewStyleSheet;
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
    GridTableViewStyleSheetHighContrast2: TcxGridTableViewStyleSheet;
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
    GridTableViewStyleSheetHighContrast2large: TcxGridTableViewStyleSheet;
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
    GridTableViewStyleSheetHighContrastBlack: TcxGridTableViewStyleSheet;
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
    GridTableViewStyleSheetHighContrastBlacklarge: TcxGridTableViewStyleSheet;
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
    GridTableViewStyleSheetHighContrastWhite: TcxGridTableViewStyleSheet;
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
    GridTableViewStyleSheetHighContrastWhitelarge: TcxGridTableViewStyleSheet;
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
    GridCardViewStyleSheetDevExpress: TcxGridCardViewStyleSheet;
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
    GridCardViewStyleSheetUserFormat1: TcxGridCardViewStyleSheet;
    cxStyle388: TcxStyle;
    cxStyle389: TcxStyle;
    cxStyle390: TcxStyle;
    cxStyle391: TcxStyle;
    cxStyle392: TcxStyle;
    cxStyle393: TcxStyle;
    cxStyle394: TcxStyle;
    GridCardViewStyleSheetUserFormat2: TcxGridCardViewStyleSheet;
    cxStyle395: TcxStyle;
    cxStyle396: TcxStyle;
    cxStyle397: TcxStyle;
    cxStyle398: TcxStyle;
    cxStyle399: TcxStyle;
    cxStyle400: TcxStyle;
    cxStyle401: TcxStyle;
    GridCardViewStyleSheetUserFormat3: TcxGridCardViewStyleSheet;
    cxStyle402: TcxStyle;
    cxStyle403: TcxStyle;
    cxStyle404: TcxStyle;
    cxStyle405: TcxStyle;
    cxStyle406: TcxStyle;
    cxStyle407: TcxStyle;
    cxStyle408: TcxStyle;
    GridCardViewStyleSheetUserFormat4: TcxGridCardViewStyleSheet;
    cxStyle409: TcxStyle;
    cxStyle410: TcxStyle;
    cxStyle411: TcxStyle;
    cxStyle412: TcxStyle;
    cxStyle413: TcxStyle;
    cxStyle414: TcxStyle;
    cxStyle415: TcxStyle;
    GridCardViewStyleSheetBrick: TcxGridCardViewStyleSheet;
    cxStyle416: TcxStyle;
    cxStyle417: TcxStyle;
    cxStyle418: TcxStyle;
    cxStyle419: TcxStyle;
    cxStyle420: TcxStyle;
    cxStyle421: TcxStyle;
    cxStyle422: TcxStyle;
    GridCardViewStyleSheetDesert: TcxGridCardViewStyleSheet;
    cxStyle423: TcxStyle;
    cxStyle424: TcxStyle;
    cxStyle425: TcxStyle;
    cxStyle426: TcxStyle;
    cxStyle427: TcxStyle;
    cxStyle428: TcxStyle;
    cxStyle429: TcxStyle;
    GridCardViewStyleSheetEggplant: TcxGridCardViewStyleSheet;
    cxStyle430: TcxStyle;
    cxStyle431: TcxStyle;
    cxStyle432: TcxStyle;
    cxStyle433: TcxStyle;
    cxStyle434: TcxStyle;
    cxStyle435: TcxStyle;
    cxStyle436: TcxStyle;
    GridCardViewStyleSheetLilac: TcxGridCardViewStyleSheet;
    cxStyle437: TcxStyle;
    cxStyle438: TcxStyle;
    cxStyle439: TcxStyle;
    cxStyle440: TcxStyle;
    cxStyle441: TcxStyle;
    cxStyle442: TcxStyle;
    cxStyle443: TcxStyle;
    GridCardViewStyleSheetMaple: TcxGridCardViewStyleSheet;
    cxStyle444: TcxStyle;
    cxStyle445: TcxStyle;
    cxStyle446: TcxStyle;
    cxStyle447: TcxStyle;
    cxStyle448: TcxStyle;
    cxStyle449: TcxStyle;
    cxStyle450: TcxStyle;
    GridCardViewStyleSheetMarinehighcolor: TcxGridCardViewStyleSheet;
    cxStyle451: TcxStyle;
    cxStyle452: TcxStyle;
    cxStyle453: TcxStyle;
    cxStyle454: TcxStyle;
    cxStyle455: TcxStyle;
    cxStyle456: TcxStyle;
    cxStyle457: TcxStyle;
    GridCardViewStyleSheetPlumhighcolor: TcxGridCardViewStyleSheet;
    cxStyle458: TcxStyle;
    cxStyle459: TcxStyle;
    cxStyle460: TcxStyle;
    cxStyle461: TcxStyle;
    cxStyle462: TcxStyle;
    cxStyle463: TcxStyle;
    cxStyle464: TcxStyle;
    cxStyle465: TcxStyle;
    GridCardViewStyleSheetPumpkinlarge: TcxGridCardViewStyleSheet;
    cxStyle466: TcxStyle;
    cxStyle467: TcxStyle;
    cxStyle468: TcxStyle;
    cxStyle469: TcxStyle;
    cxStyle470: TcxStyle;
    cxStyle471: TcxStyle;
    cxStyle472: TcxStyle;
    GridCardViewStyleSheetRainyDay: TcxGridCardViewStyleSheet;
    cxStyle473: TcxStyle;
    cxStyle474: TcxStyle;
    cxStyle475: TcxStyle;
    cxStyle476: TcxStyle;
    cxStyle477: TcxStyle;
    cxStyle478: TcxStyle;
    cxStyle479: TcxStyle;
    GridCardViewStyleSheetRedWhiteandBlueVGA: TcxGridCardViewStyleSheet;
    cxStyle480: TcxStyle;
    cxStyle481: TcxStyle;
    cxStyle482: TcxStyle;
    cxStyle483: TcxStyle;
    cxStyle484: TcxStyle;
    cxStyle485: TcxStyle;
    cxStyle486: TcxStyle;
    GridCardViewStyleSheetRose: TcxGridCardViewStyleSheet;
    cxStyle487: TcxStyle;
    cxStyle488: TcxStyle;
    cxStyle489: TcxStyle;
    cxStyle490: TcxStyle;
    cxStyle491: TcxStyle;
    cxStyle492: TcxStyle;
    cxStyle493: TcxStyle;
    GridCardViewStyleSheetRoselarge: TcxGridCardViewStyleSheet;
    cxStyle494: TcxStyle;
    cxStyle495: TcxStyle;
    cxStyle496: TcxStyle;
    cxStyle497: TcxStyle;
    cxStyle498: TcxStyle;
    cxStyle499: TcxStyle;
    cxStyle500: TcxStyle;
    GridCardViewStyleSheetSlate: TcxGridCardViewStyleSheet;
    cxStyle501: TcxStyle;
    cxStyle502: TcxStyle;
    cxStyle503: TcxStyle;
    cxStyle504: TcxStyle;
    cxStyle505: TcxStyle;
    cxStyle506: TcxStyle;
    cxStyle507: TcxStyle;
    GridCardViewStyleSheetSpruce: TcxGridCardViewStyleSheet;
    cxStyle508: TcxStyle;
    cxStyle509: TcxStyle;
    cxStyle510: TcxStyle;
    cxStyle511: TcxStyle;
    cxStyle512: TcxStyle;
    cxStyle513: TcxStyle;
    cxStyle514: TcxStyle;
    GridCardViewStyleSheetStormVGA: TcxGridCardViewStyleSheet;
    cxStyle515: TcxStyle;
    cxStyle516: TcxStyle;
    cxStyle517: TcxStyle;
    cxStyle518: TcxStyle;
    cxStyle519: TcxStyle;
    cxStyle520: TcxStyle;
    cxStyle521: TcxStyle;
    GridCardViewStyleSheetTealVGA: TcxGridCardViewStyleSheet;
    cxStyle522: TcxStyle;
    cxStyle523: TcxStyle;
    cxStyle524: TcxStyle;
    cxStyle525: TcxStyle;
    cxStyle526: TcxStyle;
    cxStyle527: TcxStyle;
    cxStyle528: TcxStyle;
    cxStyle529: TcxStyle;
    GridCardViewStyleSheetWheat: TcxGridCardViewStyleSheet;
    cxStyle530: TcxStyle;
    cxStyle531: TcxStyle;
    cxStyle532: TcxStyle;
    cxStyle533: TcxStyle;
    cxStyle534: TcxStyle;
    cxStyle535: TcxStyle;
    cxStyle536: TcxStyle;
    GridCardViewStyleSheetWindowsClassic: TcxGridCardViewStyleSheet;
    cxStyle537: TcxStyle;
    cxStyle538: TcxStyle;
    cxStyle539: TcxStyle;
    cxStyle540: TcxStyle;
    cxStyle541: TcxStyle;
    cxStyle542: TcxStyle;
    cxStyle543: TcxStyle;
    GridCardViewStyleSheetWindowsClassiclarge: TcxGridCardViewStyleSheet;
    cxStyle544: TcxStyle;
    cxStyle545: TcxStyle;
    cxStyle546: TcxStyle;
    cxStyle547: TcxStyle;
    cxStyle548: TcxStyle;
    cxStyle549: TcxStyle;
    cxStyle550: TcxStyle;
    GridCardViewStyleSheetWindowsStandard: TcxGridCardViewStyleSheet;
    cxStyle551: TcxStyle;
    cxStyle552: TcxStyle;
    cxStyle553: TcxStyle;
    cxStyle554: TcxStyle;
    cxStyle555: TcxStyle;
    cxStyle556: TcxStyle;
    cxStyle557: TcxStyle;
    cxStyle558: TcxStyle;
    GridCardViewStyleSheetWindowsStandardlarge: TcxGridCardViewStyleSheet;
    cxStyle559: TcxStyle;
    cxStyle560: TcxStyle;
    cxStyle561: TcxStyle;
    cxStyle562: TcxStyle;
    cxStyle563: TcxStyle;
    cxStyle564: TcxStyle;
    cxStyle565: TcxStyle;
    cxStyle566: TcxStyle;
    GridCardViewStyleSheetHighContrast1: TcxGridCardViewStyleSheet;
    cxStyle567: TcxStyle;
    cxStyle568: TcxStyle;
    cxStyle569: TcxStyle;
    cxStyle570: TcxStyle;
    cxStyle571: TcxStyle;
    cxStyle572: TcxStyle;
    cxStyle573: TcxStyle;
    GridCardViewStyleSheetHighContrast1large: TcxGridCardViewStyleSheet;
    cxStyle574: TcxStyle;
    cxStyle575: TcxStyle;
    cxStyle576: TcxStyle;
    cxStyle577: TcxStyle;
    cxStyle578: TcxStyle;
    cxStyle579: TcxStyle;
    cxStyle580: TcxStyle;
    GridCardViewStyleSheetHighContrast2: TcxGridCardViewStyleSheet;
    cxStyle581: TcxStyle;
    cxStyle582: TcxStyle;
    cxStyle583: TcxStyle;
    cxStyle584: TcxStyle;
    cxStyle585: TcxStyle;
    cxStyle586: TcxStyle;
    cxStyle587: TcxStyle;
    GridCardViewStyleSheetHighContrast2large: TcxGridCardViewStyleSheet;
    cxStyle588: TcxStyle;
    cxStyle589: TcxStyle;
    cxStyle590: TcxStyle;
    cxStyle591: TcxStyle;
    cxStyle592: TcxStyle;
    cxStyle593: TcxStyle;
    cxStyle594: TcxStyle;
    GridCardViewStyleSheetHighContrastBlack: TcxGridCardViewStyleSheet;
    cxStyle595: TcxStyle;
    cxStyle596: TcxStyle;
    cxStyle597: TcxStyle;
    cxStyle598: TcxStyle;
    cxStyle599: TcxStyle;
    cxStyle600: TcxStyle;
    cxStyle601: TcxStyle;
    GridCardViewStyleSheetHighContrastBlacklarge: TcxGridCardViewStyleSheet;
    cxStyle602: TcxStyle;
    cxStyle603: TcxStyle;
    cxStyle604: TcxStyle;
    cxStyle605: TcxStyle;
    cxStyle606: TcxStyle;
    cxStyle607: TcxStyle;
    cxStyle608: TcxStyle;
    GridCardViewStyleSheetHighContrastWhite: TcxGridCardViewStyleSheet;
    cxStyle609: TcxStyle;
    cxStyle610: TcxStyle;
    cxStyle611: TcxStyle;
    cxStyle612: TcxStyle;
    cxStyle613: TcxStyle;
    cxStyle614: TcxStyle;
    cxStyle615: TcxStyle;
    GridCardViewStyleSheetHighContrastWhitelarge: TcxGridCardViewStyleSheet;
    cxStyle616: TcxStyle;
    cxStyle617: TcxStyle;
    cxStyle618: TcxStyle;
    cxStyle619: TcxStyle;
    cxStyle620: TcxStyle;
    cxStyle621: TcxStyle;
    cxStyle622: TcxStyle;
    cxLabel1: TcxLabel;
    cxComboBox1: TcxComboBox;
    Label2: TcxLabel;
    ComboBox3: TcxComboBox;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxButton2: TcxButton;
    cxButton1: TcxButton;
    cxLocalizer1: TcxLocalizer;
    CEVersionInfo1: TCEVersionInfo;
    cxSchedulerStorage1: TcxSchedulerStorage;
    procedure cxButton4Click(Sender: TObject);
    procedure cxGrid1Exit(Sender: TObject);
    procedure cxMemo1Exit(Sender: TObject);
    procedure cxTabControl1Change(Sender: TObject);
    procedure ApagarAnotao1Click(Sender: TObject);
    procedure CriarAnotao1Click(Sender: TObject);
    procedure cxPageControl1Change(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxSchedulerStorage1EventInserted(Sender: TObject;
      AEvent: TcxSchedulerEvent; var AHandled: Boolean);
    procedure cxComboBox1PropertiesChange(Sender: TObject);
    procedure ComboBox3PropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure SalvarAnotacoes;
    procedure SalvarCalendario;
    procedure SalvarSenha;
    { Private declarations }
  public
    { Public declarations }
    sCaminho : string;
    sUsuario : string;
  end;

var
  frmScheduler: TfrmScheduler;

implementation

uses uFuncoes;

{$R *.dfm}

procedure TfrmScheduler.ApagarAnotao1Click(Sender: TObject);
begin
    if (MessageDlg(HCLResourceStrings.FindID('sString_342'), mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
        Exit;
        
    try
       DeleteFile(sCaminho + sUsuario + cxTabControl1.Tabs.Strings[cxTabControl1.TabIndex] + '.A02');
       cxTabControl1.Tabs.Delete(cxTabControl1.TabIndex);
    except
    end;

    if FileExists(sCaminho + sUsuario + '.A01') then
       DeleteFile(sCaminho + sUsuario + '.A01');

    cxTabControl1.Tabs.SaveToFile(sCaminho + sUsuario + '.A01');

    if cxTabControl1.Tabs.Count = 0 then
    begin
        if FileExists(sCaminho + sUsuario + '.A01') then
           DeleteFile(sCaminho + sUsuario + '.A01');
    end;

    cxTabControl1.OnChange(Self);
end;

procedure TfrmScheduler.ComboBox3PropertiesChange(Sender: TObject);
begin
   try
      cxGrid1DBTableView1.Styles.StyleSheet := cxStyleRepository1.StyleSheets[ComboBox3.ItemIndex];
      cxGrid1DBCardView1.Styles.StyleSheet := cxStyleRepository2.StyleSheets[ComboBox3.ItemIndex];
   except
      cxGrid1DBTableView1.Styles.StyleSheet := nil;
      cxGrid1DBCardView1.Styles.StyleSheet := nil;
   end;
end;

procedure TfrmScheduler.CriarAnotao1Click(Sender: TObject);
var
    aux : string;
    i : integer;
    lPode : boolean;
begin
    aux := InputBox(HCLResourceStrings.FindID('sString_343'),HCLResourceStrings.FindID('sString_344'),'');
    if aux <> '' then
    begin
        lPode := True;
        for i := 0 to cxTabControl1.Tabs.Count - 1 do
            if cxTabControl1.Tabs.Strings[i] = aux then
               lPode := False;

        if lPode then
           cxTabControl1.Tabs.Add(aux)
        else
           MessageDlg(HCLResourceStrings.FindID('sString_345'), mtInformation, [mbOK], 0);
    end;

    cxTabControl1.OnChange(Self);
end;

procedure TfrmScheduler.cxButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmScheduler.cxButton2Click(Sender: TObject);
begin
    if cxPageControl1.ActivePageIndex = 1 then
       dxComponentPrinter1.CurrentLinkIndex := 1;

    if cxPageControl1.ActivePageIndex = 2 then
       dxComponentPrinter1.CurrentLinkIndex := 0;

    dxComponentPrinter1.Preview(True,nil);
end;

procedure TfrmScheduler.cxButton3Click(Sender: TObject);
begin
    if (MessageDlg(HCLResourceStrings.FindID('sString_346'), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
        cxSchedulerImportFromOutlook(cxSchedulerStorage1);
end;

procedure TfrmScheduler.cxButton4Click(Sender: TObject);
begin
    if (MessageDlg(HCLResourceStrings.FindID('sString_341'), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
        cxSchedulerExportToOutlook(cxSchedulerStorage1);
end;

procedure TfrmScheduler.cxComboBox1PropertiesChange(Sender: TObject);
begin
    if cxComboBox1.Text = 'Dia' then
       cxScheduler1.ViewDay.Active := True
    else
    if cxComboBox1.Text = 'Linha do Tempo' then
       cxScheduler1.ViewTimeGrid.Active := True
    else
    if cxComboBox1.Text = 'Semana' then
       cxScheduler1.ViewWeek.Active := True
    else
    if cxComboBox1.Text = 'Semanas' then
       cxScheduler1.ViewWeeks.Active := True
    else
    if cxComboBox1.Text = 'Ano' then
       cxScheduler1.ViewYear.Active := True
    else
    if cxComboBox1.Text = 'Gantt' then
       cxScheduler1.ViewGantt.Active := True;
end;

procedure TfrmScheduler.cxGrid1Exit(Sender: TObject);
begin
    SalvarSenha;
end;

procedure TfrmScheduler.cxMemo1Exit(Sender: TObject);
begin
    SalvarAnotacoes;
end;

procedure TfrmScheduler.cxPageControl1Change(Sender: TObject);
begin
    cxComboBox1.Enabled := False;
    ComboBox3.Enabled   := False;
    cxButton3.Enabled   := False;
    cxButton4.Enabled   := False;
    cxButton2.Enabled   := False;

    if cxPageControl1.ActivePageIndex = 0 then
    begin
        cxComboBox1.Enabled := True;
        cxButton3.Enabled   := True;
        cxButton4.Enabled   := True;
    end;

    if cxPageControl1.ActivePageIndex = 1 then
    begin
       cxTabControl1.OnChange(Self);
       cxButton2.Enabled   := True;
    end;

    if cxPageControl1.ActivePageIndex = 2 then
    begin
        ComboBox3.Enabled := True;
        cxButton2.Enabled   := True;
    end;

    SalvarCalendario;
    SalvarAnotacoes;
    SalvarSenha;
end;

procedure TfrmScheduler.cxSchedulerStorage1EventInserted(Sender: TObject;
  AEvent: TcxSchedulerEvent; var AHandled: Boolean);
begin
    SalvarCalendario;
end;

procedure TfrmScheduler.SalvarAnotacoes;
begin
    if cxPageControl1.ActivePageIndex = 1 then
    begin
        if FileExists(sCaminho + sUsuario + '.A01') then
           DeleteFile(sCaminho + sUsuario + '.A01');

        cxTabControl1.Tabs.SaveToFile(sCaminho + sUsuario + '.A01');

        if cxTabControl1.Tabs.Count > 0 then
           cxMemo1.Lines.SaveToFile(sCaminho + sUsuario + cxTabControl1.Tabs.Strings[cxTabControl1.TabIndex] + '.A02');
    end;
end;

procedure TfrmScheduler.SalvarCalendario;
var
    AOptions: TcxGridStorageOptions;
begin
    AOptions := [gsoUseFilter, gsoUseSummary];
    cxScheduler1.StoreToIniFile(sCaminho + sUsuario + '.ini');
    cxSchedulerStorage1.SaveToFile(sCaminho + sUsuario + '.dat');

    Memo1.Lines.Clear;
    Memo1.Lines.Add(IntToStr(ComboBox3.ItemIndex));
    Memo1.Lines.SaveToFile(sCaminho + sUsuario + '.C01');
end;

procedure TfrmScheduler.SalvarSenha;
var
  AOptions: TcxGridStorageOptions;
begin
    AOptions := [gsoUseFilter, gsoUseSummary];

    if FileExists(sCaminho + sUsuario + '.S01') then
       DeleteFile(sCaminho + sUsuario + '.S01');

    dxMemData1.SaveToBinaryFile(sCaminho + sUsuario + '.S01');
    
    cxGrid1DBTableView1.StoreToIniFile(sCaminho + sUsuario + '.S02', True, AOptions);
    cxGrid1DBCardView1.StoreToIniFile(sCaminho + sUsuario + '.S03', True, AOptions);
end;

procedure TfrmScheduler.cxTabControl1Change(Sender: TObject);
begin
    if cxPageControl1.ActivePageIndex = 1 then
    begin
        try
           if cxTabControl1.Tabs.Count > 0 then
            begin
                cxMemo1.Lines.Clear;
                cxMemo1.Enabled := True;
                cxMemo1.Lines.LoadFromFile(sCaminho + sUsuario + cxTabControl1.Tabs.Strings[cxTabControl1.TabIndex] + '.A02');
            end
            else
            begin
                cxMemo1.Lines.Clear;
                cxMemo1.Enabled := False;
            end;
        except
        end;
    end;
end;

procedure TfrmScheduler.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    try
        if (MessageDlg(HCLResourceStrings.FindID('sString_349'), mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
        begin
            Action := caNone;
            exit;
        end;

        SalvarCalendario;
        SalvarAnotacoes;
        SalvarSenha;

        dxMemData1.Close;

        Action := caFree;
    except
        Application.Terminate;
    end;
end;

procedure TfrmScheduler.FormCreate(Sender: TObject);
begin
    Self.Caption := CEVersionInfo1.ProductName + ' - ' + CEVersionInfo1.FileVersion;

    SetLanguage(2,cxLocalizer1);

    dxSkinController1.SkinName := ParamStr(3);
    if ParamStr(3) <> 'Nenhum' then
       dxSkinController1.UseSkins := True
    else
       dxSkinController1.UseSkins := False;
end;

procedure TfrmScheduler.FormShow(Sender: TObject);
var
    AOptions: TcxGridStorageOptions;
    i : integer;
begin
    if ParamStr(1) = '' then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_351'), mtError, [mbOK], 0);
        Application.Terminate;
    end;

    if ParamStr(2) = '' then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_352'), mtError, [mbOK], 0);
        Application.Terminate;
    end;

    sCaminho := ParamStr(1) + '\';
    sUsuario := ParamStr(2);
    AOptions := [gsoUseFilter, gsoUseSummary];

    try
       cxScheduler1.RestoreFromIniFile(sCaminho + sUsuario + '.ini');
    except
    end;

    try
       cxSchedulerStorage1.LoadFromFile(sCaminho + sUsuario + '.dat');
    except
    end;

    try
       dxMemData1.LoadFromBinaryFile(sCaminho + sUsuario + '.S01');
    except
    end;

    try
       cxGrid1DBTableView1.RestoreFromIniFile(sCaminho + sUsuario + '.S02',True,False,AOptions);
    except
    end;

    try
       cxGrid1DBCardView1.RestoreFromIniFile(sCaminho + sUsuario + '.S03',True,False,AOptions);
    except
    end;

    try
       cxTabControl1.Tabs.LoadFromFile(sCaminho + sUsuario + '.A01');
    except
    end;

    if cxScheduler1.ViewTimeGrid.Active then
       cxScheduler1.ViewDay.Active := True;

    dxMemData1.Open;

    ComboBox3.Properties.Items.Clear;
    for i := 0 to cxStyleRepository1.StyleSheetCount - 1 do
        ComboBox3.Properties.Items.Add(cxStyleRepository1.StyleSheets[i].Caption);

    try
       Memo1.Lines.Clear;
       Memo1.Lines.LoadFromFile(sCaminho + sUsuario + '.C01');
       ComboBox3.ItemIndex := StrToInt(Trim(Memo1.Lines.Text));
    except
    end;

    cxPageControl1.ActivePageIndex := 0;
end;

Initialization
Begin
    SetLanguage(1, nil);
end;

end.
