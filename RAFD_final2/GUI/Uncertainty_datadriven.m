function varargout = Uncertainty_datadriven(varargin)
% UNCERTAINTY_DATADRIVEN MATLAB code for Uncertainty_datadriven.fig
%      UNCERTAINTY_DATADRIVEN, by itself, creates a new UNCERTAINTY_DATADRIVEN or raises the existing
%      singleton*.
%
%      H = UNCERTAINTY_DATADRIVEN returns the handle to a new UNCERTAINTY_DATADRIVEN or the handle to
%      the existing singleton*.
%
%      UNCERTAINTY_DATADRIVEN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNCERTAINTY_DATADRIVEN.M with the given input arguments.
%
%      UNCERTAINTY_DATADRIVEN('Property','Value',...) creates a new UNCERTAINTY_DATADRIVEN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Uncertainty_datadriven_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Uncertainty_datadriven_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Uncertainty_datadriven

% Last Modified by GUIDE v2.5 10-Mar-2017 10:49:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Uncertainty_datadriven_OpeningFcn, ...
                   'gui_OutputFcn',  @Uncertainty_datadriven_OutputFcn, ...
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


% --- Executes just before Uncertainty_datadriven is made visible.
function Uncertainty_datadriven_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Uncertainty_datadriven (see VARARGIN)

% Choose default command line output for Uncertainty_datadriven
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Uncertainty_datadriven wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Uncertainty_datadriven_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
c=questdlg('Do you want to close the toolbox?','Close','Yes','No','Yes');
if strcmp(c,'Yes')
close all;
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
unc_1 = get(handles.radiobutton_unc1,'Value');
unc_2 = get(handles.radiobutton_unc2,'Value');
unc_3 = get(handles.radiobutton_unc3,'Value');
if (unc_1==0)&&(unc_2==0)&&(unc_3==0)
    errordlg('Please choose uncertainty','Error');
else
    load('fileData.mat');
    if unc_1 == 1
        f_parameter.Covariance(1,4) = 1;
    elseif unc_2 == 1
        f_parameter.Covariance(1,4) = 2;
    elseif unc_3 == 1
        f_parameter.Covariance(1,4) = 3;
    end
    save ('fileData','f_parameter');
    close;
end

% --- Executes on button press in radiobutton_unc1.
function radiobutton_unc1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_unc1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_unc1
set(handles.radiobutton_unc2,'Value',0);
set(handles.radiobutton_unc3,'Value',0);

% --- Executes on button press in radiobutton_unc2.
function radiobutton_unc2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_unc2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_unc2
set(handles.radiobutton_unc1,'Value',0);
set(handles.radiobutton_unc3,'Value',0);

% --- Executes on button press in radiobutton_unc3.
function radiobutton_unc3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_unc3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_unc3
set(handles.radiobutton_unc1,'Value',0);
set(handles.radiobutton_unc2,'Value',0);

% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
%uncertainyt1
text('Interpreter','latex','Units','Normalized','String',... 
    '$$\Sigma$$',...
    'Position',[.474 .938],'FontSize',12,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    '$$\Sigma  = {\Sigma _0} \pm \Delta \Sigma ,{\Sigma _0} = diag({\sigma _{1,0}}, \cdots ,{\sigma _{m,0}})$$',...
    'Position',[.15 .865],'FontSize',12,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    '$$\Delta \Sigma  = diag({\delta _1}{\sigma _{1,0}}, \cdots ,{\delta _m}{\sigma _{m,0}})$$',...
    'Position',[.15 .8],'FontSize',12,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    '$${\delta _i} \sim U(0,0.5),i = 1, \cdots ,m$$',...
    'Position',[.15 .735],'FontSize',12,'Fontname','MS Sans Serif')
%uncertainyt2
text('Interpreter','latex','Units','Normalized','String',... 
    '$$\Sigma  = {\Sigma _0},$$',...
    'Position',[.635 .64],'FontSize',12,'Fontname','MS Sans Serif')
%uncertainyt3
text('Interpreter','latex','Units','Normalized','String',... 
    '$$\Sigma$$',...
    'Position',[.19 .4],'FontSize',12,'Fontname','MS Sans Serif')


% --- Executes during object creation, after setting all properties.
function radiobutton_unc1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to radiobutton_unc1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'Value',1);