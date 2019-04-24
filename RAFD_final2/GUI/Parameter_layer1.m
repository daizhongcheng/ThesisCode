function varargout = Parameter_layer1(varargin)
% PARAMETER_LAYER1 MATLAB code for Parameter_layer1.fig
%      PARAMETER_LAYER1, by itself, creates a new PARAMETER_LAYER1 or raises the existing
%      singleton*.
%
%      H = PARAMETER_LAYER1 returns the handle to a new PARAMETER_LAYER1 or the handle to
%      the existing singleton*.
%
%      PARAMETER_LAYER1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PARAMETER_LAYER1.M with the given input arguments.
%
%      PARAMETER_LAYER1('Property','Value',...) creates a new PARAMETER_LAYER1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Parameter_layer1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Parameter_layer1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Parameter_layer1

% Last Modified by GUIDE v2.5 19-Feb-2017 19:34:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Parameter_layer1_OpeningFcn, ...
                   'gui_OutputFcn',  @Parameter_layer1_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Parameter_layer1 is made visible.
function Parameter_layer1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Parameter_layer1 (see VARARGIN)

% Choose default command line output for Parameter_layer1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Parameter_layer1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Parameter_layer1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in checkb_CauseNr1.
function checkb_CauseNr1_Callback(hObject, eventdata, handles)
% hObject    handle to checkb_CauseNr1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkb_CauseNr1
if get(hObject,'Value')==1
    %unable for cause=2 or 3
    set(handles.checkb_CauseNr2,'Value',0);
    set(handles.checkb_CauseNr3,'Value',0);
    %enable all checkboxes for cause1
    set(handles.checkb_Cause1_c,'Enable','on');
    set(handles.checkb_Cause1_r,'Enable','on');
    set(handles.checkb_Cause1_e,'Enable','on');
    %leave checkboxes of cause 1&2&3 unchecked
    set(handles.checkb_Cause1_c,'Value',0);
    set(handles.checkb_Cause1_r,'Value',0);
    set(handles.checkb_Cause1_e,'Value',0);
    
    set(handles.checkb_Cause2_c,'Value',0);
    set(handles.checkb_Cause2_r,'Value',0);
    set(handles.checkb_Cause2_e,'Value',0);
    
    set(handles.checkb_Cause3_c,'Value',0);
    set(handles.checkb_Cause3_r,'Value',0);
    set(handles.checkb_Cause3_e,'Value',0);
    %clear cause1
    set(handles.edit_Cause1_cmin,'String','');
    set(handles.edit_Cause1_cmax,'String','');
    set(handles.edit_Cause1_cmin,'Enable','off');
    set(handles.edit_Cause1_cmax,'Enable','off');
    set(handles.edit_Cause1_emin,'String','');
    set(handles.edit_Cause1_emax,'String','');
    set(handles.edit_Cause1_emin,'Enable','off');
    set(handles.edit_Cause1_emax,'Enable','off');
    set(handles.edit_Cause1_rmin,'String','');
    set(handles.edit_Cause1_rmax,'String','');
    set(handles.edit_Cause1_rmin,'Enable','off');
    set(handles.edit_Cause1_rmax,'Enable','off');
    set(handles.pushbutton_reset1,'Visible','off');
    %unable for cause2
    set(handles.checkb_Cause2_c,'Enable','off');
    set(handles.checkb_Cause2_r,'Enable','off');
    set(handles.checkb_Cause2_e,'Enable','off');
    %clear cause2
    set(handles.checkb_Cause2_c,'Value',0);
    set(handles.checkb_Cause2_r,'Value',0);
    set(handles.checkb_Cause2_e,'Value',0);
    set(handles.edit_Cause2_cmin,'String','');
    set(handles.edit_Cause2_cmax,'String','');
    set(handles.edit_Cause2_cmin,'Enable','off');
    set(handles.edit_Cause2_cmax,'Enable','off');
    set(handles.edit_Cause2_rmin,'String','');
    set(handles.edit_Cause2_rmax,'String','');
    set(handles.edit_Cause2_rmin,'Enable','off');
    set(handles.edit_Cause2_rmax,'Enable','off');
    set(handles.edit_Cause2_rmin,'String','');
    set(handles.edit_Cause2_emax,'String','');
    set(handles.edit_Cause2_emin,'Enable','off');
    set(handles.edit_Cause2_emax,'Enable','off');
    set(handles.pushbutton_reset2,'Visible','off');
    %unable for cause3
    set(handles.checkb_Cause3_c,'Enable','off');
    set(handles.checkb_Cause3_r,'Enable','off');
    set(handles.checkb_Cause3_e,'Enable','off');
    %clear cause3
    set(handles.checkb_Cause3_c,'Value',0);
    set(handles.checkb_Cause3_r,'Value',0);
    set(handles.checkb_Cause3_e,'Value',0);
    set(handles.edit_Cause3_cmin,'String','');
    set(handles.edit_Cause3_cmax,'String','');
    set(handles.edit_Cause3_cmin,'Enable','off');
    set(handles.edit_Cause3_cmax,'Enable','off');
    set(handles.edit_Cause3_rmin,'String','');
    set(handles.edit_Cause3_rmax,'String','');
    set(handles.edit_Cause3_rmin,'Enable','off');
    set(handles.edit_Cause3_rmax,'Enable','off');
    set(handles.edit_Cause3_rmin,'String','');
    set(handles.edit_Cause3_emax,'String','');
    set(handles.edit_Cause3_emin,'Enable','off');
    set(handles.edit_Cause3_emax,'Enable','off');
    set(handles.pushbutton_reset3,'Visible','off');
else 
    %unable for cause2
    set(handles.checkb_Cause1_c,'Enable','off');
    set(handles.checkb_Cause1_r,'Enable','off');
    set(handles.checkb_Cause1_e,'Enable','off');
    %clear cause1
    set(handles.checkb_Cause1_c,'Value',0);
    set(handles.checkb_Cause1_r,'Value',0);
    set(handles.checkb_Cause1_e,'Value',0);
    set(handles.edit_Cause1_cmin,'String','');
    set(handles.edit_Cause1_cmax,'String','');
    set(handles.edit_Cause1_cmin,'Enable','off');
    set(handles.edit_Cause1_cmax,'Enable','off');
    set(handles.edit_Cause1_emin,'String','');
    set(handles.edit_Cause1_emax,'String','');
    set(handles.edit_Cause1_emin,'Enable','off');
    set(handles.edit_Cause1_emax,'Enable','off');
    set(handles.edit_Cause1_rmin,'String','');
    set(handles.edit_Cause1_rmax,'String','');
    set(handles.edit_Cause1_rmin,'Enable','off');
    set(handles.edit_Cause1_rmax,'Enable','off');
    set(handles.pushbutton_reset1,'Visible','off');
    
end

% --- Executes on button press in checkb_CauseNr2.
function checkb_CauseNr2_Callback(hObject, eventdata, handles)
% hObject    handle to checkb_CauseNr2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkb_CauseNr2
if get(hObject,'Value')==1
    %unable for cause=1 or 3
    set(handles.checkb_CauseNr1,'Value',0);
    set(handles.checkb_CauseNr3,'Value',0);
    %leave checkboxes of cause 1&2&3 unchecked
    set(handles.checkb_Cause1_c,'Value',0);
    set(handles.checkb_Cause1_r,'Value',0);
    set(handles.checkb_Cause1_e,'Value',0);
    
    set(handles.checkb_Cause2_c,'Value',0);
    set(handles.checkb_Cause2_r,'Value',0);
    set(handles.checkb_Cause2_e,'Value',0);
    
    set(handles.checkb_Cause3_c,'Value',0);
    set(handles.checkb_Cause3_r,'Value',0);
    set(handles.checkb_Cause3_e,'Value',0);
    %clear cause1
    set(handles.edit_Cause1_cmin,'String','');
    set(handles.edit_Cause1_cmax,'String','');
    set(handles.edit_Cause1_cmin,'Enable','off');
    set(handles.edit_Cause1_cmax,'Enable','off');
    set(handles.edit_Cause1_emin,'String','');
    set(handles.edit_Cause1_emax,'String','');
    set(handles.edit_Cause1_emin,'Enable','off');
    set(handles.edit_Cause1_emax,'Enable','off');
    set(handles.edit_Cause1_rmin,'String','');
    set(handles.edit_Cause1_rmax,'String','');
    set(handles.edit_Cause1_rmin,'Enable','off');
    set(handles.edit_Cause1_rmax,'Enable','off');
    set(handles.pushbutton_reset1,'Visible','off');
    %clear cause2
    set(handles.checkb_Cause2_c,'Value',0);
    set(handles.checkb_Cause2_r,'Value',0);
    set(handles.checkb_Cause2_e,'Value',0);
    set(handles.edit_Cause2_cmin,'String','');
    set(handles.edit_Cause2_cmax,'String','');
    set(handles.edit_Cause2_cmin,'Enable','off');
    set(handles.edit_Cause2_cmax,'Enable','off');
    set(handles.edit_Cause2_emin,'String','');
    set(handles.edit_Cause2_emax,'String','');
    set(handles.edit_Cause2_emin,'Enable','off');
    set(handles.edit_Cause2_emax,'Enable','off');
    set(handles.edit_Cause2_rmin,'String','');
    set(handles.edit_Cause2_rmax,'String','');
    set(handles.edit_Cause2_rmin,'Enable','off');
    set(handles.edit_Cause2_rmax,'Enable','off');
    set(handles.pushbutton_reset2,'Visible','off');
    %enable all checkboxes for cause1&2
    set(handles.checkb_Cause1_c,'Enable','on');
    set(handles.checkb_Cause1_r,'Enable','on');
    set(handles.checkb_Cause1_e,'Enable','on');
    
    set(handles.checkb_Cause2_c,'Enable','on');
    set(handles.checkb_Cause2_r,'Enable','on');
    set(handles.checkb_Cause2_e,'Enable','on');
    %unable for cause3
    set(handles.checkb_Cause3_c,'Enable','off');
    set(handles.checkb_Cause3_r,'Enable','off');
    set(handles.checkb_Cause3_e,'Enable','off');
    %clear cause3
    set(handles.edit_Cause3_cmin,'String','');
    set(handles.edit_Cause3_cmax,'String','');
    set(handles.edit_Cause3_cmin,'Enable','off');
    set(handles.edit_Cause3_cmax,'Enable','off');
    set(handles.edit_Cause3_emin,'String','');
    set(handles.edit_Cause3_emax,'String','');
    set(handles.edit_Cause3_emin,'Enable','off');
    set(handles.edit_Cause3_emax,'Enable','off');
    set(handles.edit_Cause3_rmin,'String','');
    set(handles.edit_Cause3_rmax,'String','');
    set(handles.edit_Cause3_rmin,'Enable','off');
    set(handles.edit_Cause3_rmax,'Enable','off');
    set(handles.pushbutton_reset3,'Visible','off');
else 
    %unable for cause1&2
    set(handles.checkb_Cause1_c,'Enable','off');
    set(handles.checkb_Cause1_r,'Enable','off');
    set(handles.checkb_Cause1_e,'Enable','off');
    
    set(handles.checkb_Cause2_c,'Enable','off');
    set(handles.checkb_Cause2_r,'Enable','off');
    set(handles.checkb_Cause2_e,'Enable','off');
    %clear cause1
    set(handles.edit_Cause1_cmin,'String','');
    set(handles.edit_Cause1_cmax,'String','');
    set(handles.edit_Cause1_cmin,'Enable','off');
    set(handles.edit_Cause1_cmax,'Enable','off');
    set(handles.edit_Cause1_emin,'String','');
    set(handles.edit_Cause1_emax,'String','');
    set(handles.edit_Cause1_emin,'Enable','off');
    set(handles.edit_Cause1_emax,'Enable','off');
    set(handles.edit_Cause1_rmin,'String','');
    set(handles.edit_Cause1_rmax,'String','');
    set(handles.edit_Cause1_rmin,'Enable','off');
    set(handles.edit_Cause1_rmax,'Enable','off');
    set(handles.pushbutton_reset1,'Visible','off');
    %clear cause2
    set(handles.edit_Cause2_cmin,'String','');
    set(handles.edit_Cause2_cmax,'String','');
    set(handles.edit_Cause2_cmin,'Enable','off');
    set(handles.edit_Cause2_cmax,'Enable','off');
    set(handles.edit_Cause2_emin,'String','');
    set(handles.edit_Cause2_emax,'String','');
    set(handles.edit_Cause2_emin,'Enable','off');
    set(handles.edit_Cause2_emax,'Enable','off');
    set(handles.edit_Cause2_rmin,'String','');
    set(handles.edit_Cause2_rmax,'String','');
    set(handles.edit_Cause2_rmin,'Enable','off');
    set(handles.edit_Cause2_rmax,'Enable','off');
    set(handles.pushbutton_reset2,'Visible','off');
    
end

% --- Executes on button press in checkb_CauseNr3.
function checkb_CauseNr3_Callback(hObject, eventdata, handles)
% hObject    handle to checkb_CauseNr3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkb_CauseNr3
if get(hObject,'Value')==1
    %unable for cause=1 or 2
    set(handles.checkb_CauseNr1,'Value',0);
    set(handles.checkb_CauseNr2,'Value',0);
    %enable all checkboxes for cause1&2&3
    set(handles.checkb_Cause1_c,'Enable','on');
    set(handles.checkb_Cause1_r,'Enable','on');
    set(handles.checkb_Cause1_e,'Enable','on');
    
    set(handles.checkb_Cause2_c,'Enable','on');
    set(handles.checkb_Cause2_r,'Enable','on');
    set(handles.checkb_Cause2_e,'Enable','on');
    
    set(handles.checkb_Cause3_c,'Enable','on');
    set(handles.checkb_Cause3_r,'Enable','on');
    set(handles.checkb_Cause3_e,'Enable','on');
    %leave checkboxes of cause 1&2&3 unchecked
    set(handles.checkb_Cause1_c,'Value',0);
    set(handles.checkb_Cause1_r,'Value',0);
    set(handles.checkb_Cause1_e,'Value',0);
    
    set(handles.checkb_Cause2_c,'Value',0);
    set(handles.checkb_Cause2_r,'Value',0);
    set(handles.checkb_Cause2_e,'Value',0);
    
    set(handles.checkb_Cause3_c,'Value',0);
    set(handles.checkb_Cause3_r,'Value',0);
    set(handles.checkb_Cause3_e,'Value',0);
    %clear cause1
    set(handles.edit_Cause1_cmin,'String','');
    set(handles.edit_Cause1_cmax,'String','');
    set(handles.edit_Cause1_cmin,'Enable','off');
    set(handles.edit_Cause1_cmax,'Enable','off');
    set(handles.edit_Cause1_emin,'String','');
    set(handles.edit_Cause1_emax,'String','');
    set(handles.edit_Cause1_emin,'Enable','off');
    set(handles.edit_Cause1_emax,'Enable','off');
    set(handles.edit_Cause1_rmin,'String','');
    set(handles.edit_Cause1_rmax,'String','');
    set(handles.edit_Cause1_rmin,'Enable','off');
    set(handles.edit_Cause1_rmax,'Enable','off');
    set(handles.pushbutton_reset1,'Visible','off');
    %clear cause2
    set(handles.checkb_Cause2_c,'Value',0);
    set(handles.checkb_Cause2_r,'Value',0);
    set(handles.checkb_Cause2_e,'Value',0);
    set(handles.edit_Cause2_cmin,'String','');
    set(handles.edit_Cause2_cmax,'String','');
    set(handles.edit_Cause2_cmin,'Enable','off');
    set(handles.edit_Cause2_cmax,'Enable','off');
    set(handles.edit_Cause2_emin,'String','');
    set(handles.edit_Cause2_emax,'String','');
    set(handles.edit_Cause2_emin,'Enable','off');
    set(handles.edit_Cause2_emax,'Enable','off');
    set(handles.edit_Cause2_rmin,'String','');
    set(handles.edit_Cause2_rmax,'String','');
    set(handles.edit_Cause2_rmin,'Enable','off');
    set(handles.edit_Cause2_rmax,'Enable','off');
    set(handles.pushbutton_reset2,'Visible','off');
    %clear cause3
    set(handles.edit_Cause3_cmin,'String','');
    set(handles.edit_Cause3_cmax,'String','');
    set(handles.edit_Cause3_cmin,'Enable','off');
    set(handles.edit_Cause3_cmax,'Enable','off');
    set(handles.edit_Cause3_emin,'String','');
    set(handles.edit_Cause3_emax,'String','');
    set(handles.edit_Cause3_emin,'Enable','off');
    set(handles.edit_Cause3_emax,'Enable','off');
    set(handles.edit_Cause3_rmin,'String','');
    set(handles.edit_Cause3_rmax,'String','');
    set(handles.edit_Cause3_rmin,'Enable','off');
    set(handles.edit_Cause3_rmax,'Enable','off');
    set(handles.pushbutton_reset3,'Visible','off');
    
else 
    %unable for cause1&2&3
    set(handles.checkb_Cause1_c,'Enable','off');
    set(handles.checkb_Cause1_r,'Enable','off');
    set(handles.checkb_Cause1_e,'Enable','off');
    
    set(handles.checkb_Cause2_c,'Enable','off');
    set(handles.checkb_Cause2_r,'Enable','off');
    set(handles.checkb_Cause2_e,'Enable','off');
    
    set(handles.checkb_Cause3_c,'Enable','off');
    set(handles.checkb_Cause3_r,'Enable','off');
    set(handles.checkb_Cause3_e,'Enable','off');
    
    %clear cause1
    set(handles.edit_Cause1_cmin,'String','');
    set(handles.edit_Cause1_cmax,'String','');
    set(handles.edit_Cause1_cmin,'Enable','off');
    set(handles.edit_Cause1_cmax,'Enable','off');
    set(handles.edit_Cause1_emin,'String','');
    set(handles.edit_Cause1_emax,'String','');
    set(handles.edit_Cause1_emin,'Enable','off');
    set(handles.edit_Cause1_emax,'Enable','off');
    set(handles.edit_Cause1_rmin,'String','');
    set(handles.edit_Cause1_rmax,'String','');
    set(handles.edit_Cause1_rmin,'Enable','off');
    set(handles.edit_Cause1_rmax,'Enable','off');
    set(handles.pushbutton_reset1,'Visible','off');
    %clear cause2
    set(handles.checkb_Cause2_c,'Value',0);
    set(handles.checkb_Cause2_r,'Value',0);
    set(handles.checkb_Cause2_e,'Value',0);
    set(handles.edit_Cause2_cmin,'String','');
    set(handles.edit_Cause2_cmax,'String','');
    set(handles.edit_Cause2_cmin,'Enable','off');
    set(handles.edit_Cause2_cmax,'Enable','off');
    set(handles.edit_Cause2_emin,'String','');
    set(handles.edit_Cause2_emax,'String','');
    set(handles.edit_Cause2_emin,'Enable','off');
    set(handles.edit_Cause2_emax,'Enable','off');
    set(handles.edit_Cause2_rmin,'String','');
    set(handles.edit_Cause2_rmax,'String','');
    set(handles.edit_Cause2_rmin,'Enable','off');
    set(handles.edit_Cause2_rmax,'Enable','off');
    set(handles.pushbutton_reset2,'Visible','off');
    %clear cause3
    set(handles.edit_Cause3_cmin,'String','');
    set(handles.edit_Cause3_cmax,'String','');
    set(handles.edit_Cause3_cmin,'Enable','off');
    set(handles.edit_Cause3_cmax,'Enable','off');
    set(handles.edit_Cause3_emin,'String','');
    set(handles.edit_Cause3_emax,'String','');
    set(handles.edit_Cause3_emin,'Enable','off');
    set(handles.edit_Cause3_emax,'Enable','off');
    set(handles.edit_Cause3_rmin,'String','');
    set(handles.edit_Cause3_rmax,'String','');
    set(handles.edit_Cause3_rmin,'Enable','off');
    set(handles.edit_Cause3_rmax,'Enable','off');
    set(handles.pushbutton_reset3,'Visible','off');
    
end

% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
%cause 1
%cause 
text('Interpreter','latex','Units','Normalized','String',... 
    '$$\varphi_{1}$$=',...
    'Position',[.033 .8],'FontSize',13,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    '$$\varphi_{2}$$=',...
    'Position',[.334 .8],'FontSize',13,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    '$$\varphi_{3}$$=',...
    'Position',[.646 .8],'FontSize',13,'Fontname','MS Sans Serif')
%%phi
text('Interpreter','latex','Units','Normalized','String',... 
    '$$\vartheta_1$$',...
    'Position',[.074 .8],'FontSize',13,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    '$$\vartheta_{2}$$',...
    'Position',[.375 .8],'FontSize',13,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    '$$t$$',...
    'Position',[.395 .8],'FontSize',13,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    '$$1-e^{\vartheta_3 t }$$',...
    'Position',[.684 .805],'FontSize',13,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    '$$\vartheta_1 \sim $$U$$($$',...
    'Position',[.123 .8],'FontSize',13,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    ',',...
    'Position',[.222 .785],'FontSize',13,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    ')',...
    'Position',[.268 .8],'FontSize',13,'Fontname','MS Sans Serif')

text('Interpreter','latex','Units','Normalized','String',... 
    '$$\vartheta_2 \sim $$U$$($$',...
    'Position',[.435 .8],'FontSize',13,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    ',',...
    'Position',[.534 .785],'FontSize',13,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    ')',...
    'Position',[.58 .8],'FontSize',13,'Fontname','MS Sans Serif')

text('Interpreter','latex','Units','Normalized','String',... 
    '$$\vartheta_3 \sim $$U$$($$',...
    'Position',[.775 .8],'FontSize',13,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    ',',...
    'Position',[.873 .785],'FontSize',13,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    ')',...
    'Position',[.917 .8],'FontSize',13,'Fontname','MS Sans Serif')

%cause 2
%cause 
text('Interpreter','latex','Units','Normalized','String',... 
    '$$\varphi_{1}$$=',...
    'Position',[.033 .49],'FontSize',13,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    '$$\varphi_{2}$$=',...
    'Position',[.334 .49],'FontSize',13,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    '$$\varphi_{3}$$=',...
    'Position',[.646 .49],'FontSize',13,'Fontname','MS Sans Serif')
%%phi
text('Interpreter','latex','Units','Normalized','String',... 
    '$$\vartheta_1$$',...
    'Position',[.074 .49],'FontSize',13,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    '$$\vartheta_{2}$$',...
    'Position',[.375 .49],'FontSize',13,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    '$$t$$',...
    'Position',[.395 .49],'FontSize',13,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    '$$1-e^{\vartheta_3 t }$$',...
    'Position',[.684 .495],'FontSize',13,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    '$$\vartheta_1 \sim $$U$$($$',...
    'Position',[.123 .49],'FontSize',13,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    ',',...
    'Position',[.222 .475],'FontSize',13,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    ')',...
    'Position',[.268 .49],'FontSize',13,'Fontname','MS Sans Serif')

text('Interpreter','latex','Units','Normalized','String',... 
    '$$\vartheta_2 \sim $$U$$($$',...
    'Position',[.435 .49],'FontSize',13,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    ',',...
    'Position',[.534 .475],'FontSize',13,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    ')',...
    'Position',[.58 .49],'FontSize',13,'Fontname','MS Sans Serif')

text('Interpreter','latex','Units','Normalized','String',... 
    '$$\vartheta_3 \sim $$U$$($$',...
    'Position',[.775 .49],'FontSize',13,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    ',',...
    'Position',[.873 .475],'FontSize',13,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    ')',...
    'Position',[.917 .49],'FontSize',13,'Fontname','MS Sans Serif')

%cause 3
%cause 
text('Interpreter','latex','Units','Normalized','String',... 
    '$$\varphi_{1}$$=',...
    'Position',[.033 .18],'FontSize',13,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    '$$\varphi_{2}$$=',...
    'Position',[.334 .18],'FontSize',13,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    '$$\varphi_{3}$$=',...
    'Position',[.646 .18],'FontSize',13,'Fontname','MS Sans Serif')
%%phi
text('Interpreter','latex','Units','Normalized','String',... 
    '$$\vartheta_1$$',...
    'Position',[.074 .18],'FontSize',13,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    '$$\vartheta_{2}$$',...
    'Position',[.375 .18],'FontSize',13,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    '$$t$$',...
    'Position',[.395 .18],'FontSize',13,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    '$$1-e^{\vartheta_3 t }$$',...
    'Position',[.684 .185],'FontSize',13,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    '$$\vartheta_1 \sim $$U$$($$',...
    'Position',[.123 .18],'FontSize',13,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    ',',...
    'Position',[.222 .165],'FontSize',13,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    ')',...
    'Position',[.268 .18],'FontSize',13,'Fontname','MS Sans Serif')

text('Interpreter','latex','Units','Normalized','String',... 
    '$$\vartheta_2 \sim $$U$$($$',...
    'Position',[.435 .18],'FontSize',13,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    ',',...
    'Position',[.534 .165],'FontSize',13,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    ')',...
    'Position',[.58 .18],'FontSize',13,'Fontname','MS Sans Serif')

text('Interpreter','latex','Units','Normalized','String',... 
    '$$\vartheta_3 \sim $$U$$($$',...
    'Position',[.775 .18],'FontSize',13,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    ',',...
    'Position',[.873 .165],'FontSize',13,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    ')',...
    'Position',[.917 .18],'FontSize',13,'Fontname','MS Sans Serif')

% --- Executes on button press in checkb_Cause1_c.
function checkb_Cause1_c_Callback(hObject, eventdata, handles)
% hObject    handle to checkb_Cause1_c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkb_Cause1_c
if (get(hObject,'value')==1)
    set(handles.edit_Cause1_cmin,'Enable','on');
    set(handles.edit_Cause1_cmax,'Enable','on');
    if (get(handles.checkb_Cause1_r,'value')==1)&&(get(handles.checkb_Cause1_e,'value')==1)
        errordlg('Maximum only 2 kinds of functions can be chosen .','Error');
        set(hObject,'value',0);
    elseif(get(handles.checkb_Cause1_r,'value')==1)||(get(handles.checkb_Cause1_e,'value')==1)
        set(handles.pushbutton_reset1,'Visible','On');
        Hidden_layer1;
        handles=guihandles;
    end
else
    set(handles.pushbutton_reset1,'Visible','Off');
    set(handles.edit_Cause1_cmin,'String','');
    set(handles.edit_Cause1_cmax,'String','');
    set(handles.edit_Cause1_cmin,'Enable','off');
    set(handles.edit_Cause1_cmax,'Enable','off');
end

function edit_Cause1_cmin_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Cause1_cmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Cause1_cmin as text
%        str2double(get(hObject,'String')) returns contents of edit_Cause1_cmin as a double


% --- Executes during object creation, after setting all properties.
function edit_Cause1_cmin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Cause1_cmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_Cause1_cmax_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Cause1_cmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Cause1_cmax as text
%        str2double(get(hObject,'String')) returns contents of edit_Cause1_cmax as a double


% --- Executes during object creation, after setting all properties.
function edit_Cause1_cmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Cause1_cmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkb_Cause1_r.
function checkb_Cause1_r_Callback(hObject, eventdata, handles)
% hObject    handle to checkb_Cause1_r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkb_Cause1_r
if (get(hObject,'value')==1)
    set(handles.edit_Cause1_rmin,'Enable','on');
    set(handles.edit_Cause1_rmax,'Enable','on');
    if (get(handles.checkb_Cause1_c,'value')==1)&&(get(handles.checkb_Cause1_e,'value')==1)
        errordlg('Maximum only 2 kinds of functions can be chosen .','Error');
        set(hObject,'value',0);
    elseif(get(handles.checkb_Cause1_c,'value')==1)||(get(handles.checkb_Cause1_e,'value')==1)
        set(handles.pushbutton_reset1,'Visible','On');
        Hidden_layer1;
        handles=guihandles;
    end
else
    set(handles.pushbutton_reset1,'Visible','Off');
    set(handles.edit_Cause1_rmin,'String','');
    set(handles.edit_Cause1_rmax,'String','');
    set(handles.edit_Cause1_rmin,'Enable','off');
    set(handles.edit_Cause1_rmax,'Enable','off');
end

% --- Executes on button press in checkb_Cause1_e.
function checkb_Cause1_e_Callback(hObject, eventdata, handles)
% hObject    handle to checkb_Cause1_e (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkb_Cause1_e
if (get(hObject,'value')==1)
    set(handles.edit_Cause1_emin,'Enable','on');
    set(handles.edit_Cause1_emax,'Enable','on');
    if (get(handles.checkb_Cause1_c,'value')==1)&&(get(handles.checkb_Cause1_r,'value')==1)
        errordlg('Maximum only 2 kinds of functions can be chosen .','Error');
        set(hObject,'value',0);
    elseif(get(handles.checkb_Cause1_c,'value')==1)||(get(handles.checkb_Cause1_r,'value')==1)
        set(handles.pushbutton_reset1,'Visible','On');
        Hidden_layer1;
        handles=guihandles;
    end
else
    set(handles.pushbutton_reset1,'Visible','Off');
    set(handles.edit_Cause1_emin,'String','');
    set(handles.edit_Cause1_emax,'String','');
    set(handles.edit_Cause1_emin,'Enable','off');
    set(handles.edit_Cause1_emax,'Enable','off');
end


function edit_Cause1_rmin_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Cause1_rmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Cause1_rmin as text
%        str2double(get(hObject,'String')) returns contents of edit_Cause1_rmin as a double


% --- Executes during object creation, after setting all properties.
function edit_Cause1_rmin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Cause1_rmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_Cause1_rmax_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Cause1_rmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Cause1_rmax as text
%        str2double(get(hObject,'String')) returns contents of edit_Cause1_rmax as a double


% --- Executes during object creation, after setting all properties.
function edit_Cause1_rmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Cause1_rmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_Cause1_emin_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Cause1_emin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Cause1_emin as text
%        str2double(get(hObject,'String')) returns contents of edit_Cause1_emin as a double


% --- Executes during object creation, after setting all properties.
function edit_Cause1_emin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Cause1_emin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_Cause1_emax_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Cause1_emax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Cause1_emax as text
%        str2double(get(hObject,'String')) returns contents of edit_Cause1_emax as a double


% --- Executes during object creation, after setting all properties.
function edit_Cause1_emax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Cause1_emax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkb_Cause2_c.
function checkb_Cause2_c_Callback(hObject, eventdata, handles)
% hObject    handle to checkb_Cause2_c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkb_Cause2_c
if (get(hObject,'value')==1)
    set(handles.edit_Cause2_cmin,'Enable','on');
    set(handles.edit_Cause2_cmax,'Enable','on');
    if (get(handles.checkb_Cause2_r,'value')==1)&&(get(handles.checkb_Cause2_e,'value')==1)
        errordlg('Maximum only 2 kinds of functions can be chosen .','Error');
        set(hObject,'value',0);
    elseif(get(handles.checkb_Cause2_r,'value')==1)||(get(handles.checkb_Cause2_e,'value')==1)
        set(handles.pushbutton_reset2,'Visible','On');
        Hidden_layer2;
        handles=guihandles;
    end
else
    set(handles.pushbutton_reset2,'Visible','Off');
    set(handles.edit_Cause2_cmin,'String','');
    set(handles.edit_Cause2_cmax,'String','');
    set(handles.edit_Cause2_cmin,'Enable','off');
    set(handles.edit_Cause2_cmax,'Enable','off');
end


function edit_Cause2_cmin_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Cause2_cmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Cause2_cmin as text
%        str2double(get(hObject,'String')) returns contents of edit_Cause2_cmin as a double


% --- Executes during object creation, after setting all properties.
function edit_Cause2_cmin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Cause2_cmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_Cause2_cmax_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Cause2_cmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Cause2_cmax as text
%        str2double(get(hObject,'String')) returns contents of edit_Cause2_cmax as a double


% --- Executes during object creation, after setting all properties.
function edit_Cause2_cmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Cause2_cmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkb_Cause2_r.
function checkb_Cause2_r_Callback(hObject, eventdata, handles)
% hObject    handle to checkb_Cause2_r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkb_Cause2_r
if (get(hObject,'value')==1)
    set(handles.edit_Cause2_rmin,'Enable','on');
    set(handles.edit_Cause2_rmax,'Enable','on');
    if (get(handles.checkb_Cause2_c,'value')==1)&&(get(handles.checkb_Cause2_e,'value')==1)
        errordlg('Maximum only 2 kinds of functions can be chosen .','Error');
        set(hObject,'value',0);
    elseif(get(handles.checkb_Cause2_c,'value')==1)||(get(handles.checkb_Cause2_e,'value')==1)
        set(handles.pushbutton_reset2,'Visible','On');
        Hidden_layer2;
        handles=guihandles;
    end
else
    set(handles.pushbutton_reset2,'Visible','Off');
    set(handles.edit_Cause2_rmin,'String','');
    set(handles.edit_Cause2_rmax,'String','');
    set(handles.edit_Cause2_rmin,'Enable','off');
    set(handles.edit_Cause2_rmax,'Enable','off');
end
% --- Executes on button press in checkb_Cause2_e.
function checkb_Cause2_e_Callback(hObject, eventdata, handles)
% hObject    handle to checkb_Cause2_e (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkb_Cause2_e
if (get(hObject,'value')==1)
    set(handles.edit_Cause2_emin,'Enable','on');
    set(handles.edit_Cause2_emax,'Enable','on');
    if (get(handles.checkb_Cause2_c,'value')==1)&&(get(handles.checkb_Cause2_r,'value')==1)
        errordlg('Maximum only 2 kinds of functions can be chosen .','Error');
        set(hObject,'value',0);
    elseif(get(handles.checkb_Cause2_c,'value')==1)||(get(handles.checkb_Cause2_r,'value')==1)
        set(handles.pushbutton_reset2,'Visible','On');
        Hidden_layer2;
        handles=guihandles;
    end
else
    set(handles.pushbutton_reset2,'Visible','Off');
    set(handles.edit_Cause2_emin,'String','');
    set(handles.edit_Cause2_emax,'String','');
    set(handles.edit_Cause2_emin,'Enable','off');
    set(handles.edit_Cause2_emax,'Enable','off');
end

function edit_Cause2_rmin_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Cause2_rmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Cause2_rmin as text
%        str2double(get(hObject,'String')) returns contents of edit_Cause2_rmin as a double


% --- Executes during object creation, after setting all properties.
function edit_Cause2_rmin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Cause2_rmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_Cause2_rmax_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Cause2_rmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Cause2_rmax as text
%        str2double(get(hObject,'String')) returns contents of edit_Cause2_rmax as a double


% --- Executes during object creation, after setting all properties.
function edit_Cause2_rmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Cause2_rmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_Cause2_emin_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Cause2_emin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Cause2_emin as text
%        str2double(get(hObject,'String')) returns contents of edit_Cause2_emin as a double


% --- Executes during object creation, after setting all properties.
function edit_Cause2_emin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Cause2_emin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_Cause2_emax_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Cause2_emax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Cause2_emax as text
%        str2double(get(hObject,'String')) returns contents of edit_Cause2_emax as a double


% --- Executes during object creation, after setting all properties.
function edit_Cause2_emax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Cause2_emax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkb_Cause3_c.
function checkb_Cause3_c_Callback(hObject, eventdata, handles)
% hObject    handle to checkb_Cause3_c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkb_Cause3_c
if (get(hObject,'value')==1)
    set(handles.edit_Cause3_cmin,'Enable','on');
    set(handles.edit_Cause3_cmax,'Enable','on');
    if (get(handles.checkb_Cause3_r,'value')==1)&&(get(handles.checkb_Cause3_e,'value')==1)
        errordlg('Maximum only 2 kinds of functions can be chosen .','Error');
        set(hObject,'value',0);
    elseif(get(handles.checkb_Cause3_r,'value')==1)||(get(handles.checkb_Cause3_e,'value')==1)
        set(handles.pushbutton_reset3,'Visible','On');
        Hidden_layer3;
        handles=guihandles;
    end
else
    set(handles.pushbutton_reset3,'Visible','Off');
    set(handles.edit_Cause3_cmin,'String','');
    set(handles.edit_Cause3_cmax,'String','');
    set(handles.edit_Cause3_cmin,'Enable','off');
    set(handles.edit_Cause3_cmax,'Enable','off');
end

function edit_Cause3_cmin_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Cause3_cmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Cause3_cmin as text
%        str2double(get(hObject,'String')) returns contents of edit_Cause3_cmin as a double


% --- Executes during object creation, after setting all properties.
function edit_Cause3_cmin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Cause3_cmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_Cause3_cmax_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Cause3_cmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Cause3_cmax as text
%        str2double(get(hObject,'String')) returns contents of edit_Cause3_cmax as a double


% --- Executes during object creation, after setting all properties.
function edit_Cause3_cmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Cause3_cmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkb_Cause3_r.
function checkb_Cause3_r_Callback(hObject, eventdata, handles)
% hObject    handle to checkb_Cause3_r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkb_Cause3_r
if (get(hObject,'value')==1)
    set(handles.edit_Cause3_rmin,'Enable','on');
    set(handles.edit_Cause3_rmax,'Enable','on');
    if (get(handles.checkb_Cause3_c,'value')==1)&&(get(handles.checkb_Cause3_e,'value')==1)
        errordlg('Maximum only 2 kinds of functions can be chosen .','Error');
        set(hObject,'value',0);
    elseif(get(handles.checkb_Cause3_c,'value')==1)||(get(handles.checkb_Cause3_e,'value')==1)
        set(handles.pushbutton_reset3,'Visible','On');
        Hidden_layer3;
        handles=guihandles;
    end
else
    set(handles.pushbutton_reset3,'Visible','Off');
    set(handles.edit_Cause3_rmin,'String','');
    set(handles.edit_Cause3_rmax,'String','');
    set(handles.edit_Cause3_rmin,'Enable','off');
    set(handles.edit_Cause3_rmax,'Enable','off');
end
% --- Executes on button press in checkb_Cause3_e.
function checkb_Cause3_e_Callback(hObject, eventdata, handles)
% hObject    handle to checkb_Cause3_e (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkb_Cause3_e
if (get(hObject,'value')==1)
    set(handles.edit_Cause3_emin,'Enable','on');
    set(handles.edit_Cause3_emax,'Enable','on');
    if (get(handles.checkb_Cause3_c,'value')==1)&&(get(handles.checkb_Cause3_r,'value')==1)
        errordlg('Maximum only 2 kinds of functions can be chosen .','Error');
        set(hObject,'value',0);
    elseif(get(handles.checkb_Cause3_c,'value')==1)||(get(handles.checkb_Cause3_r,'value')==1)
        set(handles.pushbutton_reset3,'Visible','On');
        Hidden_layer3;
        handles=guihandles;
    end
else
    set(handles.pushbutton_reset3,'Visible','Off');
    set(handles.edit_Cause3_emin,'String','');
    set(handles.edit_Cause3_emax,'String','');
    set(handles.edit_Cause3_emin,'Enable','off');
    set(handles.edit_Cause3_emax,'Enable','off');
end

function edit_Cause3_rmin_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Cause3_rmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Cause3_rmin as text
%        str2double(get(hObject,'String')) returns contents of edit_Cause3_rmin as a double


% --- Executes during object creation, after setting all properties.
function edit_Cause3_rmin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Cause3_rmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_Cause3_rmax_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Cause3_rmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Cause3_rmax as text
%        str2double(get(hObject,'String')) returns contents of edit_Cause3_rmax as a double


% --- Executes during object creation, after setting all properties.
function edit_Cause3_rmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Cause3_rmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_Cause3_emin_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Cause3_emin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Cause3_emin as text
%        str2double(get(hObject,'String')) returns contents of edit_Cause3_emin as a double


% --- Executes during object creation, after setting all properties.
function edit_Cause3_emin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Cause3_emin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_Cause3_emax_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Cause3_emax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Cause3_emax as text
%        str2double(get(hObject,'String')) returns contents of edit_Cause3_emax as a double


% --- Executes during object creation, after setting all properties.
function edit_Cause3_emax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Cause3_emax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global FaultNr_now Fault_Number Data
cause1 = get(handles.checkb_CauseNr1,'Value');
cause2 = get(handles.checkb_CauseNr2,'Value');
cause3 = get(handles.checkb_CauseNr3,'Value');
range_f =0;
range_s =0;
if (cause1==0)&&(cause2==0)&&(cause3==0)
    errordlg('Please choose the number of cause','Error');
else
    
    %cause 1
    p11 = get(handles.checkb_Cause1_c,'Value');
    p12 = get(handles.checkb_Cause1_r,'Value');
    p13 = get(handles.checkb_Cause1_e,'Value');
    
    if p11==1
        phi11min = str2double(get(handles.edit_Cause1_cmin,'String'));
        phi11max = str2double(get(handles.edit_Cause1_cmax,'String'));
        if phi11min > phi11max
            range_f = 1;
        elseif phi11min == phi11max
            range_s = 1;
        end
        
    else
        phi11min = 0;
        phi11max = 0;
    end
    
    if p12==1
        phi12min = str2double(get(handles.edit_Cause1_rmin,'String'));
        phi12max = str2double(get(handles.edit_Cause1_rmax,'String'));
        if phi12min > phi12max
            range_f = 1;
        elseif phi12min == phi12max
            range_s = 1;
        end
    else
        phi12min = 0;
        phi12max = 0;
    end
    
    if p13==1
        phi13min = str2double(get(handles.edit_Cause1_emin,'String'));
        phi13max = str2double(get(handles.edit_Cause1_emax,'String'));
        if phi13min > phi13max
            range_f = 1;
        elseif phi13min == phi13max
            range_s = 1;
        end
    else
        phi13min = 0;
        phi13max = 0;
    end
    
    %cause 2
    p21 = get(handles.checkb_Cause2_c,'Value');
    p22 = get(handles.checkb_Cause2_r,'Value');
    p23 = get(handles.checkb_Cause2_e,'Value');
    
    if p21==1
        phi21min = str2double(get(handles.edit_Cause2_cmin,'String'));
        phi21max = str2double(get(handles.edit_Cause2_cmax,'String'));
        if phi21min > phi21max
            range_f = 1;
        elseif phi21min == phi21max
            range_s = 1;
        end
    else
        phi21min = 0;
        phi21max = 0;
    end
    
    if p22==1
        phi22min = str2double(get(handles.edit_Cause2_rmin,'String'));
        phi22max = str2double(get(handles.edit_Cause2_rmax,'String'));
        if phi22min > phi22max
            range_f = 1;
        elseif phi22min == phi22max
            range_s = 1;
        end
    else
        phi22min = 0;
        phi22max = 0;
    end
    
    if p23==1
        phi23min = str2double(get(handles.edit_Cause2_emin,'String'));
        phi23max = str2double(get(handles.edit_Cause2_emax,'String'));
        if phi23min > phi23max
            range_f = 1;
        elseif phi23min == phi23max
            range_s = 1;
        end
    else
        phi23min = 0;
        phi23max = 0;
    end
    
    %cause 3
    p31 = get(handles.checkb_Cause3_c,'Value');
    p32 = get(handles.checkb_Cause3_r,'Value');
    p33 = get(handles.checkb_Cause3_e,'Value');
    
    if p31==1
        phi31min = str2double(get(handles.edit_Cause3_cmin,'String'));
        phi31max = str2double(get(handles.edit_Cause3_cmax,'String'));
        if phi31min > phi31max
            range_f = 1;
        elseif phi31min == phi31max
            range_s = 1;
        end
    else
        phi31min = 0;
        phi31max = 0;
    end
    
    if p32==1
        phi32min = str2double(get(handles.edit_Cause3_rmin,'String'));
        phi32max = str2double(get(handles.edit_Cause3_rmax,'String'));
        if phi32min > phi32max
            range_f = 1;
        elseif phi32min == phi32max
            range_s = 1;
        end
    else
        phi32min = 0;
        phi32max = 0;
    end
    
    if p33==1
        phi33min = str2double(get(handles.edit_Cause3_emin,'String'));
        phi33max = str2double(get(handles.edit_Cause3_emax,'String'));
        if phi33min > phi33max
            range_f = 1;
        elseif phi33min == phi33max
            range_s = 1;
        end
    else
        phi33min = 0;
        phi33max = 0;
    end
end

%check range
if range_f ==1
    errordlg('Please check your range','Error');
else
    if range_s ==1
        c=questdlg('Do you want to set an exact number for your range?','Range','Yes','No','Yes');
        if strcmp(c,'Yes')
            %save cause number
            Cause_Nr = zeros(1,5);
            if cause1 ==1
                Cause_Nr(1,1) = 1;
            elseif cause2 ==1
                Cause_Nr(1,1) = 2;
            elseif cause3 ==1
                Cause_Nr(1,1) = 3;
            end
            %which functions are chosen
            Fault_function(:,:,1) = [p11 p12 p13;p21 p22 p23;p31 p32 p33];
            %save function parameters
            Fault_range(:,:,1) = [phi11min phi11max phi12min phi12max phi13min phi13max;phi21min phi21max phi22min phi22max phi23min phi23max;,...
                phi31min phi31max phi32min phi32max phi33min phi33max];
            %save data to mat. file
            load('fileData.mat');
            %recheck hidden_layer
            if (p11+p12+p13)==0
                f_parameter.Hidden_pro(1,:,1) = zeros(1,3);
            elseif (p11+p12+p13)==1
                f_parameter.Hidden_pro(1,:,1) = [0 1 0];
            end
            if (p21+p22+p23)==0
                f_parameter.Hidden_pro(2,:,1) = zeros(1,3);
            elseif (p21+p22+p23)==1
                f_parameter.Hidden_pro(2,:,1) = [0 1 0];
            end
            if (p31+p32+p33)==0
                f_parameter.Hidden_pro(3,:,1) = zeros(1,3);
            elseif (p31+p32+p33)==1
                f_parameter.Hidden_pro(3,:,1) = [0 1 0];
            end
            f_parameter.Cause_Nr = Cause_Nr;
            f_parameter.Fault_function = Fault_function;
            f_parameter.Fault_range = Fault_range;
            save ('fileData','f_parameter');
            if Fault_Number > 1
                load('fileData.mat');
                f_parameter.Hidden_pro(:,:,2) = zeros(3,3);
                save ('fileData','f_parameter');
                FaultNr_now = 2;
                close;
                Parameter_layer2;
            else
                close;
                Finished;
            end
        
        end
    else
        %save cause number
            Cause_Nr = zeros(1,5);
            if cause1 ==1
                Cause_Nr(1,1) = 1;
            elseif cause2 ==1
                Cause_Nr(1,1) = 2;
            elseif cause3 ==1
                Cause_Nr(1,1) = 3;
            end
            %which functions are chosen
            Fault_function(:,:,1) = [p11 p12 p13;p21 p22 p23;p31 p32 p33];
            %save function parameters
            Fault_range(:,:,1) = [phi11min phi11max phi12min phi12max phi13min phi13max;phi21min phi21max phi22min phi22max phi23min phi23max;,...
                phi31min phi31max phi32min phi32max phi33min phi33max];
            %save data to mat. file
            load('fileData.mat');
            %recheck hidden_layer
            if (p11+p12+p13)==0
                f_parameter.Hidden_pro(1,:,1) = zeros(1,3);
            elseif (p11+p12+p13)==1
                f_parameter.Hidden_pro(1,:,1) = [0 100 0];
            end
            if (p21+p22+p23)==0
                f_parameter.Hidden_pro(2,:,1) = zeros(1,3);
            elseif (p21+p22+p23)==1
                f_parameter.Hidden_pro(2,:,1) = [0 100 0];
            end
            if (p31+p32+p33)==0
                f_parameter.Hidden_pro(3,:,1) = zeros(1,3);
            elseif (p31+p32+p33)==1
                f_parameter.Hidden_pro(3,:,1) = [0 100 0];
            end
            f_parameter.Cause_Nr = Cause_Nr;
            f_parameter.Fault_function = Fault_function;
            f_parameter.Fault_range = Fault_range;
            save ('fileData','f_parameter');
            if Fault_Number > 1
                load('fileData.mat');
                f_parameter.Hidden_pro(:,:,2) = zeros(3,3);
                save ('fileData','f_parameter');
                FaultNr_now = 2;
                close;
                Parameter_layer2;
            else
                close;
                Finished;
            end
    end
end



% --- Executes on button press in pushbutton_reset1.
function pushbutton_reset1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_reset1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Hidden_layer1;
handles=guihandles;

% --- Executes on button press in pushbutton_reset2.
function pushbutton_reset2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_reset2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Hidden_layer2;
handles=guihandles;

% --- Executes on button press in pushbutton_reset3.
function pushbutton_reset3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_reset3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Hidden_layer3;
handles=guihandles;


% --- Executes on button press in pushbutton_back.
function pushbutton_back_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global FaultNr_now
FaultNr_now = FaultNr_now -1;
close;
Fault_model;


% --- Executes on button press in pushbutton_close.
function pushbutton_close_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
c=questdlg('Do you want to close the toolbox?','Close','Yes','No','Yes');
if strcmp(c,'Yes')
    close all;
end
