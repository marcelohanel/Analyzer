unit uMostraScored;

interface

uses
  xhConsts, cxTLExportLink, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, cxStyles,
  cxEdit, cxGridCustomTableView, cxGridTableView,
  cxGridPopupMenu, StdCtrls,
  cxInplaceContainer, TeeProcs,
  TeEngine, Chart, Series, TeeEdiGene, EditChar, TeeGally,  TeeBrazil,
  TeeStore,

  dxPSCore,


  cxButtons, cxLabel, cxTextEdit,
  cxDropDownEdit, cxPC, cxTL, cxCheckBox,
  ADODB, cxEditRepositoryItems, cxGroupBox,
  cxMemo, Menus,
  AbRMeter, _GClass,








  cxLookAndFeels,



  cxLocalization, dxSkinsForm, CEVersionInfo, cxGraphics, cxControls,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxTLdxBarBuiltInMenu,
  cxContainer, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer,
  dxSkinsdxBarPainter, cxClasses, cxGridCustomPopupMenu, dxPScxCommon, ImgList,
  cxMaskEdit, cxRadioGroup, cxCalendar, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint, cxPCdxBarPopupMenu, dxPScxTLLnk, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, dxPScxVGridLnk, dxCore, cxDateUtils,
  ComCtrls;
type
  TfrmMostraScored = class(TForm)
    ADOQuery1: TADOQuery;
    cxEditRepository1: TcxEditRepository;
    ImageList1: TImageList;
    cxEditRepository1ImageComboBoxItem1: TcxEditRepositoryImageComboBoxItem;
    cxEditRepository1CurrencyItem1: TcxEditRepositoryCurrencyItem;
    cxEditRepository1ImageComboBoxItem2: TcxEditRepositoryImageComboBoxItem;
    dxComponentPrinter: TdxComponentPrinter;
    dxComponentPrinterLink1: TcxTreeListReportLink;
    SaveDialog1: TSaveDialog;
    cxEditRepository1DateItem1: TcxEditRepositoryDateItem;
    cxGridPopupMenu1: TcxGridPopupMenu;
    dxComponentPrinterLink2: TdxGridReportLink;
    cxEditRepository1BlobItem1: TcxEditRepositoryBlobItem;
    cxEditRepository1CurrencyItem2: TcxEditRepositoryCurrencyItem;
    cxEditRepository1MemoItem1: TcxEditRepositoryMemoItem;
    cxEditRepository1ImageComboBoxItem4: TcxEditRepositoryImageComboBoxItem;
    cxEditRepository1ImageComboBoxItem5: TcxEditRepositoryImageComboBoxItem;
    PageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTreeList1: TcxTreeList;
    cxTreeList1cxTreeListColumn1: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn2: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn3: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn4: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn5: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn6: TcxTreeListColumn;
    Panel3: TPanel;
    Label2: TcxLabel;
    ComboBox2: TcxComboBox;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxLabel2: TcxLabel;
    cxComboBox2: TcxComboBox;
    cxButton8: TcxButton;
    cxButton5: TcxButton;
    cxButton7: TcxButton;
    cxButton6: TcxButton;
    cxButton9: TcxButton;
    cxTabSheet2: TcxTabSheet;
    Chart1: TChart;
    Panel4: TPanel;
    cxComboBox1: TcxComboBox;
    cxLabel1: TcxLabel;
    cxEditRepository1TextItem1: TcxEditRepositoryTextItem;
    cxButton11: TcxButton;
    dxComponentPrinterLink3: TcxTreeListReportLink;
    cxButton12: TcxButton;
    cxButton13: TcxButton;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    mValor: TAb270Meter;
    mPercMaximo: TAb180Meter;
    mPercMinimo: TAb180Meter;
    Panel9: TPanel;
    imgAmarela: TImage;
    imgVermelha: TImage;
    imgVerde: TImage;
    Chart2: TChart;
    cxButton14: TcxButton;
    PopupMenu1: TPopupMenu;
    ExpandirNodos1: TMenuItem;
    RecolherNodos1: TMenuItem;
    AjustarColunas1: TMenuItem;
    N1: TMenuItem;
    Anotaes1: TMenuItem;
    PaineldeInformaesGrficas1: TMenuItem;
    CriarAnlise1: TMenuItem;
    PersonalizaroGrfico1: TMenuItem;
    RenomearColunas1: TMenuItem;
    N2: TMenuItem;
    Acumulados1: TMenuItem;
    PorAno1: TMenuItem;
    PorSemestre1: TMenuItem;
    PorTrimestre1: TMenuItem;
    HabilitarDashboard1: TMenuItem;
    Panel1: TPanel;
    SpeedButton9: TcxButton;
    cxButton10: TcxButton;
    cxButton4: TcxButton;
    SpeedButton4: TcxButton;
    SpeedButton2: TcxButton;
    cxButton1: TcxButton;
    SpeedButton5: TcxButton;
    SpeedButton3: TcxButton;
    SpeedButton1: TcxButton;
    cxCheckBox1: TcxCheckBox;
    cxButton16: TcxButton;
    Memo1: TMemo;
    dxSkinController1: TdxSkinController;
    bdDados: TADOConnection;
    bdArmazena: TADOConnection;
    cxLocalizer1: TcxLocalizer;
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
    tblScoredCard: TADOTable;
    tblScoredCardID_SCORED: TWideStringField;
    tblScoredCardDESCRICAO: TMemoField;
    tblScoredCardINCREMENTAL: TWideStringField;
    tblScoredCardPODE_VISUALIZAR: TMemoField;
    tblScoredCardPODE_ALTERAR: TMemoField;
    tblScoredCardPODE_ATUALIZAR: TMemoField;
    tblScoredCardPODE_APAGAR: TMemoField;
    tblScoredCardDT_ATUALIZACAO: TDateTimeField;
    tblScoredCardVALOR: TBlobField;
    tblScoredCardNRO_ATUALIZACOES: TIntegerField;
    tblScoredCardDT_MOVTO: TDateTimeField;
    tblScoredCardATUALIZA_SITUACAO_ANTERIOR: TWideStringField;
    tblScoredCardDT_CRIACAO: TDateTimeField;
    tblScoredCardEXCLUIR_MOVTO: TWideStringField;
    qryAtualiza: TADOQuery;
    cxStyleRepository3: TcxStyleRepository;
    cxStyle584: TcxStyle;
    cxStyle585: TcxStyle;
    cxStyle586: TcxStyle;
    cxStyle587: TcxStyle;
    cxStyle588: TcxStyle;
    cxStyle589: TcxStyle;
    cxStyle590: TcxStyle;
    cxStyle591: TcxStyle;
    cxStyle592: TcxStyle;
    cxStyle593: TcxStyle;
    cxStyle594: TcxStyle;
    cxStyle595: TcxStyle;
    cxStyle596: TcxStyle;
    cxStyle597: TcxStyle;
    cxStyle598: TcxStyle;
    cxStyle599: TcxStyle;
    cxStyle600: TcxStyle;
    cxStyle601: TcxStyle;
    cxStyle602: TcxStyle;
    cxStyle603: TcxStyle;
    cxStyle604: TcxStyle;
    cxStyle605: TcxStyle;
    cxStyle606: TcxStyle;
    cxStyle607: TcxStyle;
    cxStyle608: TcxStyle;
    cxStyle609: TcxStyle;
    cxStyle610: TcxStyle;
    cxStyle611: TcxStyle;
    cxStyle612: TcxStyle;
    cxStyle613: TcxStyle;
    cxStyle614: TcxStyle;
    cxStyle615: TcxStyle;
    cxStyle616: TcxStyle;
    cxStyle617: TcxStyle;
    cxStyle618: TcxStyle;
    cxStyle619: TcxStyle;
    cxStyle620: TcxStyle;
    cxStyle621: TcxStyle;
    cxStyle622: TcxStyle;
    cxStyle623: TcxStyle;
    cxStyle624: TcxStyle;
    cxStyle625: TcxStyle;
    cxStyle626: TcxStyle;
    cxStyle627: TcxStyle;
    cxStyle628: TcxStyle;
    cxStyle629: TcxStyle;
    cxStyle630: TcxStyle;
    cxStyle631: TcxStyle;
    cxStyle632: TcxStyle;
    cxStyle633: TcxStyle;
    cxStyle634: TcxStyle;
    cxStyle635: TcxStyle;
    cxStyle636: TcxStyle;
    cxStyle637: TcxStyle;
    cxStyle638: TcxStyle;
    cxStyle639: TcxStyle;
    cxStyle640: TcxStyle;
    cxStyle641: TcxStyle;
    cxStyle642: TcxStyle;
    cxStyle643: TcxStyle;
    cxStyle644: TcxStyle;
    cxStyle645: TcxStyle;
    cxStyle646: TcxStyle;
    cxStyle647: TcxStyle;
    cxStyle648: TcxStyle;
    cxStyle649: TcxStyle;
    cxStyle650: TcxStyle;
    cxStyle651: TcxStyle;
    cxStyle652: TcxStyle;
    cxStyle653: TcxStyle;
    cxStyle654: TcxStyle;
    cxStyle655: TcxStyle;
    cxStyle656: TcxStyle;
    cxStyle657: TcxStyle;
    cxStyle658: TcxStyle;
    cxStyle659: TcxStyle;
    cxStyle660: TcxStyle;
    cxStyle661: TcxStyle;
    cxStyle662: TcxStyle;
    cxStyle663: TcxStyle;
    cxStyle664: TcxStyle;
    cxStyle665: TcxStyle;
    cxStyle666: TcxStyle;
    cxStyle667: TcxStyle;
    cxStyle668: TcxStyle;
    cxStyle669: TcxStyle;
    cxStyle670: TcxStyle;
    cxStyle671: TcxStyle;
    cxStyle672: TcxStyle;
    cxStyle673: TcxStyle;
    cxStyle674: TcxStyle;
    cxStyle675: TcxStyle;
    cxStyle676: TcxStyle;
    cxStyle677: TcxStyle;
    cxStyle678: TcxStyle;
    cxStyle679: TcxStyle;
    cxStyle680: TcxStyle;
    cxStyle681: TcxStyle;
    cxStyle682: TcxStyle;
    cxStyle683: TcxStyle;
    cxStyle684: TcxStyle;
    cxStyle685: TcxStyle;
    cxStyle686: TcxStyle;
    cxStyle687: TcxStyle;
    cxStyle688: TcxStyle;
    cxStyle689: TcxStyle;
    cxStyle690: TcxStyle;
    cxStyle691: TcxStyle;
    cxStyle692: TcxStyle;
    cxStyle693: TcxStyle;
    cxStyle694: TcxStyle;
    cxStyle695: TcxStyle;
    cxStyle696: TcxStyle;
    cxStyle697: TcxStyle;
    cxStyle698: TcxStyle;
    cxStyle699: TcxStyle;
    cxStyle700: TcxStyle;
    cxStyle701: TcxStyle;
    cxStyle702: TcxStyle;
    cxStyle703: TcxStyle;
    cxStyle704: TcxStyle;
    cxStyle705: TcxStyle;
    cxStyle706: TcxStyle;
    cxStyle707: TcxStyle;
    cxStyle708: TcxStyle;
    cxStyle709: TcxStyle;
    cxStyle710: TcxStyle;
    cxStyle711: TcxStyle;
    cxStyle712: TcxStyle;
    cxStyle713: TcxStyle;
    cxStyle714: TcxStyle;
    cxStyle715: TcxStyle;
    cxStyle716: TcxStyle;
    cxStyle717: TcxStyle;
    cxStyle718: TcxStyle;
    cxStyle719: TcxStyle;
    cxStyle720: TcxStyle;
    cxStyle721: TcxStyle;
    cxStyle722: TcxStyle;
    cxStyle723: TcxStyle;
    cxStyle724: TcxStyle;
    cxStyle725: TcxStyle;
    cxStyle726: TcxStyle;
    cxStyle727: TcxStyle;
    cxStyle728: TcxStyle;
    cxStyle729: TcxStyle;
    cxStyle730: TcxStyle;
    cxStyle731: TcxStyle;
    cxStyle732: TcxStyle;
    cxStyle733: TcxStyle;
    cxStyle734: TcxStyle;
    cxStyle735: TcxStyle;
    cxStyle736: TcxStyle;
    cxStyle737: TcxStyle;
    cxStyle738: TcxStyle;
    cxStyle739: TcxStyle;
    cxStyle740: TcxStyle;
    cxStyle741: TcxStyle;
    cxStyle742: TcxStyle;
    cxStyle743: TcxStyle;
    cxStyle744: TcxStyle;
    cxStyle745: TcxStyle;
    cxStyle746: TcxStyle;
    cxStyle747: TcxStyle;
    cxStyle748: TcxStyle;
    cxStyle749: TcxStyle;
    cxStyle750: TcxStyle;
    cxStyle751: TcxStyle;
    cxStyle752: TcxStyle;
    cxStyle753: TcxStyle;
    cxStyle754: TcxStyle;
    cxStyle755: TcxStyle;
    cxStyle756: TcxStyle;
    cxStyle757: TcxStyle;
    cxStyle758: TcxStyle;
    cxStyle759: TcxStyle;
    cxStyle760: TcxStyle;
    cxStyle761: TcxStyle;
    cxStyle762: TcxStyle;
    cxStyle763: TcxStyle;
    cxStyle764: TcxStyle;
    cxStyle765: TcxStyle;
    cxStyle766: TcxStyle;
    cxStyle767: TcxStyle;
    cxStyle768: TcxStyle;
    cxStyle769: TcxStyle;
    cxStyle770: TcxStyle;
    cxStyle771: TcxStyle;
    cxStyle772: TcxStyle;
    cxStyle773: TcxStyle;
    cxStyle774: TcxStyle;
    cxStyle775: TcxStyle;
    cxStyle776: TcxStyle;
    cxStyle777: TcxStyle;
    cxStyle778: TcxStyle;
    cxStyle779: TcxStyle;
    cxStyle780: TcxStyle;
    cxStyle781: TcxStyle;
    cxStyle782: TcxStyle;
    cxStyle783: TcxStyle;
    cxStyle784: TcxStyle;
    cxStyle785: TcxStyle;
    cxStyle786: TcxStyle;
    cxStyle787: TcxStyle;
    cxStyle788: TcxStyle;
    cxStyle789: TcxStyle;
    cxStyle790: TcxStyle;
    cxStyle791: TcxStyle;
    cxStyle792: TcxStyle;
    cxStyle793: TcxStyle;
    cxStyle794: TcxStyle;
    cxStyle795: TcxStyle;
    cxStyle796: TcxStyle;
    cxStyle797: TcxStyle;
    cxStyle798: TcxStyle;
    cxStyle799: TcxStyle;
    cxStyle800: TcxStyle;
    cxStyle801: TcxStyle;
    cxStyle802: TcxStyle;
    cxStyle803: TcxStyle;
    cxStyle804: TcxStyle;
    cxStyle805: TcxStyle;
    cxStyle806: TcxStyle;
    cxStyle807: TcxStyle;
    cxStyle808: TcxStyle;
    cxStyle809: TcxStyle;
    cxStyle810: TcxStyle;
    cxStyle811: TcxStyle;
    cxStyle812: TcxStyle;
    cxStyle813: TcxStyle;
    cxStyle814: TcxStyle;
    cxStyle815: TcxStyle;
    cxStyle816: TcxStyle;
    cxStyle817: TcxStyle;
    cxStyle818: TcxStyle;
    cxStyle819: TcxStyle;
    cxStyle820: TcxStyle;
    cxStyle821: TcxStyle;
    cxStyle822: TcxStyle;
    cxStyle823: TcxStyle;
    cxStyle824: TcxStyle;
    cxStyle825: TcxStyle;
    cxStyle826: TcxStyle;
    cxStyle827: TcxStyle;
    cxStyle828: TcxStyle;
    cxStyle829: TcxStyle;
    cxStyle830: TcxStyle;
    cxStyle831: TcxStyle;
    cxStyle832: TcxStyle;
    cxStyle833: TcxStyle;
    cxStyle834: TcxStyle;
    cxStyle835: TcxStyle;
    cxStyle836: TcxStyle;
    cxStyle837: TcxStyle;
    cxStyle838: TcxStyle;
    cxStyle839: TcxStyle;
    cxStyle840: TcxStyle;
    cxStyle841: TcxStyle;
    cxStyle842: TcxStyle;
    cxStyle843: TcxStyle;
    cxStyle844: TcxStyle;
    cxStyle845: TcxStyle;
    cxStyle846: TcxStyle;
    cxStyle847: TcxStyle;
    cxStyle848: TcxStyle;
    cxStyle849: TcxStyle;
    cxStyle850: TcxStyle;
    cxStyle851: TcxStyle;
    cxStyle852: TcxStyle;
    cxStyle853: TcxStyle;
    cxStyle854: TcxStyle;
    cxStyle855: TcxStyle;
    cxStyle856: TcxStyle;
    cxStyle857: TcxStyle;
    cxStyle858: TcxStyle;
    cxStyle859: TcxStyle;
    cxStyle860: TcxStyle;
    cxStyle861: TcxStyle;
    cxStyle862: TcxStyle;
    cxStyle863: TcxStyle;
    cxStyle864: TcxStyle;
    cxStyle865: TcxStyle;
    cxStyle866: TcxStyle;
    cxStyle867: TcxStyle;
    cxStyle868: TcxStyle;
    cxStyle869: TcxStyle;
    cxStyle870: TcxStyle;
    cxStyle871: TcxStyle;
    cxStyle872: TcxStyle;
    cxStyle873: TcxStyle;
    cxStyle874: TcxStyle;
    cxStyle875: TcxStyle;
    cxStyle876: TcxStyle;
    cxStyle877: TcxStyle;
    cxStyle878: TcxStyle;
    cxStyle879: TcxStyle;
    cxStyle880: TcxStyle;
    cxStyle881: TcxStyle;
    cxStyle882: TcxStyle;
    cxStyle883: TcxStyle;
    cxStyle884: TcxStyle;
    cxStyle885: TcxStyle;
    cxStyle886: TcxStyle;
    cxStyle887: TcxStyle;
    cxStyle888: TcxStyle;
    cxStyle889: TcxStyle;
    cxStyle890: TcxStyle;
    cxStyle891: TcxStyle;
    cxStyle892: TcxStyle;
    cxStyle893: TcxStyle;
    cxStyle894: TcxStyle;
    cxStyle895: TcxStyle;
    cxStyle896: TcxStyle;
    cxStyle897: TcxStyle;
    cxStyle898: TcxStyle;
    cxStyle899: TcxStyle;
    cxStyle900: TcxStyle;
    cxStyle901: TcxStyle;
    cxStyle902: TcxStyle;
    cxStyle903: TcxStyle;
    cxStyle904: TcxStyle;
    cxStyle905: TcxStyle;
    cxStyle906: TcxStyle;
    cxStyle907: TcxStyle;
    cxStyle908: TcxStyle;
    cxStyle909: TcxStyle;
    cxStyle910: TcxStyle;
    cxStyle911: TcxStyle;
    cxStyle912: TcxStyle;
    cxStyle913: TcxStyle;
    cxStyle914: TcxStyle;
    cxStyle915: TcxStyle;
    cxStyle916: TcxStyle;
    cxStyle917: TcxStyle;
    cxStyle918: TcxStyle;
    cxStyle919: TcxStyle;
    cxStyle920: TcxStyle;
    cxStyle921: TcxStyle;
    cxStyle922: TcxStyle;
    cxStyle923: TcxStyle;
    cxStyle924: TcxStyle;
    cxStyle925: TcxStyle;
    cxStyle926: TcxStyle;
    cxStyle927: TcxStyle;
    cxStyle928: TcxStyle;
    cxStyle929: TcxStyle;
    cxStyle930: TcxStyle;
    cxStyle931: TcxStyle;
    cxStyle932: TcxStyle;
    cxStyle933: TcxStyle;
    cxStyle934: TcxStyle;
    cxStyle935: TcxStyle;
    cxStyle936: TcxStyle;
    cxStyle937: TcxStyle;
    cxStyle938: TcxStyle;
    cxStyle939: TcxStyle;
    cxStyle940: TcxStyle;
    cxStyle941: TcxStyle;
    cxStyle942: TcxStyle;
    cxStyle943: TcxStyle;
    cxStyle944: TcxStyle;
    cxStyle945: TcxStyle;
    cxStyle946: TcxStyle;
    cxStyle947: TcxStyle;
    cxStyle948: TcxStyle;
    cxStyle949: TcxStyle;
    cxStyle950: TcxStyle;
    cxStyle951: TcxStyle;
    cxStyle952: TcxStyle;
    cxStyle953: TcxStyle;
    cxStyle954: TcxStyle;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    TreeListStyleSheetUserFormat1: TcxTreeListStyleSheet;
    TreeListStyleSheetUserFormat2: TcxTreeListStyleSheet;
    TreeListStyleSheetUserFormat3: TcxTreeListStyleSheet;
    TreeListStyleSheetUserFormat4: TcxTreeListStyleSheet;
    TreeListStyleSheetBrick: TcxTreeListStyleSheet;
    TreeListStyleSheetDesert: TcxTreeListStyleSheet;
    TreeListStyleSheetEggplant: TcxTreeListStyleSheet;
    TreeListStyleSheetLilac: TcxTreeListStyleSheet;
    TreeListStyleSheetMaple: TcxTreeListStyleSheet;
    TreeListStyleSheetMarineHighColor: TcxTreeListStyleSheet;
    TreeListStyleSheetPlumHighColor: TcxTreeListStyleSheet;
    TreeListStyleSheetPumpkinLarge: TcxTreeListStyleSheet;
    TreeListStyleSheetRainyDay: TcxTreeListStyleSheet;
    TreeListStyleSheetRedWhiteBlueVGA: TcxTreeListStyleSheet;
    TreeListStyleSheetRose: TcxTreeListStyleSheet;
    TreeListStyleSheetRoseLarge: TcxTreeListStyleSheet;
    TreeListStyleSheetSlate: TcxTreeListStyleSheet;
    TreeListStyleSheetSpruce: TcxTreeListStyleSheet;
    TreeListStyleSheetStormVGA: TcxTreeListStyleSheet;
    TreeListStyleSheetTealVGA: TcxTreeListStyleSheet;
    TreeListStyleSheetWheat: TcxTreeListStyleSheet;
    TreeListStyleSheetWindowsClassic: TcxTreeListStyleSheet;
    TreeListStyleSheetWindowsClassicLarge: TcxTreeListStyleSheet;
    TreeListStyleSheetWindowsStandard: TcxTreeListStyleSheet;
    TreeListStyleSheetWindowsStandardLarge: TcxTreeListStyleSheet;
    TreeListStyleSheetHighContrast1: TcxTreeListStyleSheet;
    TreeListStyleSheetHighContrast1Large: TcxTreeListStyleSheet;
    TreeListStyleSheetHighContrast2: TcxTreeListStyleSheet;
    TreeListStyleSheetHighContrast2Large: TcxTreeListStyleSheet;
    TreeListStyleSheetHighContrastBlack: TcxTreeListStyleSheet;
    TreeListStyleSheetHighContrastBlackLarge: TcxTreeListStyleSheet;
    TreeListStyleSheetHighContrastWhite: TcxTreeListStyleSheet;
    TreeListStyleSheetHighContrastWhiteLarge: TcxTreeListStyleSheet;
    cxGroupBox1: TcxGroupBox;
    cxCheck1: TcxCheckBox;
    cxCheck2: TcxCheckBox;
    cxCheck3: TcxCheckBox;
    cxCheck4: TcxCheckBox;
    cxCheck5: TcxCheckBox;
    cxCheck6: TcxCheckBox;
    cxCheck7: TcxCheckBox;
    cxCheck8: TcxCheckBox;
    cxCheck9: TcxCheckBox;
    cxCheck10: TcxCheckBox;
    cxCheck11: TcxCheckBox;
    CEVersionInfo1: TCEVersionInfo;
    cxLabel3: TcxLabel;
    cxComboBox3: TcxComboBox;
    cxRadioGroup1: TcxRadioGroup;
    edtDataIni: TcxDateEdit;
    edtDataFim: TcxDateEdit;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    procedure cxCheckBox1Click(Sender: TObject);
    procedure cxButton13Click(Sender: TObject);
    procedure cxButton12Click(Sender: TObject);
    procedure cxButton11Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxButton10Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Personaliza;
    procedure CriaGrafico;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure CriaSerie(Indice: integer; Texto: string);
    procedure ComboBox2PropertiesChange(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure MontaScored;
    procedure VerificaPermissoes;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxComboBox2PropertiesChange(Sender: TObject);
    procedure InicializaScored;
    procedure cxButton5Click(Sender: TObject);
    procedure Impressao(Tipo: string);
    procedure cxGrid1DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure cxButton6Click(Sender: TObject);
    procedure cxButton7Click(Sender: TObject);
    procedure cxButton8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MontaColunas;
    procedure cxButton9Click(Sender: TObject);
    procedure MontaDash;
    procedure MontaGrafico;
    procedure MontaSerieChart;
    procedure cxButton14Click(Sender: TObject);
    procedure Renomeia(Tipo: Integer);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure HabilitarDashboard1Click(Sender: TObject);
    procedure cxButton16Click(Sender: TObject);
    procedure cxTreeList1FocusedNodeChanged(Sender: TcxCustomTreeList;
      APrevFocusedNode, AFocusedNode: TcxTreeListNode);
    procedure ValorPropertiesEditValueChanged(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cScored : string;
    iIndex  : integer;
    sUsuario : string;
    sSGBD    : string;
    sTempDirUsuario : string;
  end;

var
  frmMostraScored: TfrmMostraScored;
  lGrafico  : boolean;
  SQL       : string;
  FROM      : string;
  vTipo     : array of string;

implementation

uses uFuncoes,
  uAguarde, uSelecaoGraficoScored,
  uAnotacoes, uCriaAnalise, uPainel, uPersonalizarScored,
  uDescricao, uScoredAcumulado, uRenomearScored, uCopiarPadroesScored;

{$R *.dfm}

procedure TfrmMostraScored.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    GeraLog(frmMostraScored.bdDados,frmMostraScored.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    FreeAndNil(frmScoredAcumulado);

    tblScoredCard.Close;

    bdDados.Close;
    bdArmazena.Close;

    try
      DeleteFile(ParamStr(1));
    except
    end;

    try
      DeleteFile(sTempDirUsuario + cScored + '.tee');
    except
    end;

    Action := caFree;
end;

procedure TfrmMostraScored.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmMostraScored.MontaColunas;
begin
    frmScoredAcumulado.cxTreeList1.CreateColumn(frmScoredAcumulado.cxTreeList1.Bands.Items[0]);
    frmScoredAcumulado.cxTreeList1.Columns[1].Caption.Text      := HCLResourceStrings.FindID('sString_176');
    frmScoredAcumulado.cxTreeList1.Columns[1].Caption.AlignHorz := taCenter;
    frmScoredAcumulado.cxTreeList1.Columns[1].RepositoryItem    := cxEditRepository1CurrencyItem1;

    frmScoredAcumulado.cxTreeList1.CreateColumn(frmScoredAcumulado.cxTreeList1.Bands.Items[0]);
    frmScoredAcumulado.cxTreeList1.Columns[2].Caption.Text      := HCLResourceStrings.FindID('sString_292');
    frmScoredAcumulado.cxTreeList1.Columns[2].Caption.AlignHorz := taCenter;
    frmScoredAcumulado.cxTreeList1.Columns[2].RepositoryItem    := cxEditRepository1ImageComboBoxItem1;

    frmScoredAcumulado.cxTreeList1.CreateColumn(frmScoredAcumulado.cxTreeList1.Bands.Items[0]);
    frmScoredAcumulado.cxTreeList1.Columns[3].Caption.Text      := HCLResourceStrings.FindID('sString_295');
    frmScoredAcumulado.cxTreeList1.Columns[3].Caption.AlignHorz := taCenter;
    frmScoredAcumulado.cxTreeList1.Columns[3].RepositoryItem    := cxEditRepository1CurrencyItem1;

    frmScoredAcumulado.cxTreeList1.CreateColumn(frmScoredAcumulado.cxTreeList1.Bands.Items[0]);
    frmScoredAcumulado.cxTreeList1.Columns[4].Caption.Text      := HCLResourceStrings.FindID('sString_296');
    frmScoredAcumulado.cxTreeList1.Columns[4].Caption.AlignHorz := taCenter;
    frmScoredAcumulado.cxTreeList1.Columns[4].RepositoryItem    := cxEditRepository1CurrencyItem1;

    frmScoredAcumulado.cxTreeList1.CreateColumn(frmScoredAcumulado.cxTreeList1.Bands.Items[0]);
    frmScoredAcumulado.cxTreeList1.Columns[5].Caption.Text      := HCLResourceStrings.FindID('sString_297');
    frmScoredAcumulado.cxTreeList1.Columns[5].Caption.AlignHorz := taCenter;
    frmScoredAcumulado.cxTreeList1.Columns[5].RepositoryItem    := cxEditRepository1CurrencyItem2;

    frmScoredAcumulado.cxTreeList1.CreateColumn(frmScoredAcumulado.cxTreeList1.Bands.Items[0]);
    frmScoredAcumulado.cxTreeList1.Columns[6].Caption.Text      := HCLResourceStrings.FindID('sString_298');
    frmScoredAcumulado.cxTreeList1.Columns[6].Caption.AlignHorz := taCenter;
    frmScoredAcumulado.cxTreeList1.Columns[6].RepositoryItem    := cxEditRepository1CurrencyItem2;

    frmScoredAcumulado.cxTreeList1.CreateColumn(frmScoredAcumulado.cxTreeList1.Bands.Items[0]);
    frmScoredAcumulado.cxTreeList1.Columns[7].Caption.Text      := HCLResourceStrings.FindID('sString_299');
    frmScoredAcumulado.cxTreeList1.Columns[7].Caption.AlignHorz := taCenter;
    frmScoredAcumulado.cxTreeList1.Columns[7].RepositoryItem    := cxEditRepository1CurrencyItem1;

    frmScoredAcumulado.cxTreeList1.CreateColumn(frmScoredAcumulado.cxTreeList1.Bands.Items[0]);
    frmScoredAcumulado.cxTreeList1.Columns[8].Caption.Text      := HCLResourceStrings.FindID('sString_300');
    frmScoredAcumulado.cxTreeList1.Columns[8].Caption.AlignHorz := taCenter;
    frmScoredAcumulado.cxTreeList1.Columns[8].RepositoryItem    := cxEditRepository1CurrencyItem1;

    frmScoredAcumulado.cxTreeList1.CreateColumn(frmScoredAcumulado.cxTreeList1.Bands.Items[0]);
    frmScoredAcumulado.cxTreeList1.Columns[9].Caption.Text      := HCLResourceStrings.FindID('sString_301');
    frmScoredAcumulado.cxTreeList1.Columns[9].Caption.AlignHorz := taCenter;
    frmScoredAcumulado.cxTreeList1.Columns[9].RepositoryItem    := cxEditRepository1CurrencyItem2;

    frmScoredAcumulado.cxTreeList1.CreateColumn(frmScoredAcumulado.cxTreeList1.Bands.Items[0]);
    frmScoredAcumulado.cxTreeList1.Columns[10].Caption.Text      := HCLResourceStrings.FindID('sString_302');
    frmScoredAcumulado.cxTreeList1.Columns[10].Caption.AlignHorz := taCenter;
    frmScoredAcumulado.cxTreeList1.Columns[10].RepositoryItem    := cxEditRepository1CurrencyItem2;

    frmScoredAcumulado.cxTreeList1.CreateColumn(frmScoredAcumulado.cxTreeList1.Bands.Items[0]);
    frmScoredAcumulado.cxTreeList1.Columns[11].Caption.Text      := HCLResourceStrings.FindID('sString_72');
    frmScoredAcumulado.cxTreeList1.Columns[11].Caption.AlignHorz := taCenter;
    frmScoredAcumulado.cxTreeList1.Columns[11].RepositoryItem    := cxEditRepository1TextItem1;

    frmScoredAcumulado.cxTreeList1.CreateColumn(frmScoredAcumulado.cxTreeList1.Bands.Items[0]);
    frmScoredAcumulado.cxTreeList1.Columns[12].Caption.Text      := HCLResourceStrings.FindID('sString_292');
    frmScoredAcumulado.cxTreeList1.Columns[12].Caption.AlignHorz := taCenter;
    frmScoredAcumulado.cxTreeList1.Columns[12].Visible           := False;

    cxTreeList1.CreateColumn(cxTreeList1.Bands.Items[0]);
    cxTreeList1.Columns[1].Caption.Text      := HCLResourceStrings.FindID('sString_176');
    cxTreeList1.Columns[1].Caption.AlignHorz := taCenter;
    cxTreeList1.Columns[1].RepositoryItem    := cxEditRepository1CurrencyItem1;

    cxTreeList1.CreateColumn(cxTreeList1.Bands.Items[0]);
    cxTreeList1.Columns[2].Caption.Text      := HCLResourceStrings.FindID('sString_292');
    cxTreeList1.Columns[2].Caption.AlignHorz := taCenter;
    cxTreeList1.Columns[2].RepositoryItem    := cxEditRepository1ImageComboBoxItem1;

    cxTreeList1.CreateColumn(cxTreeList1.Bands.Items[0]);
    cxTreeList1.Columns[3].Caption.Text      := HCLResourceStrings.FindID('sString_293');
    cxTreeList1.Columns[3].Caption.AlignHorz := taCenter;
    cxTreeList1.Columns[3].RepositoryItem    := cxEditRepository1ImageComboBoxItem2;

    cxTreeList1.CreateColumn(cxTreeList1.Bands.Items[0]);
    cxTreeList1.Columns[4].Caption.Text      := HCLResourceStrings.FindID('sString_294');
    cxTreeList1.Columns[4].Caption.AlignHorz := taCenter;
    cxTreeList1.Columns[4].RepositoryItem    := cxEditRepository1ImageComboBoxItem2;

    cxTreeList1.CreateColumn(cxTreeList1.Bands.Items[0]);
    cxTreeList1.Columns[5].Caption.Text      := HCLResourceStrings.FindID('sString_295');
    cxTreeList1.Columns[5].Caption.AlignHorz := taCenter;
    cxTreeList1.Columns[5].RepositoryItem    := cxEditRepository1CurrencyItem1;

    cxTreeList1.CreateColumn(cxTreeList1.Bands.Items[0]);
    cxTreeList1.Columns[6].Caption.Text      := HCLResourceStrings.FindID('sString_296');
    cxTreeList1.Columns[6].Caption.AlignHorz := taCenter;
    cxTreeList1.Columns[6].RepositoryItem    := cxEditRepository1CurrencyItem1;

    cxTreeList1.CreateColumn(cxTreeList1.Bands.Items[0]);
    cxTreeList1.Columns[7].Caption.Text      := HCLResourceStrings.FindID('sString_297');
    cxTreeList1.Columns[7].Caption.AlignHorz := taCenter;
    cxTreeList1.Columns[7].RepositoryItem    := cxEditRepository1CurrencyItem2;

    cxTreeList1.CreateColumn(cxTreeList1.Bands.Items[0]);
    cxTreeList1.Columns[8].Caption.Text      := HCLResourceStrings.FindID('sString_298');
    cxTreeList1.Columns[8].Caption.AlignHorz := taCenter;
    cxTreeList1.Columns[8].RepositoryItem    := cxEditRepository1CurrencyItem2;

    cxTreeList1.CreateColumn(cxTreeList1.Bands.Items[0]);
    cxTreeList1.Columns[9].Caption.Text      := HCLResourceStrings.FindID('sString_299');
    cxTreeList1.Columns[9].Caption.AlignHorz := taCenter;
    cxTreeList1.Columns[9].RepositoryItem    := cxEditRepository1CurrencyItem1;

    cxTreeList1.CreateColumn(cxTreeList1.Bands.Items[0]);
    cxTreeList1.Columns[10].Caption.Text      := HCLResourceStrings.FindID('sString_300');
    cxTreeList1.Columns[10].Caption.AlignHorz := taCenter;
    cxTreeList1.Columns[10].RepositoryItem    := cxEditRepository1CurrencyItem1;

    cxTreeList1.CreateColumn(cxTreeList1.Bands.Items[0]);
    cxTreeList1.Columns[11].Caption.Text      := HCLResourceStrings.FindID('sString_301');
    cxTreeList1.Columns[11].Caption.AlignHorz := taCenter;
    cxTreeList1.Columns[11].RepositoryItem    := cxEditRepository1CurrencyItem2;

    cxTreeList1.CreateColumn(cxTreeList1.Bands.Items[0]);
    cxTreeList1.Columns[12].Caption.Text      := HCLResourceStrings.FindID('sString_302');
    cxTreeList1.Columns[12].Caption.AlignHorz := taCenter;
    cxTreeList1.Columns[12].RepositoryItem    := cxEditRepository1CurrencyItem2;

    cxTreeList1.CreateColumn(cxTreeList1.Bands.Items[0]);
    cxTreeList1.Columns[13].Caption.Text      := HCLResourceStrings.FindID('sString_73');
    cxTreeList1.Columns[13].Caption.AlignHorz := taCenter;
    cxTreeList1.Columns[13].RepositoryItem    := cxEditRepository1BlobItem1;

    // Campos para Impressao

    cxTreeList1.CreateColumn(cxTreeList1.Bands.Items[0]);
    cxTreeList1.Columns[14].Caption.Text      := HCLResourceStrings.FindID('sString_292');
    cxTreeList1.Columns[14].Caption.AlignHorz := taCenter;
    cxTreeList1.Columns[14].Visible           := False;

    cxTreeList1.CreateColumn(cxTreeList1.Bands.Items[0]);
    cxTreeList1.Columns[15].Caption.Text      := HCLResourceStrings.FindID('sString_293');
    cxTreeList1.Columns[15].Caption.AlignHorz := taCenter;
    cxTreeList1.Columns[15].Visible           := False;

    cxTreeList1.CreateColumn(cxTreeList1.Bands.Items[0]);
    cxTreeList1.Columns[16].Caption.Text      := HCLResourceStrings.FindID('sString_294');
    cxTreeList1.Columns[16].Caption.AlignHorz := taCenter;
    cxTreeList1.Columns[16].Visible           := False;

    cxTreeList1.CreateColumn(cxTreeList1.Bands.Items[0]);
    cxTreeList1.Columns[17].Caption.Text      := HCLResourceStrings.FindID('sString_73');
    cxTreeList1.Columns[17].Caption.AlignHorz := taCenter;
    cxTreeList1.Columns[17].RepositoryItem    := cxEditRepository1MemoItem1;
    cxTreeList1.Columns[17].Visible           := False;

    cxTreeList1.CreateColumn(cxTreeList1.Bands.Items[0]);
    cxTreeList1.Columns[18].Caption.Text      := HCLResourceStrings.FindID('sString_72');
    cxTreeList1.Columns[18].Caption.AlignHorz := taCenter;
    cxTreeList1.Columns[18].RepositoryItem    := cxEditRepository1TextItem1;
end;

procedure TfrmMostraScored.InicializaScored;
var
    i   : integer;
    S   : TMemoryStream;
    aux : string;
begin
    Self.Caption := Self.Caption + ' - ' + cScored;

    frmScoredAcumulado := TfrmScoredAcumulado.Create(Self);

    for i := 0 to frmMostraScored.cxStyleRepository3.StyleSheetCount - 1 do
        ComboBox2.Properties.Items.Add(frmMostraScored.cxStyleRepository3.StyleSheets[i].Caption);

    aux := LePadraoString(frmMostraScored.bdDados,
                     'ID_SCORED = ' + #39 + frmMostraScored.tblScoredCardID_SCORED.Value + #39,
                     frmMostraScored.sUsuario,
                     'frmMostraScored',
                     'ComboBox2');
    if aux <> '' then
       ComboBox2.Text := aux;

    S := TMemoryStream.Create;
    frmMostraScored.tblScoredCardVALOR.SaveToStream(S);
    S.Position := 0;
    cxTreeList1.LoadFromStream(S);
    S.Position := 0;
    frmScoredAcumulado.cxTreeList1.LoadFromStream(S);
    S.Free;

    // Guarda Informação de Débito/Crédito
    SetLength(vTipo, cxTreeList1.AbsoluteCount);
    for i := 0 to cxTreeList1.AbsoluteCount - 1 do
    begin
        if cxTreeList1.AbsoluteItems[i].Values[5] = 'True' then
           vTipo[i] := 'D'
        else
           vTipo[i] := 'C';
    end;

    for i := 1 to 5 do
    begin
        cxTreeList1.Columns[1].Free;
        frmScoredAcumulado.cxTreeList1.Columns[1].Free;
    end;

    MontaColunas;

    cxTreeList1.OptionsView.ColumnAutoWidth := True;
    frmScoredAcumulado.cxTreeList1.OptionsView.ColumnAutoWidth := True;

    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;

    if (frmMostraScored.sSGBD = 'Microsoft Access 2007')        or
       (frmMostraScored.sSGBD = 'Microsoft Access 2010')        or
       (frmMostraScored.sSGBD = 'Microsoft SQL Server 2000')    or
       (frmMostraScored.sSGBD = 'Microsoft SQL Server 2005')    or
       (frmMostraScored.sSGBD = 'Microsoft SQL Server 2008')    or
       (frmMostraScored.sSGBD = 'Microsoft SQL Server 2008 R2') or
       (frmMostraScored.sSGBD = 'Microsoft SQL Server 2012')    then
    begin
        ADOQuery1.SQL.Add('SELECT ');
        ADOQuery1.SQL.Add('[_Atualizacao_],');
        ADOQuery1.SQL.Add('[_Data_]');
        ADOQuery1.SQL.Add('FROM [_ScoredCard_' + uppercase(frmMostraScored.tblScoredCardID_SCORED.Value) + ']');
        ADOQuery1.SQL.Add('GROUP BY [_Atualizacao_], [_Data_]');
        ADOQuery1.SQL.Add('ORDER BY [_Data_]');
    end;

    if frmMostraScored.sSGBD = 'Sun MySQL 5.x' then
    begin
        ADOQuery1.SQL.Add('SELECT ');
        ADOQuery1.SQL.Add('_Atualizacao_,');
        ADOQuery1.SQL.Add('_Data_');
        ADOQuery1.SQL.Add('FROM `_ScoredCard_' + uppercase(frmMostraScored.tblScoredCardID_SCORED.Value) + '`');
        ADOQuery1.SQL.Add('GROUP BY _Atualizacao_, _Data_');
        ADOQuery1.SQL.Add('ORDER BY _Data_');
    end;

    ADOQuery1.Open;

    ADOQuery1.First;
    cxComboBox2.Clear;
    while not ADOQuery1.Eof do
    begin
        cxComboBox2.Properties.Items.Add(ADOQuery1.Fields[0].AsString + '-' + ADOQuery1.Fields[1].AsString);
        aux := ADOQuery1.Fields[0].AsString + '-' + ADOQuery1.Fields[1].AsString;
        ADOQuery1.Next;
    end;
    ADOQuery1.Close;
    cxComboBox2.Text := aux;


    Renomeia(0);
    Personaliza;

    if LePadraoString(frmMostraScored.bdDados,
                 'ID_SCORED = ' + #39 + frmMostraScored.tblScoredCardID_SCORED.Value + #39,
                 frmMostraScored.sUsuario,
                 'frmMostraScored',
                 'cxCheckBox1') = 'S' then
       cxCheckBox1.Checked := True
    else
       cxCheckBox1.Checked := False;


    LePadraoArquivo(frmMostraScored.bdDados,
                 'ID_SCORED = ' + #39 + frmMostraScored.tblScoredCardID_SCORED.Value + #39,
                    frmMostraScored.sUsuario,
                    'frmMostraScored',
                    'Chart1',
                    sTempDirUsuario + cScored + '.tee');
end;

procedure TfrmMostraScored.MontaScored;
var
    a : integer;
begin
    frmAguarde           := TfrmAguarde.Create(Self);
    frmAguarde.cMensagem := HCLResourceStrings.FindID('sString_18');
    frmAguarde.Show;
    frmAguarde.Update;

    if not lGrafico then
    begin
        cxComboBox1.Properties.Items.Clear;
        Chart1.SeriesList.Clear;
    end;

    for a := 0 to cxTreeList1.AbsoluteCount - 1 do
    begin
        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;

        if (frmMostraScored.sSGBD = 'Microsoft Access 2007')        or
           (frmMostraScored.sSGBD = 'Microsoft Access 2010')        or
           (frmMostraScored.sSGBD = 'Microsoft SQL Server 2000')    or
           (frmMostraScored.sSGBD = 'Microsoft SQL Server 2005')    or
           (frmMostraScored.sSGBD = 'Microsoft SQL Server 2008')    or
           (frmMostraScored.sSGBD = 'Microsoft SQL Server 2008 R2') or
           (frmMostraScored.sSGBD = 'Microsoft SQL Server 2012')    then
        begin
            ADOQuery1.SQL.Add('SELECT TOP 1');
            ADOQuery1.SQL.Add('[_Indice_]');
            ADOQuery1.SQL.Add('FROM [_ScoredCard_' + uppercase(frmMostraScored.tblScoredCardID_SCORED.Value) + ']');
            ADOQuery1.SQL.Add('WHERE [_Titulo_] = ' + #39 + cxTreeList1.AbsoluteItems[a].Values[0] + #39);
        end;

        if frmMostraScored.sSGBD = 'Sun MySQL 5.x' then
        begin
            ADOQuery1.SQL.Add('SELECT ');
            ADOQuery1.SQL.Add('_Indice_');
            ADOQuery1.SQL.Add('FROM `_ScoredCard_' + uppercase(frmMostraScored.tblScoredCardID_SCORED.Value) + '`');
            ADOQuery1.SQL.Add('WHERE _Titulo_ = ' + #39 + cxTreeList1.AbsoluteItems[a].Values[0] + #39);
            ADOQuery1.SQL.Add('LIMIT 0,1');
        end;

        ADOQuery1.Open;
        ADOQuery1.First;
        cxTreeList1.AbsoluteItems[a].Values[18] := vTipo[ADOQuery1.Fields[0].AsInteger];
        frmScoredAcumulado.cxTreeList1.AbsoluteItems[a].Values[11] := vTipo[ADOQuery1.Fields[0].AsInteger];
        ADOQuery1.Close;

        cxTreeList1.AbsoluteItems[a].Values[1]  := 0;
        cxTreeList1.AbsoluteItems[a].Values[3]  := 0;
        cxTreeList1.AbsoluteItems[a].Values[5]  := 0;
        cxTreeList1.AbsoluteItems[a].Values[6]  := 0;
        cxTreeList1.AbsoluteItems[a].Values[7]  := 0;
        cxTreeList1.AbsoluteItems[a].Values[8]  := 0;
        cxTreeList1.AbsoluteItems[a].Values[9]  := 0;
        cxTreeList1.AbsoluteItems[a].Values[10] := 0;
    end;

    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;

    if (frmMostraScored.sSGBD = 'Microsoft Access 2007')        or
       (frmMostraScored.sSGBD = 'Microsoft Access 2010')        or
       (frmMostraScored.sSGBD = 'Microsoft SQL Server 2000')    or
       (frmMostraScored.sSGBD = 'Microsoft SQL Server 2005')    or
       (frmMostraScored.sSGBD = 'Microsoft SQL Server 2008')    or
       (frmMostraScored.sSGBD = 'Microsoft SQL Server 2008 R2') or
       (frmMostraScored.sSGBD = 'Microsoft SQL Server 2012')    then
    begin
        ADOQuery1.SQL.Add('SELECT ');
        ADOQuery1.SQL.Add('[_Atualizacao_],');
        ADOQuery1.SQL.Add('[_Data_],');
        ADOQuery1.SQL.Add('[_Indice_],');
        ADOQuery1.SQL.Add('[_Titulo_],');
        ADOQuery1.SQL.Add('[_Valor_],');
        ADOQuery1.SQL.Add('[_Situacao_],');
        ADOQuery1.SQL.Add('[_EvolucaoAnterior_],');
        ADOQuery1.SQL.Add('[_EvolucaoOriginal_],');
        ADOQuery1.SQL.Add('[_SituacaoAnterior_],');
        ADOQuery1.SQL.Add('[_SituacaoOriginal_],');
        ADOQuery1.SQL.Add('[_ValorMinimo_],');
        ADOQuery1.SQL.Add('[_ValorMaximo_],');
        ADOQuery1.SQL.Add('[_Anotacao_],');
        ADOQuery1.SQL.Add('[_PercMinimo_],');
        ADOQuery1.SQL.Add('[_PercMaximo_],');
        ADOQuery1.SQL.Add('[_ValorFaltaMinimo_],');
        ADOQuery1.SQL.Add('[_ValorFaltaMaximo_],');
        ADOQuery1.SQL.Add('[_PercFaltaMinimo_],');
        ADOQuery1.SQL.Add('[_PercFaltaMaximo_]');

        SQL := ADOQuery1.SQL.Text;
        FROM := 'FROM [_ScoredCard_' + uppercase(frmMostraScored.tblScoredCardID_SCORED.Value) + ']';

        ADOQuery1.SQL.Add('FROM [_ScoredCard_' + uppercase(frmMostraScored.tblScoredCardID_SCORED.Value) + ']');
        ADOQuery1.SQL.Add('WHERE [_Atualizacao_] = ' + tbGetShortStr(cxComboBox2.Text,'-'));
        ADOQuery1.SQL.Add('ORDER BY [_Titulo_]');
    end;

    if frmMostraScored.sSGBD = 'Sun MySQL 5.x' then
    begin
        ADOQuery1.SQL.Add('SELECT ');
        ADOQuery1.SQL.Add('_Atualizacao_,');
        ADOQuery1.SQL.Add('_Data_,');
        ADOQuery1.SQL.Add('_Indice_,');
        ADOQuery1.SQL.Add('_Titulo_,');
        ADOQuery1.SQL.Add('_Valor_,');
        ADOQuery1.SQL.Add('_Situacao_,');
        ADOQuery1.SQL.Add('_EvolucaoAnterior_,');
        ADOQuery1.SQL.Add('_EvolucaoOriginal_,');
        ADOQuery1.SQL.Add('_SituacaoAnterior_,');
        ADOQuery1.SQL.Add('_SituacaoOriginal_,');
        ADOQuery1.SQL.Add('_ValorMinimo_,');
        ADOQuery1.SQL.Add('_ValorMaximo_,');
        ADOQuery1.SQL.Add('_Anotacao_,');
        ADOQuery1.SQL.Add('_PercMinimo_,');
        ADOQuery1.SQL.Add('_PercMaximo_,');
        ADOQuery1.SQL.Add('_ValorFaltaMinimo_,');
        ADOQuery1.SQL.Add('_ValorFaltaMaximo_,');
        ADOQuery1.SQL.Add('_PercFaltaMinimo_,');
        ADOQuery1.SQL.Add('_PercFaltaMaximo_');

        SQL := ADOQuery1.SQL.Text;
        FROM := 'FROM `_ScoredCard_' + uppercase(frmMostraScored.tblScoredCardID_SCORED.Value + '`');

        ADOQuery1.SQL.Add('FROM `_ScoredCard_' + uppercase(frmMostraScored.tblScoredCardID_SCORED.Value) + '`');
        ADOQuery1.SQL.Add('WHERE _Atualizacao_ = ' + tbGetShortStr(cxComboBox2.Text,'-'));
        ADOQuery1.SQL.Add('ORDER BY _Titulo_');
    end;

    ADOQuery1.Open;

    ADOQuery1.First;

    while not ADOQuery1.Eof do
    begin
        a := 0;
        while a <= cxTreeList1.AbsoluteCount - 1 do
        begin
            if ADOQuery1.Fields[3].Value = cxTreeList1.AbsoluteItems[a].Values[0] then
            begin
                try
                    cxTreeList1.AbsoluteItems[a].Values[1]  := ADOQuery1.Fields[4].Value;
                    cxTreeList1.AbsoluteItems[a].Values[5]  := ADOQuery1.Fields[10].Value;
                    cxTreeList1.AbsoluteItems[a].Values[6]  := ADOQuery1.Fields[11].Value;
                    cxTreeList1.AbsoluteItems[a].Values[13] := ADOQuery1.Fields[12].AsString;
                    cxTreeList1.AbsoluteItems[a].Values[17] := ADOQuery1.Fields[12].AsString;
                    cxTreeList1.AbsoluteItems[a].Values[7]  := ADOQuery1.Fields[13].Value;
                    cxTreeList1.AbsoluteItems[a].Values[8]  := ADOQuery1.Fields[14].Value;

                    cxTreeList1.AbsoluteItems[a].Values[9]  := ADOQuery1.Fields[15].Value;
                    cxTreeList1.AbsoluteItems[a].Values[10] := ADOQuery1.Fields[16].Value;
                    cxTreeList1.AbsoluteItems[a].Values[11] := ADOQuery1.Fields[17].Value;
                    cxTreeList1.AbsoluteItems[a].Values[12] := ADOQuery1.Fields[18].Value;

                    cxTreeList1.AbsoluteItems[a].Values[18] := vTipo[ADOQuery1.Fields[2].AsInteger];
                    frmScoredAcumulado.cxTreeList1.AbsoluteItems[a].Values[11] := vTipo[ADOQuery1.Fields[2].AsInteger];

                    if ADOQuery1.Fields[5].Value = 'G' then
                    begin
                        cxTreeList1.AbsoluteItems[a].Values[2]  := 0;
                        cxTreeList1.AbsoluteItems[a].Values[14] := HCLResourceStrings.FindID('sString_307');
                    end;
                    if ADOQuery1.Fields[5].Value = 'W' then
                    begin
                        cxTreeList1.AbsoluteItems[a].Values[2]  := 1;
                        cxTreeList1.AbsoluteItems[a].Values[14] := HCLResourceStrings.FindID('sString_308');
                    end;
                    if ADOQuery1.Fields[5].Value = 'R' then
                    begin
                        cxTreeList1.AbsoluteItems[a].Values[2]  := 2;
                        cxTreeList1.AbsoluteItems[a].Values[14] := HCLResourceStrings.FindID('sString_309');
                    end;

                    if ADOQuery1.Fields[6].Value > 0 then
                    begin
                        cxTreeList1.AbsoluteItems[a].Values[3]  := 6;
                        cxTreeList1.AbsoluteItems[a].Values[15] := HCLResourceStrings.FindID('sString_310');
                    end;
                    if ADOQuery1.Fields[6].Value < 0 then
                    begin
                        cxTreeList1.AbsoluteItems[a].Values[3]  := 7;
                        cxTreeList1.AbsoluteItems[a].Values[15] := HCLResourceStrings.FindID('sString_311');
                    end;

                    if ADOQuery1.Fields[7].Value > 0 then
                    begin
                        cxTreeList1.AbsoluteItems[a].Values[4]  := 6;
                        cxTreeList1.AbsoluteItems[a].Values[16] := HCLResourceStrings.FindID('sString_310');
                    end;
                    if ADOQuery1.Fields[7].Value < 0 then
                    begin
                        cxTreeList1.AbsoluteItems[a].Values[4]  := 7;
                        cxTreeList1.AbsoluteItems[a].Values[16] := HCLResourceStrings.FindID('sString_311');
                    end;

                    if ADOQuery1.Fields[8].Value = 'CR' then
                    begin
                        cxTreeList1.AbsoluteItems[a].Values[3]  := 6;
                        cxTreeList1.AbsoluteItems[a].Values[15] := HCLResourceStrings.FindID('sString_310');
                    end;
                    if ADOQuery1.Fields[8].Value = 'CG' then
                    begin
                        cxTreeList1.AbsoluteItems[a].Values[3]  := 5;
                        cxTreeList1.AbsoluteItems[a].Values[15] := HCLResourceStrings.FindID('sString_311');
                    end;
                    if ADOQuery1.Fields[8].Value = 'RR' then
                    begin
                        cxTreeList1.AbsoluteItems[a].Values[3]  := 4;
                        cxTreeList1.AbsoluteItems[a].Values[15] := HCLResourceStrings.FindID('sString_311');
                    end;
                    if ADOQuery1.Fields[8].Value = 'RG' then
                    begin
                        cxTreeList1.AbsoluteItems[a].Values[3]  := 3;
                        cxTreeList1.AbsoluteItems[a].Values[15] := HCLResourceStrings.FindID('sString_310');
                    end;

                    if ADOQuery1.Fields[9].Value = 'CR' then
                    begin
                        cxTreeList1.AbsoluteItems[a].Values[4]  := 6;
                        cxTreeList1.AbsoluteItems[a].Values[16] := HCLResourceStrings.FindID('sString_310');
                    end;
                    if ADOQuery1.Fields[9].Value = 'CG' then
                    begin
                        cxTreeList1.AbsoluteItems[a].Values[4]  := 5;
                        cxTreeList1.AbsoluteItems[a].Values[16] := HCLResourceStrings.FindID('sString_311');
                    end;
                    if ADOQuery1.Fields[9].Value = 'RR' then
                    begin
                        cxTreeList1.AbsoluteItems[a].Values[4]  := 4;
                        cxTreeList1.AbsoluteItems[a].Values[16] := HCLResourceStrings.FindID('sString_311');
                    end;
                    if ADOQuery1.Fields[9].Value = 'RG' then
                    begin
                        cxTreeList1.AbsoluteItems[a].Values[4]  := 3;
                        cxTreeList1.AbsoluteItems[a].Values[16] := HCLResourceStrings.FindID('sString_310');
                    end;
                except
                end;
                a := cxTreeList1.AbsoluteCount - 1;
            end;

            a := a + 1;
        end;

        ADOQuery1.Next;
    end;
    ADOQuery1.Close;

    CriaGrafico;

    lGrafico := True;

    FreeAndNil(frmAguarde);
end;

procedure TfrmMostraScored.MontaSerieChart;
var
    i,a : integer;
begin
    i := Chart1.SeriesCount;

    if i <> 0 then
       for a := 1 to i do
           Chart1.Series[0].Free;

    CriaSerie(0,  cxTreeList1.AbsoluteItems[iIndex].Values[0] + ' - ' + cxTreeList1.Columns[1].Caption.Text);
    CriaSerie(1,  cxTreeList1.AbsoluteItems[iIndex].Values[0] + ' - ' + cxTreeList1.Columns[3].Caption.Text);
    CriaSerie(2,  cxTreeList1.AbsoluteItems[iIndex].Values[0] + ' - ' + cxTreeList1.Columns[4].Caption.Text);
    CriaSerie(3,  cxTreeList1.AbsoluteItems[iIndex].Values[0] + ' - ' + cxTreeList1.Columns[5].Caption.Text);
    CriaSerie(4,  cxTreeList1.AbsoluteItems[iIndex].Values[0] + ' - ' + cxTreeList1.Columns[6].Caption.Text);
    CriaSerie(5,  cxTreeList1.AbsoluteItems[iIndex].Values[0] + ' - ' + cxTreeList1.Columns[7].Caption.Text);
    CriaSerie(6,  cxTreeList1.AbsoluteItems[iIndex].Values[0] + ' - ' + cxTreeList1.Columns[8].Caption.Text);
    CriaSerie(7,  cxTreeList1.AbsoluteItems[iIndex].Values[0] + ' - ' + cxTreeList1.Columns[9].Caption.Text);
    CriaSerie(8,  cxTreeList1.AbsoluteItems[iIndex].Values[0] + ' - ' + cxTreeList1.Columns[10].Caption.Text);
    CriaSerie(9,  cxTreeList1.AbsoluteItems[iIndex].Values[0] + ' - ' + cxTreeList1.Columns[11].Caption.Text);
    CriaSerie(10, cxTreeList1.AbsoluteItems[iIndex].Values[0] + ' - ' + cxTreeList1.Columns[11].Caption.Text);

end;

procedure TfrmMostraScored.MontaGrafico;
var
    i : integer;
    tmpChart : TCustomChart;
begin
    if cxComboBox1.Text = '' then
       Exit;

    edtDataIni.Enabled := False;
    edtDataFim.Enabled := False;

    if cxComboBox3.Text = 'Personalizado' then
    begin
        edtDataIni.Enabled := True;
        edtDataFim.Enabled := True;
    end;

    if FileExists(sTempDirUsuario + cScored + '.tee') then
    begin
        Chart1.Free;
        tmpChart := TChart.Create(Self);
        LoadChartFromFile(tmpChart,sTempDirUsuario + cScored + '.tee');
        Chart1 := tmpChart as TChart;
        Chart1.Parent := cxTabSheet2;
    end
    else
    begin
        MontaSerieChart;
    end;

    if frmSelecaoGraficoScored = nil then
    begin
        frmSelecaoGraficoScored := TfrmSelecaoGraficoScored.Create(Self);

        try
            frmSelecaoGraficoScored.cScoredCard := cxComboBox1.Text;
            frmSelecaoGraficoScored.MontaTela;
            frmSelecaoGraficoScored.MontaGrafico(cxComboBox3.Text);
        except
            MontaSerieChart;

            frmSelecaoGraficoScored.cScoredCard := cxComboBox1.Text;
            frmSelecaoGraficoScored.MontaTela;
            frmSelecaoGraficoScored.MontaGrafico(cxComboBox3.Text);
        end;

        FreeAndNil(frmSelecaoGraficoScored);
    end;

    for i := 0 to Chart1.SeriesCount - 1 do
        Chart1.Series[i].Visible := False;

    if cxCheck1.Checked  then Chart1.Series[0].Visible  := True;
    if cxCheck2.Checked  then Chart1.Series[1].Visible  := True;
    if cxCheck3.Checked  then Chart1.Series[2].Visible  := True;
    if cxCheck4.Checked  then Chart1.Series[3].Visible  := True;
    if cxCheck5.Checked  then Chart1.Series[4].Visible  := True;
    if cxCheck6.Checked  then Chart1.Series[5].Visible  := True;
    if cxCheck7.Checked  then Chart1.Series[6].Visible  := True;
    if cxCheck8.Checked  then Chart1.Series[7].Visible  := True;
    if cxCheck9.Checked  then Chart1.Series[8].Visible  := True;
    if cxCheck10.Checked then Chart1.Series[9].Visible  := True;
    if cxCheck11.Checked then Chart1.Series[10].Visible := True;
end;

procedure TfrmMostraScored.ValorPropertiesEditValueChanged(Sender: TObject);
begin
    MontaGrafico;
end;

procedure TfrmMostraScored.VerificaPermissoes;
var
    i,a   : integer;
    lPode : boolean;
    lJaFoi : boolean;
    sTitulos : array of string;
    Query : TADOQuery;
    sAux : string;
begin
    frmAguarde           := TfrmAguarde.Create(Self);
    frmAguarde.cMensagem := HCLResourceStrings.FindID('sString_312');
    frmAguarde.Show;
    frmAguarde.Update;

    Query                := TADOQuery.Create(Application);
    Query.Connection     := frmMostraScored.bdDados;
    Query.CursorLocation := clUseServer;

    SetLength(sTitulos, 1);

    i := 0;
    while i <= cxTreeList1.AbsoluteCount - 1 do
    begin
        lJaFoi := False;
        for a := 0 to Length(sTitulos) - 1 do
            if sTitulos[a] = cxTreeList1.AbsoluteItems[i].Values[0] then
               lJaFoi := True;

        if not lJaFoi then
        begin
            lPode := False;

            Query.Close;
            Query.SQL.Clear;
            Query.SQL.Add('SELECT PODE_VISUALIZAR FROM SCORED_CARD_FILTRO');
            Query.SQL.Add('WHERE  ID_SCORED = ' + #39 + frmMostraScored.tblScoredCardID_SCORED.Value + #39);
            Query.SQL.Add('  AND     TITULO = ' + #39 + cxTreeList1.AbsoluteItems[i].Values[0] + #39);
            Query.Open;
            Query.First;
            sAux := Query.Fields[0].AsString;
            Query.Close;

            if sAux <> '' then
            begin
                if EncontraLista(sAux,'#*'                          ,',') then lPode := False else
                if EncontraLista(sAux,'#' + frmMostraScored.sUsuario,',') then lPode := False else
                if EncontraLista(sAux,'*'                           ,',') then lPode := True  else
                if EncontraLista(sAux,frmMostraScored.sUsuario      ,',') then lPode := True;
            end
            else
               lPode := True;
        end
        else
           lPode := True;

        if not lPode then
        begin
            cxTreeList1.AbsoluteItems[i].Delete;
            frmScoredAcumulado.cxTreeList1.AbsoluteItems[i].Delete;
            i := 0;
        end
        else
        begin
            sTitulos[length(sTitulos) - 1] := cxTreeList1.AbsoluteItems[i].Values[0];
            SetLength(sTitulos, length(sTitulos) + 1);
            i := i + 1;
        end;
    end;

    cxComboBox1.Properties.Items.Clear;
    for i := 0 to cxTreeList1.AbsoluteCount - 1 do
        cxComboBox1.Properties.Items.Add(cxTreeList1.AbsoluteItems[i].Values[0]);

    Query.Close;
    Query.Free;

    FreeAndNil(frmAguarde);
end;

procedure TfrmMostraScored.CriaGrafico;
var
    i,a : integer;
begin
    i := Chart1.SeriesCount;

    for a := 1 to i do
        Chart1.Series[0].Free;
end;

procedure TfrmMostraScored.CriaSerie(Indice: integer; Texto: string);
var
    aSerie : TChartSeries;
begin
    aSerie := TLineSeries.Create(nil);

    aSerie.Title             := Texto;
    aSerie.Visible           := False;
    aSerie.ValueFormat       := '#,##0.00';
    aSerie.Color             := clRed;

    Chart1.AddSeries(aSerie);

    TLineSeries(Chart1.Series[Indice]).ColorEachLine     := False;
    TLineSeries(Chart1.Series[Indice]).ColorEachPoint    := True;
    TLineSeries(Chart1.Series[Indice]).Pointer.Visible   := True;
    TLineSeries(Chart1.Series[Indice]).Pointer.Style     := psCircle;
    TLineSeries(Chart1.Series[Indice]).Pointer.HorizSize := 7;
    TLineSeries(Chart1.Series[Indice]).Pointer.VertSize  := 7;


    {Chart1.AddSeries(TeeSeriesTypes.Items[0].SeriesClass);
    Chart1.Series[Indice].Title                          := Texto;
    Chart1.Series[Indice].Visible                        := False;
    Chart1.Series[Indice].ValueFormat                    := '#,##0.00';
    Chart1.Series[Indice].Color                          := clRed;
    TLineSeries(Chart1.Series[Indice]).ColorEachLine     := False;
    TLineSeries(Chart1.Series[Indice]).ColorEachPoint    := True;
    TLineSeries(Chart1.Series[Indice]).Pointer.Visible   := True;
    TLineSeries(Chart1.Series[Indice]).Pointer.Style     := psCircle;
    TLineSeries(Chart1.Series[Indice]).Pointer.HorizSize := 7;
    TLineSeries(Chart1.Series[Indice]).Pointer.VertSize  := 7;    }

end;

procedure TfrmMostraScored.SpeedButton3Click(Sender: TObject);
begin
    if PageControl1.ActivePageIndex = 0 then
    begin
       Impressao('Antes1');
       dxComponentPrinter.CurrentLinkIndex := 0;
       dxComponentPrinter.PrintTitle := HCLResourceStrings.FindID('sString_314') + frmMostraScored.Caption;
       dxComponentPrinter.Preview(True,nil);
       Impressao('Depois1');
    end;

    if PageControl1.ActivePageIndex = 1 then
       ChartPreview(Self,Chart1);
end;

procedure TfrmMostraScored.SpeedButton2Click(Sender: TObject);
begin
    if PageControl1.ActivePageIndex = 1 then
       EditChart(Self,Chart1);
end;

procedure TfrmMostraScored.SpeedButton4Click(Sender: TObject);
begin
    if PageControl1.ActivePageIndex = 1 then
       ChangeAllSeriesGallery(Self, TCustomChart(Chart1));
end;

procedure TfrmMostraScored.SpeedButton5Click(Sender: TObject);
begin
    if PageControl1.ActivePageIndex = 0 then
    begin
        Impressao('Antes');
        cxExportTLToHTML(sTempDirUsuario + 'analyzer.html',cxTreeList1);
        EnviaMail(sTempDirUsuario + 'analyzer.html',HCLResourceStrings.FindID('sString_315') + frmMostraScored.Caption);
        Impressao('Depois');
    end;

    if PageControl1.ActivePageIndex = 1 then
    begin
        Chart1.SaveToMetafile(sTempDirUsuario + 'analyzer.wmf');
        EnviaMail(sTempDirUsuario + 'analyzer.wmf',frmMostraScored.Caption);
    end;
end;

procedure TfrmMostraScored.SpeedButton9Click(Sender: TObject);
begin
    SalvaPadraoString(frmMostraScored.bdDados,
                 'ID_SCORED = ' + #39 + frmMostraScored.tblScoredCardID_SCORED.Value + #39,
                 'ID_SCORED',
                 frmMostraScored.tblScoredCardID_SCORED.Value,
                 frmMostraScored.sUsuario,
                 'frmMostraScored',
                 'ComboBox2',
                 ComboBox2.Text);

    if cxCheckBox1.Checked then
       SalvaPadraoString(frmMostraScored.bdDados,
                 'ID_SCORED = ' + #39 + frmMostraScored.tblScoredCardID_SCORED.Value + #39,
                 'ID_SCORED',
                 frmMostraScored.tblScoredCardID_SCORED.Value,
                    frmMostraScored.sUsuario,
                    'frmMostraScored',
                    'cxCheckBox1',
                    'S')
    else
       SalvaPadraoString(frmMostraScored.bdDados,
                 'ID_SCORED = ' + #39 + frmMostraScored.tblScoredCardID_SCORED.Value + #39,
                 'ID_SCORED',
                 frmMostraScored.tblScoredCardID_SCORED.Value,
                    frmMostraScored.sUsuario,
                    'frmMostraScored',
                    'cxCheckBox1',
                    'N');

    try
       SaveChartToFile(Chart1,sTempDirUsuario + cScored + '.tee',False,True);

       SalvaPadraoArquivo(frmMostraScored.bdDados,
                 'ID_SCORED = ' + #39 + frmMostraScored.tblScoredCardID_SCORED.Value + #39,
                 'ID_SCORED',
                 frmMostraScored.tblScoredCardID_SCORED.Value,
                          frmMostraScored.sUsuario,
                          'frmMostraScored',
                          'Chart1',
                          sTempDirUsuario + cScored + '.tee');
    except
    end;

    MessageDlg(HCLResourceStrings.FindID('sString_335'), mtInformation, [mbOK], 0);
end;

procedure TfrmMostraScored.ComboBox2PropertiesChange(Sender: TObject);
begin
   try
      cxTreeList1.Styles.StyleSheet := frmMostraScored.cxStyleRepository3.StyleSheets[ComboBox2.ItemIndex];
   except
      cxTreeList1.Styles.StyleSheet := nil;
   end;
end;

procedure TfrmMostraScored.Impressao(Tipo: string);
begin
    if Tipo = 'Antes1' then
    begin
        if cxTreeList1.Columns[13].Tag = 0 then
        begin
            cxTreeList1.Columns[13].Visible := False;
            cxTreeList1.Columns[17].Visible := True;

            cxTreeList1.Columns[13].Position.ColIndex := 17;
            cxTreeList1.Columns[17].Position.ColIndex := 13;
        end;
    end;

    if Tipo = 'Antes' then
    begin
        if cxTreeList1.Columns[02].Tag = 0 then cxTreeList1.Columns[2].Visible  := False;
        if cxTreeList1.Columns[03].Tag = 0 then cxTreeList1.Columns[3].Visible  := False;
        if cxTreeList1.Columns[04].Tag = 0 then cxTreeList1.Columns[4].Visible  := False;
        if cxTreeList1.Columns[13].Tag = 0 then cxTreeList1.Columns[13].Visible := False;

        if cxTreeList1.Columns[02].Tag = 0 then cxTreeList1.Columns[14].Visible := True;
        if cxTreeList1.Columns[03].Tag = 0 then cxTreeList1.Columns[15].Visible := True;
        if cxTreeList1.Columns[04].Tag = 0 then cxTreeList1.Columns[16].Visible := True;
        if cxTreeList1.Columns[13].Tag = 0 then cxTreeList1.Columns[17].Visible := True;

        cxTreeList1.Columns[00].Position.ColIndex := 0;
        cxTreeList1.Columns[01].Position.ColIndex := 1;

        if cxTreeList1.Columns[02].Tag = 0 then cxTreeList1.Columns[02].Position.ColIndex := 14;
        if cxTreeList1.Columns[03].Tag = 0 then cxTreeList1.Columns[03].Position.ColIndex := 15;
        if cxTreeList1.Columns[04].Tag = 0 then cxTreeList1.Columns[04].Position.ColIndex := 16;
        cxTreeList1.Columns[05].Position.ColIndex := 5;
        cxTreeList1.Columns[06].Position.ColIndex := 6;
        cxTreeList1.Columns[07].Position.ColIndex := 7;
        cxTreeList1.Columns[08].Position.ColIndex := 8;
        cxTreeList1.Columns[09].Position.ColIndex := 9;
        cxTreeList1.Columns[10].Position.ColIndex := 10;
        cxTreeList1.Columns[11].Position.ColIndex := 11;
        cxTreeList1.Columns[12].Position.ColIndex := 12;
        if cxTreeList1.Columns[13].Tag = 0 then cxTreeList1.Columns[13].Position.ColIndex := 17;

        if cxTreeList1.Columns[02].Tag = 0 then cxTreeList1.Columns[14].Position.ColIndex := 2;
        if cxTreeList1.Columns[03].Tag = 0 then cxTreeList1.Columns[15].Position.ColIndex := 3;
        if cxTreeList1.Columns[04].Tag = 0 then cxTreeList1.Columns[16].Position.ColIndex := 4;
        if cxTreeList1.Columns[13].Tag = 0 then cxTreeList1.Columns[17].Position.ColIndex := 13;
    end;

    if Tipo = 'Depois1' then
    begin
        if cxTreeList1.Columns[13].Tag = 0 then
        begin
            cxTreeList1.Columns[13].Visible := True;
            cxTreeList1.Columns[17].Visible := False;

            cxTreeList1.Columns[13].Position.ColIndex := 13;
            cxTreeList1.Columns[17].Position.ColIndex := 17;
        end;
    end;

    if Tipo = 'Depois' then
    begin
        if cxTreeList1.Columns[02].Tag = 0 then cxTreeList1.Columns[2].Visible  := True;
        if cxTreeList1.Columns[03].Tag = 0 then cxTreeList1.Columns[3].Visible  := True;
        if cxTreeList1.Columns[04].Tag = 0 then cxTreeList1.Columns[4].Visible  := True;
        if cxTreeList1.Columns[13].Tag = 0 then cxTreeList1.Columns[13].Visible := True;

        if cxTreeList1.Columns[02].Tag = 0 then cxTreeList1.Columns[14].Visible := False;
        if cxTreeList1.Columns[03].Tag = 0 then cxTreeList1.Columns[15].Visible := False;
        if cxTreeList1.Columns[04].Tag = 0 then cxTreeList1.Columns[16].Visible := False;
        if cxTreeList1.Columns[13].Tag = 0 then cxTreeList1.Columns[17].Visible := False;

        cxTreeList1.Columns[00].Position.ColIndex := 0;
        cxTreeList1.Columns[01].Position.ColIndex := 1;
        cxTreeList1.Columns[02].Position.ColIndex := 2;
        cxTreeList1.Columns[03].Position.ColIndex := 3;
        cxTreeList1.Columns[04].Position.ColIndex := 4;
        cxTreeList1.Columns[05].Position.ColIndex := 5;
        cxTreeList1.Columns[06].Position.ColIndex := 6;
        cxTreeList1.Columns[07].Position.ColIndex := 7;
        cxTreeList1.Columns[08].Position.ColIndex := 8;
        cxTreeList1.Columns[09].Position.ColIndex := 9;
        cxTreeList1.Columns[10].Position.ColIndex := 10;
        cxTreeList1.Columns[11].Position.ColIndex := 11;
        cxTreeList1.Columns[12].Position.ColIndex := 12;
        cxTreeList1.Columns[13].Position.ColIndex := 13;
        cxTreeList1.Columns[14].Position.ColIndex := 14;
        cxTreeList1.Columns[15].Position.ColIndex := 15;
        cxTreeList1.Columns[16].Position.ColIndex := 16;
        cxTreeList1.Columns[17].Position.ColIndex := 17;
        cxTreeList1.Columns[18].Position.ColIndex := 18;
    end;
end;

procedure TfrmMostraScored.cxButton10Click(Sender: TObject);
begin
    if frmDescricao = nil then
    begin
        frmDescricao := TfrmDescricao.Create(Self);

        frmDescricao.cxMemo1.Clear;
        frmDescricao.cxMemo1.Lines.Text := frmMostraScored.tblScoredCardDESCRICAO.Value;

        frmDescricao.ShowModal;
        FreeAndNil(frmDescricao);
    end
    else
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
        FreeAndNil(frmDescricao);
    end;
end;

procedure TfrmMostraScored.cxButton11Click(Sender: TObject);
begin
    frmScoredAcumulado.Tipo := 0;
    frmScoredAcumulado.ShowModal;
end;

procedure TfrmMostraScored.cxButton12Click(Sender: TObject);
begin
    frmScoredAcumulado.Tipo := 1;
    frmScoredAcumulado.ShowModal;
end;

procedure TfrmMostraScored.cxButton13Click(Sender: TObject);
begin
    frmScoredAcumulado.Tipo := 2;
    frmScoredAcumulado.ShowModal;
end;

procedure TfrmMostraScored.cxButton14Click(Sender: TObject);
begin
    if frmRenomearScored <> Nil then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
        Exit;
    end;

    Renomeia(1);

    frmRenomearScored := TfrmRenomearScored.Create(Self);
    frmRenomearScored.ShowModal;
    FreeAndNil(frmRenomearScored);

    Renomeia(0);
    Personaliza;
end;

procedure TfrmMostraScored.cxButton16Click(Sender: TObject);
begin
    if frmCopiarPadroesScored = nil then
    begin
        frmCopiarPadroesScored := TfrmCopiarPadroesScored.Create(Self);

        frmCopiarPadroesScored.edtUsuario.Text := frmMostraScored.sUsuario;

        frmCopiarPadroesScored.ShowModal;
        FreeAndNil(frmCopiarPadroesScored);
    end
    else
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
        FreeAndNil(frmCopiarPadroesScored);
    end;
end;

procedure TfrmMostraScored.cxButton1Click(Sender: TObject);
begin
    if PageControl1.ActivePageIndex = 0 then
    begin
        if SaveDialog1.Execute then
        begin
            Impressao('Antes');
            cxExportTLToExcel(SaveDialog1.FileName,cxTreeList1);
            Impressao('Depois');
        end;
    end;
end;

procedure TfrmMostraScored.PageControl1Change(Sender: TObject);
begin
    cxButton1.Enabled     := False;
    cxButton4.Enabled     := False;
    SpeedButton2.Enabled  := False;
    SpeedButton3.Enabled  := False;
    SpeedButton4.Enabled  := False;
    SpeedButton5.Enabled  := False;

    if PageControl1.ActivePageIndex = 0 then
    begin
        SpeedButton3.Enabled := True;
        SpeedButton5.Enabled := True;
        cxButton1.Enabled    := True;

        if cxCheckBox1.Checked then
        begin
            Panel6.Visible := True;
            MontaDash;
        end;
    end;

    if PageControl1.ActivePageIndex = 1 then
    begin
        SpeedButton2.Enabled  := True;
        SpeedButton3.Enabled  := True;
        SpeedButton4.Enabled  := True;
        SpeedButton5.Enabled  := True;
        cxButton4.Enabled     := True;

        try
           cxComboBox1.Text := cxTreeList1.AbsoluteItems[iIndex].Values[0];
           MontaGrafico;
        except
        end;
    end;
end;

procedure TfrmMostraScored.cxButton4Click(Sender: TObject);
begin
    if cxComboBox1.Text = '' then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_128'), mtInformation, [mbOK], 0);
        Exit;
    end;

    if frmSelecaoGraficoScored = nil then
    begin
        frmSelecaoGraficoScored := TfrmSelecaoGraficoScored.Create(Self);
        frmSelecaoGraficoScored.cScoredCard := cxComboBox1.Text;
        frmSelecaoGraficoScored.ShowModal;
        FreeAndNil(frmSelecaoGraficoScored);
    end
    else
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
        FreeAndNil(frmSelecaoGraficoScored);
    end;
end;

procedure TfrmMostraScored.cxButton2Click(Sender: TObject);
begin
    cxTreeList1.FullExpand;
end;

procedure TfrmMostraScored.cxButton3Click(Sender: TObject);
begin
    cxTreeList1.FullCollapse;
end;

procedure TfrmMostraScored.cxTreeList1FocusedNodeChanged(
  Sender: TcxCustomTreeList; APrevFocusedNode, AFocusedNode: TcxTreeListNode);
begin
    try
       iIndex := AFocusedNode.AbsoluteIndex;

       if cxCheckBox1.Checked then
          MontaDash;
    except
    end;
end;

procedure TfrmMostraScored.cxCheckBox1Click(Sender: TObject);
begin
    if cxCheckBox1.Checked then
    begin
        Panel6.Visible := True;
        MontaDash;
    end
    else
       Panel6.Visible := False;
end;

procedure TfrmMostraScored.cxComboBox2PropertiesChange(Sender: TObject);
begin
    MontaScored;

   if cxCheckBox1.Checked then
      MontaDash;
end;

procedure TfrmMostraScored.cxButton5Click(Sender: TObject);
var
    aux  : string;
    aux1 : string;
  auxIni: string;
  auxFim: string;
begin
    if frmAnotacoes = Nil then
    begin
        frmAnotacoes := TfrmAnotacoes.Create(Self);

        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;

        if (frmMostraScored.sSGBD = 'Microsoft Access 2007')        or
           (frmMostraScored.sSGBD = 'Microsoft Access 2010')        or
           (frmMostraScored.sSGBD = 'Microsoft SQL Server 2000')    or
           (frmMostraScored.sSGBD = 'Microsoft SQL Server 2005')    or
           (frmMostraScored.sSGBD = 'Microsoft SQL Server 2008')    or
           (frmMostraScored.sSGBD = 'Microsoft SQL Server 2008 R2') or
           (frmMostraScored.sSGBD = 'Microsoft SQL Server 2012')    then
        begin
            ADOQuery1.SQL.Add('SELECT [_Data_] FROM [_ScoredCard_' + uppercase(frmMostraScored.tblScoredCardID_SCORED.Value) + ']');
            ADOQuery1.SQL.Add('ORDER BY [_Data_]');
        end;

        if frmMostraScored.sSGBD = 'Sun MySQL 5.x' then
        begin
            ADOQuery1.SQL.Add('SELECT _Data_ FROM `_ScoredCard_' + uppercase(frmMostraScored.tblScoredCardID_SCORED.Value) + '`');
            ADOQuery1.SQL.Add('ORDER BY _Data_');
        end;

        ADOQuery1.Open;
        ADOQuery1.First;
        while not ADOQuery1.Eof do
        begin
            aux := ADOQuery1.Fields[0].AsString;
            aux := Copy(aux,4,7);

            if frmAnotacoes.cxComboBox2.Properties.Items.IndexOf(aux) < 0 then
               frmAnotacoes.cxComboBox2.Properties.Items.Add(Aux);

            ADOQuery1.Next;
        end;
        ADOQuery1.Close;

        aux := tbGetLongStr(cxComboBox2.Text,'-');
        aux := Copy(aux,4,7);
        frmAnotacoes.cxComboBox2.Text := aux;

        frmAnotacoes.ShowModal;

        if PageControl1.ActivePageIndex = 0 then
        begin
            if frmAnotacoes.lConf then
            begin
                try
                    ADOQuery1.Close;
                    ADOQuery1.SQL.Clear;

                    if (frmMostraScored.sSGBD = 'Microsoft Access 2007')        or
                       (frmMostraScored.sSGBD = 'Microsoft Access 2010')        or
                       (frmMostraScored.sSGBD = 'Microsoft SQL Server 2000')    or
                       (frmMostraScored.sSGBD = 'Microsoft SQL Server 2005')    or
                       (frmMostraScored.sSGBD = 'Microsoft SQL Server 2008')    or
                       (frmMostraScored.sSGBD = 'Microsoft SQL Server 2008 R2') or
                       (frmMostraScored.sSGBD = 'Microsoft SQL Server 2012')    then
                    begin
                        ADOQuery1.SQL.Add('UPDATE [_ScoredCard_' + uppercase(frmMostraScored.tblScoredCardID_SCORED.Value) + ']');
                        ADOQuery1.SQL.Add('SET [_Anotacao_] = ' + #39 + frmAnotacoes.cxMemo1.Lines.Text + #39);
                        ADOQuery1.SQL.Add('WHERE [_Titulo_] = ' + #39 + cxTreeList1.AbsoluteItems[iIndex].Values[0] + #39);

                        aux := '01/' + frmAnotacoes.cxComboBox2.Text;
                        if (Copy(aux,4,2) = '01') or
                           (Copy(aux,4,2) = '03') or
                           (Copy(aux,4,2) = '05') or
                           (Copy(aux,4,2) = '07') or
                           (Copy(aux,4,2) = '08') or
                           (Copy(aux,4,2) = '10') or
                           (Copy(aux,4,2) = '12') then
                            aux1 := '31/' + Copy(aux,4,7);

                        if (Copy(aux,4,2) = '02') then
                            aux1 := '28/' + Copy(aux,4,7);

                        if (Copy(aux,4,2) = '04') or
                           (Copy(aux,4,2) = '06') or
                           (Copy(aux,4,2) = '09') or
                           (Copy(aux,4,2) = '11') then
                            aux1 := '30/' + Copy(aux,4,7);

                      if (frmMostraScored.sSGBD = 'Microsoft Access 2007') or
                         (frmMostraScored.sSGBD = 'Microsoft Access 2010') then
                      begin
                          ADOQuery1.SQL.Add('AND [_Data_] >= CVDATE(' + #39 + aux  + #39 + ')');
                          ADOQuery1.SQL.Add('AND [_Data_] <= CVDATE(' + #39 + aux1 + #39 + ')');
                      end;

                      if (frmMostraScored.sSGBD = 'Microsoft SQL Server 2000')    or
                         (frmMostraScored.sSGBD = 'Microsoft SQL Server 2005')    or
                         (frmMostraScored.sSGBD = 'Microsoft SQL Server 2008')    or
                         (frmMostraScored.sSGBD = 'Microsoft SQL Server 2008 R2') or
                         (frmMostraScored.sSGBD = 'Microsoft SQL Server 2012')    then
                      begin
                          ADOQuery1.SQL.Add('AND [_Data_] >= CONVERT(DATETIME,' + #39 + aux  + #39 + ',103)');
                          ADOQuery1.SQL.Add('AND [_Data_] <= CONVERT(DATETIME,' + #39 + aux1 + #39 + ',103)');
                      end;
                    end;

                    if frmMostraScored.sSGBD = 'Sun MySQL 5.x' then
                    begin
                        ADOQuery1.SQL.Add('UPDATE `_ScoredCard_' + uppercase(frmMostraScored.tblScoredCardID_SCORED.Value) + '`');
                        ADOQuery1.SQL.Add('SET _Anotacao_ = ' + #39 + frmAnotacoes.cxMemo1.Lines.Text + #39);
                        ADOQuery1.SQL.Add('WHERE _Titulo_ = ' + #39 + cxTreeList1.AbsoluteItems[iIndex].Values[0] + #39);

                        aux := '01/' + frmAnotacoes.cxComboBox2.Text;
                        if (Copy(aux,4,2) = '01') or
                           (Copy(aux,4,2) = '03') or
                           (Copy(aux,4,2) = '05') or
                           (Copy(aux,4,2) = '07') or
                           (Copy(aux,4,2) = '08') or
                           (Copy(aux,4,2) = '10') or
                           (Copy(aux,4,2) = '12') then
                            aux1 := '31/' + Copy(aux,4,7);

                        if (Copy(aux,4,2) = '02') then
                            aux1 := '28/' + Copy(aux,4,7);

                        if (Copy(aux,4,2) = '04') or
                           (Copy(aux,4,2) = '06') or
                           (Copy(aux,4,2) = '09') or
                           (Copy(aux,4,2) = '11') then
                            aux1 := '30/' + Copy(aux,4,7);

                        auxIni := #39 + NumEntry(3, aux, '/')  + '-' + NumEntry(2, aux, '/')  + '-' + NumEntry(1, aux, '/')  + #39;
                        auxFim := #39 + NumEntry(3, aux1, '/') + '-' + NumEntry(2, aux1, '/') + '-' + NumEntry(1, aux1, '/') + #39;

                        ADOQuery1.SQL.Add('AND _Data_ >= CAST(' + auxIni + ' AS DATE)');
                        ADOQuery1.SQL.Add('AND _Data_ <= CAST(' + auxFim + ' AS DATE)');
                    end;

                    ADOQuery1.ExecSQL;
                    ADOQuery1.Close;

                    cxTreeList1.AbsoluteItems[iIndex].Values[13] := frmAnotacoes.cxMemo1.Lines.Text;
                    cxTreeList1.AbsoluteItems[iIndex].Values[17] := frmAnotacoes.cxMemo1.Lines.Text;
                except
                end;
            end;
        end;

        FreeAndNil(frmAnotacoes);
    end
    else
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
    end;
end;

procedure TfrmMostraScored.cxGrid1DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
    try
       iIndex := AFocusedRecord.Index;
    except
    end;
end;

procedure TfrmMostraScored.MontaDash;
var
    max : double;
    min : double;
    minimo : double;
    maximo : double;
    valor  : double;
    PercMinimo : double;
    PercMaximo : double;
begin
    imgVerde.Visible    := False;
    imgAmarela.Visible  := False;
    imgVermelha.Visible := False;

    if cxTreeList1.AbsoluteItems[iIndex].Values[2] = 0 then
       imgVerde.Visible := True;

    if cxTreeList1.AbsoluteItems[iIndex].Values[2] = 1 then
       imgAmarela.Visible := True;

    if cxTreeList1.AbsoluteItems[iIndex].Values[2] = 2 then
       imgVermelha.Visible := True;

 // Valor

    valor    := cxTreeList1.AbsoluteItems[iIndex].Values[1];
    minimo   := cxTreeList1.AbsoluteItems[iIndex].Values[5];
    maximo   := cxTreeList1.AbsoluteItems[iIndex].Values[6];

    min := 0;
    max := maximo + (maximo - minimo);

    if valor > max then
       max := valor;

    if valor < min then
       min := valor;

    mValor.LimitLower                 := min - 1;
    mValor.LimitUpper                 := max + 1;
    mValor.SignalSettings.ValueFrom   := min;
    mValor.SignalSettings.ValueTo     := max;
    mValor.SectorSettings.Sector1From := 0;

    if max <> 0 then
       mValor.SectorSettings.Sector1To := Round((minimo * 100 / max) * 10)
    else
       mValor.SectorSettings.Sector1To := 0;

    mValor.SectorSettings.Sector2From := mValor.SectorSettings.Sector1To + 1;

    if max <> 0 then
       mValor.SectorSettings.Sector2To := Round((maximo * 100 / max) * 10)
    else
       mValor.SectorSettings.Sector2To := 0;

    mValor.SectorSettings.Sector3From := mValor.SectorSettings.Sector2To + 1;
    mValor.SectorSettings.Sector3To   := 1000;
    mValor.Value                      := valor;

    if cxTreeList1.AbsoluteItems[iIndex].Values[18] = HCLResourceStrings.FindID('sString_305') then
    begin
        mValor.SectorSettings.Sector1Color := clGreen;
        mValor.SectorSettings.Sector3Color := clRed;
    end
    else
    begin
        mValor.SectorSettings.Sector1Color := clRed;
        mValor.SectorSettings.Sector3Color := clGreen;
    end;

// Percentual Minimo

    if minimo <> 0 then
       PercMinimo := valor * 100 / minimo
    else
       PercMinimo := 0;

    mPercMinimo.SignalSettings.ValueFrom    := 0;
    mPercMinimo.SignalSettings.ValueTo      := 100;

    if PercMinimo < 0 then
       mPercMinimo.SignalSettings.ValueFrom := PercMinimo;

    if PercMinimo > 100 then
       mPercMinimo.SignalSettings.ValueTo   := PercMinimo;

    mPercMinimo.LimitUpper                  := PercMinimo + 1;
    mPercMinimo.Value                       := PercMinimo;

    if cxTreeList1.AbsoluteItems[iIndex].Values[18] = HCLResourceStrings.FindID('sString_305') then
    begin
        mPercMinimo.SectorSettings.Sector1Color := clGreen;
        mPercMinimo.SectorSettings.Sector3Color := clRed;
    end
    else
    begin
        mPercMinimo.SectorSettings.Sector1Color := clRed;
        mPercMinimo.SectorSettings.Sector3Color := clGreen;
    end;

// Perc. Máximo

    if maximo <> 0 then
       PercMaximo := valor * 100 / maximo
    else
       PercMaximo := 0;

    mPercMaximo.SignalSettings.ValueFrom    := 0;
    mPercMaximo.SignalSettings.ValueTo      := 100;

    if PercMaximo < 0 then
       mPercMaximo.SignalSettings.ValueFrom := PercMaximo;
    if PercMaximo > 100 then
       mPercMaximo.SignalSettings.ValueTo   := PercMaximo;

    mPercMaximo.LimitUpper                  := PercMaximo + 1;
    mPercMaximo.Value                       := PercMaximo;

    if cxTreeList1.AbsoluteItems[iIndex].Values[18] = HCLResourceStrings.FindID('sString_305') then
    begin
        mPercMaximo.SectorSettings.Sector1Color := clGreen;
        mPercMaximo.SectorSettings.Sector3Color := clRed;
    end
    else
    begin
        mPercMaximo.SectorSettings.Sector1Color := clRed;
        mPercMaximo.SectorSettings.Sector3Color := clGreen;
    end;

    // Gráfico

    try
       Chart2.SeriesList.Clear;
       cxComboBox1.Text := cxTreeList1.AbsoluteItems[iIndex].Values[0];
       Chart2.AddSeries(Chart1.Series[0]);
       Chart2.View3D := False;
       Chart2.Series[0].Visible := True;
    except
    end;

    mValor.SignalSettings.Name1      := cxTreeList1.Columns[1].Caption.Text;
    mPercMinimo.SignalSettings.Name1 := cxTreeList1.Columns[7].Caption.Text;
    mPercMaximo.SignalSettings.Name1 := cxTreeList1.Columns[8].Caption.Text;
end;

procedure TfrmMostraScored.cxButton6Click(Sender: TObject);
begin
    if frmCriaAnalise = nil then
    begin
        frmCriaAnalise := TfrmCriaAnalise.Create(Self);
        frmCriaAnalise.Tipo := 0;
        frmCriaAnalise.SQL  := SQL;
        frmCriaAnalise.FROM := FROM;
        frmCriaAnalise.ShowModal;
        FreeAndNil(frmCriaAnalise);
    end
    else
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
        FreeAndNil(frmCriaAnalise);
    end;
end;

procedure TfrmMostraScored.cxButton7Click(Sender: TObject);
begin
    if frmPainel <> Nil then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
        Exit;
    end;

    frmPainel := TfrmPainel.Create(Self);

    try
        frmPainel.iTipo    := 0;
        frmPainel.iIndex   := iIndex;
        frmPainel.Caption  := cxTreeList1.AbsoluteItems[iIndex].Values[0];
        frmPainel.valor    := cxTreeList1.AbsoluteItems[iIndex].Values[1];
        frmPainel.minimo   := cxTreeList1.AbsoluteItems[iIndex].Values[5];
        frmPainel.maximo   := cxTreeList1.AbsoluteItems[iIndex].Values[6];
        frmPainel.sScored  := frmMostraScored.tblScoredCardID_SCORED.Value;
    except
    end;

    frmPainel.ShowModal;
    FreeAndNil(frmPainel);
end;

procedure TfrmMostraScored.cxButton8Click(Sender: TObject);
begin
    if cxTreeList1.OptionsView.ColumnAutoWidth then
       cxTreeList1.OptionsView.ColumnAutoWidth := False
    else
       cxTreeList1.OptionsView.ColumnAutoWidth := True;
end;

procedure TfrmMostraScored.FormCreate(Sender: TObject);
var
    sSkin : string;
begin
    TeeSetBrazil;

    Self.Caption := CEVersionInfo1.ProductName + ' - ' + CEVersionInfo1.FileVersion;

    SetLanguage(2, cxLocalizer1);

    Memo1.Lines.Clear;
    sUsuario := ParamStr(2);
    sTempDirUsuario := 'C:\Analyzer\Temp\' + sUsuario + '\';

    if FileExists(ParamStr(1)) then
       Memo1.Lines.LoadFromFile(ParamStr(1))
    else
       Application.Terminate;

    sSkin := Memo1.Lines.Strings[0];

    dxSkinController1.SkinName := sSkin;
    if sSkin <> 'Nenhum' then
       dxSkinController1.UseSkins := True
    else
       dxSkinController1.UseSkins := False;

    try
      bdDados.Close;
      bdDados.ConnectionString := Memo1.Lines.Strings[1];
      bdDados.Open;

      bdArmazena.Close;
      bdArmazena.ConnectionString := Memo1.Lines.Strings[2];
      bdArmazena.Open;

      tblScoredCard.Open;
    except
      on E: Exception do
      begin
          MessageDlg(HCLResourceStrings.FindID('sString_40') + E.Message, mtInformation, [mbOK], 0);
          Application.Terminate;
      end;
    end;

    PageControl1.ActivePageIndex := 0;
    lGrafico                     := False;
    iIndex                       := 0;
    cScored                      := Memo1.Lines.Strings[3];
    sSGBD                        := Memo1.Lines.Strings[4];

    tblScoredCard.Locate('ID_SCORED',cScored,[]);

    InicializaScored;
    VerificaPermissoes;
end;

procedure TfrmMostraScored.FormShow(Sender: TObject);
begin
    cxTreeList1.FullCollapse;
    cxTreeList1.SetFocus;
    cxTreeList1.FullCollapse;

    GeraLog(frmMostraScored.bdDados,frmMostraScored.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);

    edtDataIni.Enabled := False;
    edtDataFim.Enabled := False;

    edtDataIni.Date := Now;
    edtDataFim.Date := Now;
end;

procedure TfrmMostraScored.HabilitarDashboard1Click(Sender: TObject);
begin
    cxCheckBox1.Checked := HabilitarDashboard1.Checked;
end;

procedure TfrmMostraScored.Personaliza;
var
    i : integer;
begin
    for i := 0 to 11 do
    begin
        frmScoredAcumulado.cxTreeList1.Columns[i].Visible           := True;
        frmScoredAcumulado.cxTreeList1.Columns[i].Tag               := 0;
        frmScoredAcumulado.cxTreeList1.Columns[i].Position.ColIndex := i;

        if LePadraoString(frmMostraScored.bdDados,
                     'ID_SCORED = ' + #39 + frmMostraScored.tblScoredCardID_SCORED.Value + #39,
                     frmMostraScored.sUsuario,
                     'frmPersonalizarScored',
                     'campo' + frmScoredAcumulado.cxTreeList1.Columns[i].Caption.Text) = 'False' then
        begin
            frmScoredAcumulado.cxTreeList1.Columns[i].Visible := False;
            frmScoredAcumulado.cxTreeList1.Columns[i].Tag     := 1;
        end;
    end;

    for i := 0 to 13 do
    begin
        cxTreeList1.Columns[i].Visible           := True;
        cxTreeList1.Columns[i].Tag               := 0;
        cxTreeList1.Columns[i].Position.ColIndex := i;

        if LePadraoString(frmMostraScored.bdDados,
                     'ID_SCORED = ' + #39 + frmMostraScored.tblScoredCardID_SCORED.Value + #39,
                     frmMostraScored.sUsuario,
                     'frmPersonalizarScored', 'campo' + cxTreeList1.Columns[i].Caption.Text) = 'False' then
        begin
            cxTreeList1.Columns[i].Visible := False;
            cxTreeList1.Columns[i].Tag     := 1;
        end;
    end;

    cxTreeList1.Columns[18].Visible           := True;
    cxTreeList1.Columns[18].Tag               := 0;
    cxTreeList1.Columns[18].Position.ColIndex := i;

    if LePadraoString(frmMostraScored.bdDados,
                 'ID_SCORED = ' + #39 + frmMostraScored.tblScoredCardID_SCORED.Value + #39,
                 frmMostraScored.sUsuario,
                'frmPersonalizarScored', 'campo' + cxTreeList1.Columns[18].Caption.Text) = 'False' then
    begin
        cxTreeList1.Columns[18].Visible := False;
        cxTreeList1.Columns[18].Tag     := 1;
    end;
end;

procedure TfrmMostraScored.PopupMenu1Popup(Sender: TObject);
begin
    HabilitarDashboard1.Checked := cxCheckBox1.Checked;
end;

procedure TfrmMostraScored.Renomeia(Tipo: Integer);
var
    i : integer;
    sAux : string;
begin
    if Tipo = 0 then
    begin
        for i := 0 to cxTreeList1.ColumnCount - 1 do
        begin
            sAux := LePadraoString(frmMostraScored.bdDados,'ID_SCORED = ' + #39 + frmMostraScored.tblScoredCardID_SCORED.Value + #39, frmMostraScored.sUsuario, 'frmRenomearScored', 'campo' + cxTreeList1.Columns[i].Caption.Text);
            if sAux <> '' then
               cxTreeList1.Columns[i].Caption.Text := sAux;
        end;
    end;

    if Tipo = 1 then
    begin
        cxTreeList1.Columns[0].Caption.Text      := HCLResourceStrings.FindID('sString_334');
        cxTreeList1.Columns[1].Caption.Text      := HCLResourceStrings.FindID('sString_176');
        cxTreeList1.Columns[2].Caption.Text      := HCLResourceStrings.FindID('sString_292');
        cxTreeList1.Columns[3].Caption.Text      := HCLResourceStrings.FindID('sString_293');
        cxTreeList1.Columns[4].Caption.Text      := HCLResourceStrings.FindID('sString_294');
        cxTreeList1.Columns[5].Caption.Text      := HCLResourceStrings.FindID('sString_295');
        cxTreeList1.Columns[6].Caption.Text      := HCLResourceStrings.FindID('sString_296');
        cxTreeList1.Columns[7].Caption.Text      := HCLResourceStrings.FindID('sString_297');
        cxTreeList1.Columns[8].Caption.Text      := HCLResourceStrings.FindID('sString_298');
        cxTreeList1.Columns[9].Caption.Text      := HCLResourceStrings.FindID('sString_299');
        cxTreeList1.Columns[10].Caption.Text     := HCLResourceStrings.FindID('sString_300');
        cxTreeList1.Columns[11].Caption.Text     := HCLResourceStrings.FindID('sString_301');
        cxTreeList1.Columns[12].Caption.Text     := HCLResourceStrings.FindID('sString_302');
        cxTreeList1.Columns[13].Caption.Text     := HCLResourceStrings.FindID('sString_73');
        cxTreeList1.Columns[14].Caption.Text     := HCLResourceStrings.FindID('sString_292');
        cxTreeList1.Columns[15].Caption.Text     := HCLResourceStrings.FindID('sString_293');
        cxTreeList1.Columns[16].Caption.Text     := HCLResourceStrings.FindID('sString_294');
        cxTreeList1.Columns[17].Caption.Text     := HCLResourceStrings.FindID('sString_73');
        cxTreeList1.Columns[18].Caption.Text     := HCLResourceStrings.FindID('sString_72');
    end;

    frmScoredAcumulado.cxTreeList1.Columns[1].Caption.Text  := cxTreeList1.Columns[1].Caption.Text;
    frmScoredAcumulado.cxTreeList1.Columns[2].Caption.Text  := cxTreeList1.Columns[2].Caption.Text;
    frmScoredAcumulado.cxTreeList1.Columns[3].Caption.Text  := cxTreeList1.Columns[5].Caption.Text;
    frmScoredAcumulado.cxTreeList1.Columns[4].Caption.Text  := cxTreeList1.Columns[6].Caption.Text;
    frmScoredAcumulado.cxTreeList1.Columns[5].Caption.Text  := cxTreeList1.Columns[7].Caption.Text;
    frmScoredAcumulado.cxTreeList1.Columns[6].Caption.Text  := cxTreeList1.Columns[8].Caption.Text;
    frmScoredAcumulado.cxTreeList1.Columns[7].Caption.Text  := cxTreeList1.Columns[9].Caption.Text;
    frmScoredAcumulado.cxTreeList1.Columns[8].Caption.Text  := cxTreeList1.Columns[10].Caption.Text;
    frmScoredAcumulado.cxTreeList1.Columns[9].Caption.Text  := cxTreeList1.Columns[11].Caption.Text;
    frmScoredAcumulado.cxTreeList1.Columns[10].Caption.Text := cxTreeList1.Columns[12].Caption.Text;
    frmScoredAcumulado.cxTreeList1.Columns[11].Caption.Text := cxTreeList1.Columns[18].Caption.Text;
    frmScoredAcumulado.cxTreeList1.Columns[12].Caption.Text := cxTreeList1.Columns[14].Caption.Text;

    cxCheck1.Caption  := cxTreeList1.Columns[1].Caption.Text;
    cxCheck4.Caption  := cxTreeList1.Columns[5].Caption.Text;
    cxCheck5.Caption  := cxTreeList1.Columns[6].Caption.Text;
    cxCheck6.Caption  := cxTreeList1.Columns[7].Caption.Text;
    cxCheck7.Caption  := cxTreeList1.Columns[8].Caption.Text;
    cxCheck8.Caption  := cxTreeList1.Columns[9].Caption.Text;
    cxCheck9.Caption  := cxTreeList1.Columns[10].Caption.Text;
    cxCheck10.Caption := cxTreeList1.Columns[11].Caption.Text;
    cxCheck11.Caption := cxTreeList1.Columns[12].Caption.Text;

    if cxCheckBox1.Checked then
       MontaDash;

    if frmScoredAcumulado.cxCheckBox1.Checked then
       frmScoredAcumulado.MontaDash;
end;

procedure TfrmMostraScored.cxButton9Click(Sender: TObject);
begin
    if frmPersonalizarScored <> Nil then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
        Exit;
    end;

    frmPersonalizarScored := TfrmPersonalizarScored.Create(Self);
    frmPersonalizarScored.ShowModal;
    FreeAndNil(frmPersonalizarScored);

    Personaliza;
end;

Initialization
Begin
    SetLanguage(1, nil);
end;

end.
