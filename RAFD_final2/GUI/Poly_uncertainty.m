function varargout = Poly_uncertainty(varargin)
% POLY_UNCERTAINTY MATLAB code for Poly_uncertainty.fig
%      POLY_UNCERTAINTY, by itself, creates a new POLY_UNCERTAINTY or raises the existing
%      singleton*.
%
%      H = POLY_UNCERTAINTY returns the handle to a new POLY_UNCERTAINTY or the handle to
%      the existing singleton*.
%
%      POLY_UNCERTAINTY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in POLY_UNCERTAINTY.M with the given input arguments.
%
%      POLY_UNCERTAINTY('Property','Value',...) creates a new POLY_UNCERTAINTY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Poly_uncertainty_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Poly_uncertainty_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Poly_uncertainty

% Last Modified by GUIDE v2.5 22-Jun-2017 14:58:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Poly_uncertainty_OpeningFcn, ...
                   'gui_OutputFcn',  @Poly_uncertainty_OutputFcn, ...
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


% --- Executes just before Poly_uncertainty is made visible.
function Poly_uncertainty_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Poly_uncertainty (see VARARGIN)

% Choose default command line output for Poly_uncertainty
handles.output = hObject;
load('fileData.mat');
f_parameter.Uncertainty{1} = zeros(1,7);
save ('fileData','f_parameter'); 
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Poly_uncertainty wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Poly_uncertainty_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
%representation poly
text('Interpreter','latex','Units','Normalized','String',... 
    '$$x(k + 1) = Ax(k) + Bu(k) + {E_d}d(k)$$',...
    'Position',[.15 .95],'FontSize',12,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    '$$y(k) = Cx(k) + Du(k) + F_{d}d(k)$$',...
    'Position',[.2 .89],'FontSize',12,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    '$$A = {A_0} + \sum\limits_{i = 1}^l {{\beta _i}{A_i}} $$',...
    'Position',[.15 .79],'FontSize',12,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    '$$B = {B_0} + \sum\limits_{i = 1}^l {{\beta _i}{B_i}}$$',...
    'Position',[.465 .79],'FontSize',12,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    '$$C = {C_0} + \sum\limits_{i = 1}^l {{\beta _i}{C_i}}$$',...
    'Position',[.8 .79],'FontSize',12,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    '$$D = {D_0} + \sum\limits_{i = 1}^l {{\beta _i}{D_i}}$$',...
    'Position',[.15 .65],'FontSize',12,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    '$$E_d = {E_{d0}} + \sum\limits_{i = 1}^l {{\beta _i}{{E_d}_i}}$$',...
    'Position',[.465 .65],'FontSize',12,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    '$$F_d = {F_{d0}} + \sum\limits_{i = 1}^l {{\beta _i}{{F_d}_i}}$$',...
    'Position',[.78 .65],'FontSize',12,'Fontname','MS Sans Serif')


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
c=questdlg('Do you want to close the toolbox?','Close','Yes','No','Yes');
if strcmp(c,'Yes')
close all;
end

% --- Executes on button press in pushbutton_next.
function pushbutton_next_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_next (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% [get(handles.checkbox_load,'Value') get(handles.checkbox_generate,'Value')]
load('customData.mat');
c_parameter.Choice(3,3:4) = [get(handles.checkbox_load,'Value') get(handles.checkbox_generate,'Value')];
save ('customData','c_parameter');
close(gcf);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcf);
Model_system;


% --- Executes on button press in radiobutton_default.
function radiobutton_default_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_default (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_default
handles=guihandles;
set(handles.radiobutton_default,'value',1);
set(handles.radiobutton_custom,'value',0);
set(handles.radiobutton_norm,'value',0);
set(handles.pushbutton_setunc,'enable','off');

% --- Executes on button press in radiobutton_custom.
function radiobutton_custom_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_custom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_custom
handles=guihandles;
set(handles.radiobutton_default,'value',0);
set(handles.radiobutton_custom,'value',1);
set(handles.radiobutton_norm,'value',0);
set(handles.pushbutton_setunc,'enable','on');

% --- Executes on button press in pushbutton_setunc.
function pushbutton_setunc_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_setunc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in radiobutton_norm.
function radiobutton_norm_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_norm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_norm
handles=guihandles;
set(handles.radiobutton_default,'value',0);
set(handles.radiobutton_custom,'value',0);
set(handles.radiobutton_norm,'value',1);
set(handles.pushbutton_setunc,'enable','off');

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton_edit_norm.
function pushbutton_edit_norm_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_edit_norm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcf);
Uncertainty;
handles=guihandles;
% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcf);


% --- Executes on button press in checkbox_A.
function checkbox_A_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_A (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_A
load('fileData.mat');
if get(hObject,'Value') == 1
    if sum(f_parameter.Uncertainty{1}(1:6))==3
        errordlg('Maximum only 3 can be chosen .','Error');
        set(hObject,'Value',0);
    else
        set(handles.push_A,'Enable','On');
        f_parameter.Uncertainty{1}(1) = 1;
    end
else
    f_parameter.Uncertainty{1}(1) = 0;
    set(handles.push_A,'Enable','Off');
    set(handles.text_A,'Visible','Off');
    f_parameter.Uncertainty{2} = zeros(12,3);
end
save ('fileData','f_parameter'); 

% --- Executes on button press in checkbox_B.
function checkbox_B_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_B
load('fileData.mat');
if get(hObject,'Value') == 1
    if sum(f_parameter.Uncertainty{1}(1:6))==3
        errordlg('Maximum only 3 can be chosen .','Error');
        set(hObject,'Value',0);
    else
        f_parameter.Uncertainty{1}(2) = 1;
        set(handles.push_B,'Enable','On');
    end
else
    f_parameter.Uncertainty{1}(2) = 0;
    set(handles.push_B,'Enable','Off');
    set(handles.text_B,'Visible','Off');
    f_parameter.Uncertainty{3} = zeros(12,3);
end
save ('fileData','f_parameter'); 

% --- Executes on button press in checkbox_C.
function checkbox_C_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_C (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_C
load('fileData.mat');
if get(hObject,'Value') == 1
    if sum(f_parameter.Uncertainty{1}(1:6))==3
        errordlg('Maximum only 3 can be chosen .','Error');
        set(hObject,'Value',0);
    else
        f_parameter.Uncertainty{1}(3) = 1;
        set(handles.push_C,'Enable','On');
    end
else
    f_parameter.Uncertainty{1}(3) = 0;
    set(handles.push_C,'Enable','Off');
    set(handles.text_C,'Visible','Off');
    f_parameter.Uncertainty{4} = zeros(12,3);
end
save ('fileData','f_parameter'); 

% --- Executes on button press in checkbox_Ed.
function checkbox_Ed_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_Ed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_Ed
load('fileData.mat');
if get(hObject,'Value') == 1
    if sum(f_parameter.Uncertainty{1}(1:6))==3
        errordlg('Maximum only 3 can be chosen .','Error');
        set(hObject,'Value',0);
    else
        f_parameter.Uncertainty{1}(5) = 1;
        set(handles.push_Ed,'Enable','On');
    end
else
    f_parameter.Uncertainty{1}(5) = 0;
    set(handles.push_Ed,'Enable','Off');
    set(handles.text_E,'Visible','Off');
    f_parameter.Uncertainty{6} = zeros(12,3);
end
save ('fileData','f_parameter'); 

% --- Executes on button press in checkbox_Fd.
function checkbox_Fd_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_Fd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_Fd
load('fileData.mat');
if get(hObject,'Value') == 1
    if sum(f_parameter.Uncertainty{1}(1:6))==3
        errordlg('Maximum only 3 can be chosen .','Error');
        set(hObject,'Value',0);
    else
        f_parameter.Uncertainty{1}(6) = 1;
        set(handles.push_Fd,'Enable','On');
    end
else
    f_parameter.Uncertainty{1}(6) = 0;
    set(handles.push_Fd,'Enable','On');
    set(handles.text_F,'Visible','Off');
    f_parameter.Uncertainty{7} = zeros(12,3);
end
save ('fileData','f_parameter'); 


% --- Executes on button press in checkbox_l1.
function checkbox_l1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_l1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_l1
load('fileData.mat');
if get(hObject,'Value') == 1
    set(handles.checkbox_l2,'Value',0);    
    set(handles.checkbox_l3,'Value',0); 
    set(handles.checkbox_l4,'Value',0);
    f_parameter.Uncertainty{1}(7) = 1;

else
    f_parameter.Uncertainty{1}(7) = 0;
end
save ('fileData','f_parameter'); 

% --- Executes on button press in checkbox_l2.
function checkbox_l2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_l2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_l2
load('fileData.mat');
if get(hObject,'Value') == 1
    set(handles.checkbox_l1,'Value',0);    
    set(handles.checkbox_l3,'Value',0); 
    set(handles.checkbox_l4,'Value',0);
    f_parameter.Uncertainty{1}(7) = 2;

else
    f_parameter.Uncertainty{1}(7) = 0;
end
save ('fileData','f_parameter'); 
% --- Executes on button press in checkbox_l3.
function checkbox_l3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_l3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_l3
load('fileData.mat');
if get(hObject,'Value') == 1
    set(handles.checkbox_l2,'Value',0);    
    set(handles.checkbox_l1,'Value',0); 
    set(handles.checkbox_l4,'Value',0);
    f_parameter.Uncertainty{1}(7) = 3;

else
    f_parameter.Uncertainty{1}(7) = 0;
end
save ('fileData','f_parameter'); 


% --- Executes on button press in push_A.
function push_A_Callback(hObject, eventdata, handles)
% hObject    handle to push_A (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Poly_mat
load('fileData.mat');

load('customData.mat');
% if the custom use GUI to generate system model
if c_parameter.Choice(1,2)==1 
   dim_state=f_parameter.Sys_dim(1);
% if the custom load system model    
elseif c_parameter.Choice(1,1)==1
   dim_state=size(c_parameter.Process_model{1},1);    
end

if dim_state > 3
   errordlg('Beyond dimension! Please use the load polytopic uncertainty function.','Error');
   set(handles.checkbox_load,'Value',0);
elseif f_parameter.Uncertainty{1}(7) == 0
    errordlg('Please give value on l .','Error');
else
    Poly_mat = 1;
    Poly_matrix;
    handles=guihandles;
    switch dim_state
        case 1
            % a1
            set(handles.edit11,'Enable','On');
            % a2
            set(handles.edit41,'Enable','On');
            % a3
            set(handles.edit71,'Enable','On');
            % a4
            set(handles.edit101,'Enable','On');
        case 2
            % a1
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit22,'Enable','On');
            % a2
            set(handles.edit41,'Enable','On');
            set(handles.edit42,'Enable','On');
            set(handles.edit51,'Enable','On');
            set(handles.edit52,'Enable','On');
            % a3
            set(handles.edit71,'Enable','On');
            set(handles.edit72,'Enable','On');
            set(handles.edit81,'Enable','On');
            set(handles.edit82,'Enable','On');
            % a4
            set(handles.edit101,'Enable','On');
            set(handles.edit102,'Enable','On');
            set(handles.edit111,'Enable','On');
            set(handles.edit112,'Enable','On');
        case 3
            % a1
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit13,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit22,'Enable','On');
            set(handles.edit23,'Enable','On');
            set(handles.edit31,'Enable','On');
            set(handles.edit32,'Enable','On');
            set(handles.edit33,'Enable','On');
            % a2
            set(handles.edit41,'Enable','On');
            set(handles.edit42,'Enable','On');
            set(handles.edit43,'Enable','On');
            set(handles.edit51,'Enable','On');
            set(handles.edit52,'Enable','On');
            set(handles.edit53,'Enable','On');
            set(handles.edit61,'Enable','On');
            set(handles.edit62,'Enable','On');
            set(handles.edit63,'Enable','On');
            % a3
            set(handles.edit71,'Enable','On');
            set(handles.edit72,'Enable','On');
            set(handles.edit73,'Enable','On');
            set(handles.edit81,'Enable','On');
            set(handles.edit82,'Enable','On');
            set(handles.edit83,'Enable','On');
            set(handles.edit91,'Enable','On');
            set(handles.edit92,'Enable','On');
            set(handles.edit93,'Enable','On');
            % a4
            set(handles.edit101,'Enable','On');
            set(handles.edit102,'Enable','On');
            set(handles.edit103,'Enable','On');
            set(handles.edit111,'Enable','On');
            set(handles.edit112,'Enable','On');
            set(handles.edit113,'Enable','On');
            set(handles.edit121,'Enable','On');
            set(handles.edit122,'Enable','On');
            set(handles.edit123,'Enable','On');
    end
    
    switch f_parameter.Uncertainty{1}(7)
        case 1
            % a2
            set(handles.edit41,'Enable','Off');
            set(handles.edit42,'Enable','Off');
            set(handles.edit43,'Enable','Off');
            set(handles.edit51,'Enable','Off');
            set(handles.edit52,'Enable','Off');
            set(handles.edit53,'Enable','Off');
            set(handles.edit61,'Enable','Off');
            set(handles.edit62,'Enable','Off');
            set(handles.edit63,'Enable','Off');
            % a3
            set(handles.edit71,'Enable','Off');
            set(handles.edit72,'Enable','Off');
            set(handles.edit73,'Enable','Off');
            set(handles.edit81,'Enable','Off');
            set(handles.edit82,'Enable','Off');
            set(handles.edit83,'Enable','Off');
            set(handles.edit91,'Enable','Off');
            set(handles.edit92,'Enable','Off');
            set(handles.edit93,'Enable','Off');
            % a4
            set(handles.edit101,'Enable','Off');
            set(handles.edit102,'Enable','Off');
            set(handles.edit103,'Enable','Off');
            set(handles.edit111,'Enable','Off');
            set(handles.edit112,'Enable','Off');
            set(handles.edit113,'Enable','Off');
            set(handles.edit121,'Enable','Off');
            set(handles.edit122,'Enable','Off');
            set(handles.edit123,'Enable','Off');
        case 2
            % a3
            set(handles.edit71,'Enable','Off');
            set(handles.edit72,'Enable','Off');
            set(handles.edit73,'Enable','Off');
            set(handles.edit81,'Enable','Off');
            set(handles.edit82,'Enable','Off');
            set(handles.edit83,'Enable','Off');
            set(handles.edit91,'Enable','Off');
            set(handles.edit92,'Enable','Off');
            set(handles.edit93,'Enable','Off');    
            % a4
            set(handles.edit101,'Enable','Off');
            set(handles.edit102,'Enable','Off');
            set(handles.edit103,'Enable','Off');
            set(handles.edit111,'Enable','Off');
            set(handles.edit112,'Enable','Off');
            set(handles.edit113,'Enable','Off');
            set(handles.edit121,'Enable','Off');
            set(handles.edit122,'Enable','Off');
            set(handles.edit123,'Enable','Off');
        case 3
            % a4
            set(handles.edit101,'Enable','Off');
            set(handles.edit102,'Enable','Off');
            set(handles.edit103,'Enable','Off');
            set(handles.edit111,'Enable','Off');
            set(handles.edit112,'Enable','Off');
            set(handles.edit113,'Enable','Off');
            set(handles.edit121,'Enable','Off');
            set(handles.edit122,'Enable','Off');
            set(handles.edit123,'Enable','Off');
    end
    set(handles.text1,'String','A1  =');
    set(handles.text3,'String','A2  =');
    set(handles.text4,'String','A3  =');
    set(handles.text5,'String','A4  =');
end


% --- Executes on button press in push_B.
function push_B_Callback(hObject, eventdata, handles)
% hObject    handle to push_B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Poly_mat
load('fileData.mat');

load('customData.mat');
% if the custom use GUI to generate system model
if c_parameter.Choice(1,2)==1 
   dim_state=f_parameter.Sys_dim(1);
   dim_input=f_parameter.Sys_dim(2);

% if the custom load system model    
elseif c_parameter.Choice(1,1)==1
   dim_state=size(c_parameter.Process_model{1},1); 
   dim_input=size(c_parameter.Process_model{2},2);  
end

if dim_state > 3 || dim_input>3
   errordlg('Beyond dimension! Please use the load polytopic uncertainty function.','Error');
   set(handles.checkbox_load,'Value',0);
elseif f_parameter.Uncertainty{1}(7) == 0
    errordlg('Please give value on l .','Error');
else
    Poly_mat = 2;
    Poly_matrix;
    handles=guihandles;
    if [dim_state dim_input] == [1 1]
            % b1
            set(handles.edit11,'Enable','On');
            % b2
            set(handles.edit41,'Enable','On');
            % b3
            set(handles.edit71,'Enable','On');
            % b4
            set(handles.edit101,'Enable','On');
            
    elseif [dim_state dim_input] == [1 2]
            % a1
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            % a2
            set(handles.edit41,'Enable','On');
            set(handles.edit42,'Enable','On');
            % a3
            set(handles.edit71,'Enable','On');
            set(handles.edit72,'Enable','On');
            % a4
            set(handles.edit101,'Enable','On');
            set(handles.edit102,'Enable','On');
    elseif [dim_state dim_input] == [1 3]
            % a1
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit13,'Enable','On');
            % a2
            set(handles.edit41,'Enable','On');
            set(handles.edit42,'Enable','On');
            set(handles.edit43,'Enable','On');
            % a3
            set(handles.edit71,'Enable','On');
            set(handles.edit72,'Enable','On');
            set(handles.edit73,'Enable','On');
            % a4
            set(handles.edit101,'Enable','On');
            set(handles.edit102,'Enable','On');
            set(handles.edit103,'Enable','On');
    elseif [dim_state dim_input] == [2 1]    
            % a1
            set(handles.edit11,'Enable','On');
            set(handles.edit21,'Enable','On');
            % a2
            set(handles.edit41,'Enable','On');
            set(handles.edit51,'Enable','On');
            % a3
            set(handles.edit71,'Enable','On');
            set(handles.edit81,'Enable','On');
            % a3
            set(handles.edit101,'Enable','On');
            set(handles.edit111,'Enable','On');
    elseif [dim_state dim_input] == [2 2]     
            % a1
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit22,'Enable','On');
            % a2
            set(handles.edit41,'Enable','On');
            set(handles.edit42,'Enable','On');
            set(handles.edit51,'Enable','On');
            set(handles.edit52,'Enable','On');
            % a3
            set(handles.edit71,'Enable','On');
            set(handles.edit72,'Enable','On');
            set(handles.edit81,'Enable','On');
            set(handles.edit82,'Enable','On');
            % a4
            set(handles.edit101,'Enable','On');
            set(handles.edit102,'Enable','On');
            set(handles.edit111,'Enable','On');
            set(handles.edit112,'Enable','On');
    elseif [dim_state dim_input] == [2 3]     
            % a1
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit13,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit22,'Enable','On');
            set(handles.edit23,'Enable','On');
            % a2
            set(handles.edit41,'Enable','On');
            set(handles.edit42,'Enable','On');
            set(handles.edit43,'Enable','On');
            set(handles.edit51,'Enable','On');
            set(handles.edit52,'Enable','On');
            set(handles.edit53,'Enable','On');
            % a3
            set(handles.edit71,'Enable','On');
            set(handles.edit72,'Enable','On');
            set(handles.edit73,'Enable','On');
            set(handles.edit81,'Enable','On');
            set(handles.edit82,'Enable','On');
            set(handles.edit83,'Enable','On');
            % a4
            set(handles.edit101,'Enable','On');
            set(handles.edit102,'Enable','On');
            set(handles.edit103,'Enable','On');
            set(handles.edit111,'Enable','On');
            set(handles.edit112,'Enable','On');
            set(handles.edit113,'Enable','On');
    elseif [dim_state dim_input] == [3 1]         
            % a1
            set(handles.edit11,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit31,'Enable','On');
            % a2
            set(handles.edit41,'Enable','On');
            set(handles.edit51,'Enable','On');
            set(handles.edit61,'Enable','On');
            % a3
            set(handles.edit71,'Enable','On');
            set(handles.edit81,'Enable','On');
            set(handles.edit91,'Enable','On');
            % a4
            set(handles.edit101,'Enable','On');
            set(handles.edit111,'Enable','On');
            set(handles.edit121,'Enable','On');
    elseif [dim_state dim_input] == [3 2]       
            % a1
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit22,'Enable','On');
            set(handles.edit31,'Enable','On');
            set(handles.edit32,'Enable','On');
            % a2
            set(handles.edit41,'Enable','On');
            set(handles.edit42,'Enable','On');
            set(handles.edit51,'Enable','On');
            set(handles.edit52,'Enable','On');
            set(handles.edit61,'Enable','On');
            set(handles.edit62,'Enable','On');
            % a3
            set(handles.edit71,'Enable','On');
            set(handles.edit72,'Enable','On');
            set(handles.edit81,'Enable','On');
            set(handles.edit82,'Enable','On');
            set(handles.edit91,'Enable','On');
            set(handles.edit92,'Enable','On');
            % a4
            set(handles.edit101,'Enable','On');
            set(handles.edit102,'Enable','On');
            set(handles.edit111,'Enable','On');
            set(handles.edit112,'Enable','On');
            set(handles.edit121,'Enable','On');
            set(handles.edit122,'Enable','On');
    elseif [dim_state dim_input] == [3 3]       
            % a1
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit13,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit22,'Enable','On');
            set(handles.edit23,'Enable','On');
            set(handles.edit31,'Enable','On');
            set(handles.edit32,'Enable','On');
            set(handles.edit33,'Enable','On');
            % a2
            set(handles.edit41,'Enable','On');
            set(handles.edit42,'Enable','On');
            set(handles.edit43,'Enable','On');
            set(handles.edit51,'Enable','On');
            set(handles.edit52,'Enable','On');
            set(handles.edit53,'Enable','On');
            set(handles.edit61,'Enable','On');
            set(handles.edit62,'Enable','On');
            set(handles.edit63,'Enable','On');
            % a3
            set(handles.edit71,'Enable','On');
            set(handles.edit72,'Enable','On');
            set(handles.edit73,'Enable','On');
            set(handles.edit81,'Enable','On');
            set(handles.edit82,'Enable','On');
            set(handles.edit83,'Enable','On');
            set(handles.edit91,'Enable','On');
            set(handles.edit92,'Enable','On');
            set(handles.edit93,'Enable','On');
            % a4
            set(handles.edit101,'Enable','On');
            set(handles.edit102,'Enable','On');
            set(handles.edit103,'Enable','On');
            set(handles.edit111,'Enable','On');
            set(handles.edit112,'Enable','On');
            set(handles.edit113,'Enable','On');
            set(handles.edit121,'Enable','On');
            set(handles.edit122,'Enable','On');
            set(handles.edit123,'Enable','On');
    end
    
    switch f_parameter.Uncertainty{1}(7)
        case 1
            % a2
            set(handles.edit41,'Enable','Off');
            set(handles.edit42,'Enable','Off');
            set(handles.edit43,'Enable','Off');
            set(handles.edit51,'Enable','Off');
            set(handles.edit52,'Enable','Off');
            set(handles.edit53,'Enable','Off');
            set(handles.edit61,'Enable','Off');
            set(handles.edit62,'Enable','Off');
            set(handles.edit63,'Enable','Off');
            % a3
            set(handles.edit71,'Enable','Off');
            set(handles.edit72,'Enable','Off');
            set(handles.edit73,'Enable','Off');
            set(handles.edit81,'Enable','Off');
            set(handles.edit82,'Enable','Off');
            set(handles.edit83,'Enable','Off');
            set(handles.edit91,'Enable','Off');
            set(handles.edit92,'Enable','Off');
            set(handles.edit93,'Enable','Off');
            % a4
            set(handles.edit101,'Enable','Off');
            set(handles.edit102,'Enable','Off');
            set(handles.edit103,'Enable','Off');
            set(handles.edit111,'Enable','Off');
            set(handles.edit112,'Enable','Off');
            set(handles.edit113,'Enable','Off');
            set(handles.edit121,'Enable','Off');
            set(handles.edit122,'Enable','Off');
            set(handles.edit123,'Enable','Off');
        case 2
            % a3
            set(handles.edit71,'Enable','Off');
            set(handles.edit72,'Enable','Off');
            set(handles.edit73,'Enable','Off');
            set(handles.edit81,'Enable','Off');
            set(handles.edit82,'Enable','Off');
            set(handles.edit83,'Enable','Off');
            set(handles.edit91,'Enable','Off');
            set(handles.edit92,'Enable','Off');
            set(handles.edit93,'Enable','Off');    
            % a4
            set(handles.edit101,'Enable','Off');
            set(handles.edit102,'Enable','Off');
            set(handles.edit103,'Enable','Off');
            set(handles.edit111,'Enable','Off');
            set(handles.edit112,'Enable','Off');
            set(handles.edit113,'Enable','Off');
            set(handles.edit121,'Enable','Off');
            set(handles.edit122,'Enable','Off');
            set(handles.edit123,'Enable','Off');
        case 3
            % a4
            set(handles.edit101,'Enable','Off');
            set(handles.edit102,'Enable','Off');
            set(handles.edit103,'Enable','Off');
            set(handles.edit111,'Enable','Off');
            set(handles.edit112,'Enable','Off');
            set(handles.edit113,'Enable','Off');
            set(handles.edit121,'Enable','Off');
            set(handles.edit122,'Enable','Off');
            set(handles.edit123,'Enable','Off');
    end
    set(handles.text1,'String','B1  =');
    set(handles.text3,'String','B2  =');
    set(handles.text4,'String','B3  =');
    set(handles.text5,'String','B4  =');
end 

% --- Executes on button press in push_C.
function push_C_Callback(hObject, eventdata, handles)
% hObject    handle to push_C (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Poly_mat
load('fileData.mat');
load('customData.mat');

% if the custom use GUI to generate system model
if c_parameter.Choice(1,2)==1 
   dim_state=f_parameter.Sys_dim(1);
   dim_output=f_parameter.Sys_dim(3);
   
% if the custom load system model    
elseif c_parameter.Choice(1,1)==1
   dim_state=size(c_parameter.Process_model{1},1);   
   dim_output=size(c_parameter.Process_model{3},1);  
end

if dim_state > 3 || dim_output>3
   errordlg('Beyond dimension! Please use the load polytopic uncertainty function.','Error');
   set(handles.checkbox_load,'Value',0);
elseif f_parameter.Uncertainty{1}(7) == 0
    errordlg('Please give value on l .','Error');
else
    Poly_mat = 3;
    Poly_matrix;
    handles=guihandles;
    if [dim_state dim_output] == [1 1]
            % a1
            set(handles.edit11,'Enable','On');
            % a2
            set(handles.edit41,'Enable','On');
            % a3
            set(handles.edit71,'Enable','On');
            % a4
            set(handles.edit101,'Enable','On');
    elseif [dim_state dim_output] == [1 2]    
            % a1
            set(handles.edit11,'Enable','On');
            set(handles.edit21,'Enable','On');
            % a2
            set(handles.edit41,'Enable','On');
            set(handles.edit51,'Enable','On');
            % a3
            set(handles.edit71,'Enable','On');
            set(handles.edit81,'Enable','On');
            % a4
            set(handles.edit101,'Enable','On');
            set(handles.edit111,'Enable','On');    
    elseif [dim_state dim_output] == [1 3]    
            % a1
            set(handles.edit11,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit31,'Enable','On');
            % a2
            set(handles.edit41,'Enable','On');
            set(handles.edit51,'Enable','On');
            set(handles.edit61,'Enable','On');
            % a3
            set(handles.edit71,'Enable','On');
            set(handles.edit81,'Enable','On');
            set(handles.edit91,'Enable','On');
            % a4
            set(handles.edit101,'Enable','On');
            set(handles.edit111,'Enable','On'); 
            set(handles.edit121,'Enable','On');
    elseif [dim_state dim_output] == [2 1]
            % a1
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            % a2
            set(handles.edit41,'Enable','On');
            set(handles.edit42,'Enable','On');
            % a3
            set(handles.edit71,'Enable','On');
            set(handles.edit72,'Enable','On');
            % a4
            set(handles.edit101,'Enable','On');
            set(handles.edit102,'Enable','On');
    
    
    elseif [dim_state dim_output] == [2 2]     
            % a1
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit22,'Enable','On');
            % a2
            set(handles.edit41,'Enable','On');
            set(handles.edit42,'Enable','On');
            set(handles.edit51,'Enable','On');
            set(handles.edit52,'Enable','On');
            % a3
            set(handles.edit71,'Enable','On');
            set(handles.edit72,'Enable','On');
            set(handles.edit81,'Enable','On');
            set(handles.edit82,'Enable','On');
            % a4
            set(handles.edit101,'Enable','On');
            set(handles.edit102,'Enable','On');
            set(handles.edit111,'Enable','On');
            set(handles.edit112,'Enable','On');
    elseif [dim_state dim_output] == [2 3]     
            % a1
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit22,'Enable','On');
            set(handles.edit31,'Enable','On');
            set(handles.edit32,'Enable','On');
            % a2
            set(handles.edit41,'Enable','On');
            set(handles.edit42,'Enable','On');
            set(handles.edit51,'Enable','On');
            set(handles.edit52,'Enable','On');
            set(handles.edit61,'Enable','On');
            set(handles.edit62,'Enable','On');
            % a3
            set(handles.edit71,'Enable','On');
            set(handles.edit72,'Enable','On');
            set(handles.edit81,'Enable','On');
            set(handles.edit82,'Enable','On');
            set(handles.edit91,'Enable','On');
            set(handles.edit92,'Enable','On');
            % a4
            set(handles.edit101,'Enable','On');
            set(handles.edit102,'Enable','On');
            set(handles.edit111,'Enable','On');
            set(handles.edit112,'Enable','On');
            set(handles.edit121,'Enable','On');
            set(handles.edit122,'Enable','On');
    elseif [dim_state dim_output] == [3 1]         
            % a1
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit13,'Enable','On');
            % a2
            set(handles.edit41,'Enable','On');
            set(handles.edit42,'Enable','On');
            set(handles.edit43,'Enable','On');
            % a3
            set(handles.edit71,'Enable','On');
            set(handles.edit72,'Enable','On');
            set(handles.edit73,'Enable','On');
            % a4
            set(handles.edit101,'Enable','On');
            set(handles.edit102,'Enable','On');
            set(handles.edit103,'Enable','On');
    elseif [dim_state dim_output] == [3 2]       
            % a1
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit22,'Enable','On');
            set(handles.edit13,'Enable','On');
            set(handles.edit23,'Enable','On');
            % a2
            set(handles.edit41,'Enable','On');
            set(handles.edit42,'Enable','On');
            set(handles.edit51,'Enable','On');
            set(handles.edit52,'Enable','On');
            set(handles.edit43,'Enable','On');
            set(handles.edit53,'Enable','On');
            % a3
            set(handles.edit71,'Enable','On');
            set(handles.edit72,'Enable','On');
            set(handles.edit81,'Enable','On');
            set(handles.edit82,'Enable','On');
            set(handles.edit73,'Enable','On');
            set(handles.edit83,'Enable','On');
            % a4
            set(handles.edit101,'Enable','On');
            set(handles.edit102,'Enable','On');
            set(handles.edit111,'Enable','On');
            set(handles.edit112,'Enable','On');
            set(handles.edit103,'Enable','On');
            set(handles.edit113,'Enable','On');
    elseif [dim_state dim_output] == [3 3]       
            % a1
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit13,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit22,'Enable','On');
            set(handles.edit23,'Enable','On');
            set(handles.edit31,'Enable','On');
            set(handles.edit32,'Enable','On');
            set(handles.edit33,'Enable','On');
            % a2
            set(handles.edit41,'Enable','On');
            set(handles.edit42,'Enable','On');
            set(handles.edit43,'Enable','On');
            set(handles.edit51,'Enable','On');
            set(handles.edit52,'Enable','On');
            set(handles.edit53,'Enable','On');
            set(handles.edit61,'Enable','On');
            set(handles.edit62,'Enable','On');
            set(handles.edit63,'Enable','On');
            % a3
            set(handles.edit71,'Enable','On');
            set(handles.edit72,'Enable','On');
            set(handles.edit73,'Enable','On');
            set(handles.edit81,'Enable','On');
            set(handles.edit82,'Enable','On');
            set(handles.edit83,'Enable','On');
            set(handles.edit91,'Enable','On');
            set(handles.edit92,'Enable','On');
            set(handles.edit93,'Enable','On');
            % a4
            set(handles.edit101,'Enable','On');
            set(handles.edit102,'Enable','On');
            set(handles.edit103,'Enable','On');
            set(handles.edit111,'Enable','On');
            set(handles.edit112,'Enable','On');
            set(handles.edit113,'Enable','On');
            set(handles.edit121,'Enable','On');
            set(handles.edit122,'Enable','On');
            set(handles.edit123,'Enable','On');
    end
    
    switch f_parameter.Uncertainty{1}(7)
        case 1
            % a2
            set(handles.edit41,'Enable','Off');
            set(handles.edit42,'Enable','Off');
            set(handles.edit43,'Enable','Off');
            set(handles.edit51,'Enable','Off');
            set(handles.edit52,'Enable','Off');
            set(handles.edit53,'Enable','Off');
            set(handles.edit61,'Enable','Off');
            set(handles.edit62,'Enable','Off');
            set(handles.edit63,'Enable','Off');
            % a3
            set(handles.edit71,'Enable','Off');
            set(handles.edit72,'Enable','Off');
            set(handles.edit73,'Enable','Off');
            set(handles.edit81,'Enable','Off');
            set(handles.edit82,'Enable','Off');
            set(handles.edit83,'Enable','Off');
            set(handles.edit91,'Enable','Off');
            set(handles.edit92,'Enable','Off');
            set(handles.edit93,'Enable','Off');
            % a4
            set(handles.edit101,'Enable','Off');
            set(handles.edit102,'Enable','Off');
            set(handles.edit103,'Enable','Off');
            set(handles.edit111,'Enable','Off');
            set(handles.edit112,'Enable','Off');
            set(handles.edit113,'Enable','Off');
            set(handles.edit121,'Enable','Off');
            set(handles.edit122,'Enable','Off');
            set(handles.edit123,'Enable','Off');
        case 2
            % a3
            set(handles.edit71,'Enable','Off');
            set(handles.edit72,'Enable','Off');
            set(handles.edit73,'Enable','Off');
            set(handles.edit81,'Enable','Off');
            set(handles.edit82,'Enable','Off');
            set(handles.edit83,'Enable','Off');
            set(handles.edit91,'Enable','Off');
            set(handles.edit92,'Enable','Off');
            set(handles.edit93,'Enable','Off');  
            % a4
            set(handles.edit101,'Enable','Off');
            set(handles.edit102,'Enable','Off');
            set(handles.edit103,'Enable','Off');
            set(handles.edit111,'Enable','Off');
            set(handles.edit112,'Enable','Off');
            set(handles.edit113,'Enable','Off');
            set(handles.edit121,'Enable','Off');
            set(handles.edit122,'Enable','Off');
            set(handles.edit123,'Enable','Off');
        case 3
            % a4
            set(handles.edit101,'Enable','Off');
            set(handles.edit102,'Enable','Off');
            set(handles.edit103,'Enable','Off');
            set(handles.edit111,'Enable','Off');
            set(handles.edit112,'Enable','Off');
            set(handles.edit113,'Enable','Off');
            set(handles.edit121,'Enable','Off');
            set(handles.edit122,'Enable','Off');
            set(handles.edit123,'Enable','Off');
    end
    set(handles.text1,'String','C1  =');
    set(handles.text3,'String','C2  =');
    set(handles.text4,'String','C3  =');
    set(handles.text5,'String','C4  =');
end 

% --- Executes on button press in push_Ed.
function push_Ed_Callback(hObject, eventdata, handles)
% hObject    handle to push_Ed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Poly_mat
load('fileData.mat');


load('customData.mat');
% if the custom use GUI to generate system model
if c_parameter.Choice(1,2)==1 
   dim_state=f_parameter.Sys_dim(1);
   dim_disturbance=f_parameter.Sys_dim(4);
% if the custom load system model    
elseif c_parameter.Choice(1,1)==1
   dim_state=size(c_parameter.Process_model{1},1);  
   if isempty(c_parameter.Process_model{5})==1 % if Ed is empty
      errordlg('There is no ''Ed'' matrix','Error');
      set(handles.checkbox_load,'Value',0);
   else
      dim_disturbance=size(c_parameter.Process_model{5},2);  
   end
end

if dim_state > 3 || dim_disturbance>3
   errordlg('Beyond dimension! Please use the load polytopic uncertainty function.','Error');
   set(handles.checkbox_load,'Value',0);
elseif f_parameter.Uncertainty{1}(7) == 0
    errordlg('Please give value on l .','Error');
else
    Poly_mat = 5;
    Poly_matrix;
    handles=guihandles;
    if [dim_state dim_disturbance] == [1 1]
            % a1
            set(handles.edit11,'Enable','On');
            % a2
            set(handles.edit41,'Enable','On');
            % a3
            set(handles.edit71,'Enable','On');
            % a4
            set(handles.edit101,'Enable','On');
            
    elseif [dim_state dim_disturbance] == [1 2]
            % a1
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            % a2
            set(handles.edit41,'Enable','On');
            set(handles.edit42,'Enable','On');
            % a3
            set(handles.edit71,'Enable','On');
            set(handles.edit72,'Enable','On');
            % a4
            set(handles.edit101,'Enable','On');
            set(handles.edit102,'Enable','On');
    elseif [dim_state dim_disturbance] == [1 3]
            % a1
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit13,'Enable','On');
            % a2
            set(handles.edit41,'Enable','On');
            set(handles.edit42,'Enable','On');
            set(handles.edit43,'Enable','On');
            % a3
            set(handles.edit71,'Enable','On');
            set(handles.edit72,'Enable','On');
            set(handles.edit73,'Enable','On');
            % a4
            set(handles.edit101,'Enable','On');
            set(handles.edit102,'Enable','On');
            set(handles.edit103,'Enable','On');
    elseif [dim_state dim_disturbance] == [2 1]    
            % a1
            set(handles.edit11,'Enable','On');
            set(handles.edit21,'Enable','On');
            % a2
            set(handles.edit41,'Enable','On');
            set(handles.edit51,'Enable','On');
            % a3
            set(handles.edit71,'Enable','On');
            set(handles.edit81,'Enable','On');
            % a4
            set(handles.edit101,'Enable','On');
            set(handles.edit111,'Enable','On');
    elseif [dim_state dim_disturbance] == [2 2]     
            % a1
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit22,'Enable','On');
            % a2
            set(handles.edit41,'Enable','On');
            set(handles.edit42,'Enable','On');
            set(handles.edit51,'Enable','On');
            set(handles.edit52,'Enable','On');
            % a3
            set(handles.edit71,'Enable','On');
            set(handles.edit72,'Enable','On');
            set(handles.edit81,'Enable','On');
            set(handles.edit82,'Enable','On');
            % a4
            set(handles.edit101,'Enable','On');
            set(handles.edit102,'Enable','On');
            set(handles.edit111,'Enable','On');
            set(handles.edit112,'Enable','On');
    elseif [dim_state dim_disturbance] == [2 3]     
            % a1
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit13,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit22,'Enable','On');
            set(handles.edit23,'Enable','On');
            % a2
            set(handles.edit41,'Enable','On');
            set(handles.edit42,'Enable','On');
            set(handles.edit43,'Enable','On');
            set(handles.edit51,'Enable','On');
            set(handles.edit52,'Enable','On');
            set(handles.edit53,'Enable','On');
            % a3
            set(handles.edit71,'Enable','On');
            set(handles.edit72,'Enable','On');
            set(handles.edit73,'Enable','On');
            set(handles.edit81,'Enable','On');
            set(handles.edit82,'Enable','On');
            set(handles.edit83,'Enable','On');
            % a4
            set(handles.edit101,'Enable','On');
            set(handles.edit102,'Enable','On');
            set(handles.edit103,'Enable','On');
            set(handles.edit111,'Enable','On');
            set(handles.edit112,'Enable','On');
            set(handles.edit113,'Enable','On');
    elseif [dim_state dim_disturbance] == [3 1]         
            % a1
            set(handles.edit11,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit31,'Enable','On');
            % a2
            set(handles.edit41,'Enable','On');
            set(handles.edit51,'Enable','On');
            set(handles.edit61,'Enable','On');
            % a3
            set(handles.edit71,'Enable','On');
            set(handles.edit81,'Enable','On');
            set(handles.edit91,'Enable','On');
            % a4
            set(handles.edit101,'Enable','On');
            set(handles.edit111,'Enable','On');
            set(handles.edit121,'Enable','On');
    elseif [dim_state dim_disturbance] == [3 2]       
            % a1
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit22,'Enable','On');
            set(handles.edit31,'Enable','On');
            set(handles.edit32,'Enable','On');
            % a2
            set(handles.edit41,'Enable','On');
            set(handles.edit42,'Enable','On');
            set(handles.edit51,'Enable','On');
            set(handles.edit52,'Enable','On');
            set(handles.edit61,'Enable','On');
            set(handles.edit62,'Enable','On');
            % a3
            set(handles.edit71,'Enable','On');
            set(handles.edit72,'Enable','On');
            set(handles.edit81,'Enable','On');
            set(handles.edit82,'Enable','On');
            set(handles.edit91,'Enable','On');
            set(handles.edit92,'Enable','On');
            % a4
            set(handles.edit101,'Enable','On');
            set(handles.edit102,'Enable','On');
            set(handles.edit111,'Enable','On');
            set(handles.edit112,'Enable','On');
            set(handles.edit121,'Enable','On');
            set(handles.edit122,'Enable','On');
    elseif [dim_state dim_disturbance] == [3 3]          
            % a1
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit13,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit22,'Enable','On');
            set(handles.edit23,'Enable','On');
            set(handles.edit31,'Enable','On');
            set(handles.edit32,'Enable','On');
            set(handles.edit33,'Enable','On');
            % a2
            set(handles.edit41,'Enable','On');
            set(handles.edit42,'Enable','On');
            set(handles.edit43,'Enable','On');
            set(handles.edit51,'Enable','On');
            set(handles.edit52,'Enable','On');
            set(handles.edit53,'Enable','On');
            set(handles.edit61,'Enable','On');
            set(handles.edit62,'Enable','On');
            set(handles.edit63,'Enable','On');
            % a3
            set(handles.edit71,'Enable','On');
            set(handles.edit72,'Enable','On');
            set(handles.edit73,'Enable','On');
            set(handles.edit81,'Enable','On');
            set(handles.edit82,'Enable','On');
            set(handles.edit83,'Enable','On');
            set(handles.edit91,'Enable','On');
            set(handles.edit92,'Enable','On');
            set(handles.edit93,'Enable','On');
            % a4
            set(handles.edit101,'Enable','On');
            set(handles.edit102,'Enable','On');
            set(handles.edit103,'Enable','On');
            set(handles.edit111,'Enable','On');
            set(handles.edit112,'Enable','On');
            set(handles.edit113,'Enable','On');
            set(handles.edit121,'Enable','On');
            set(handles.edit122,'Enable','On');
            set(handles.edit123,'Enable','On');
    end
    
    switch f_parameter.Uncertainty{1}(7)
        case 1
            % a2
            set(handles.edit41,'Enable','Off');
            set(handles.edit42,'Enable','Off');
            set(handles.edit43,'Enable','Off');
            set(handles.edit51,'Enable','Off');
            set(handles.edit52,'Enable','Off');
            set(handles.edit53,'Enable','Off');
            set(handles.edit61,'Enable','Off');
            set(handles.edit62,'Enable','Off');
            set(handles.edit63,'Enable','Off');
            % a3
            set(handles.edit71,'Enable','Off');
            set(handles.edit72,'Enable','Off');
            set(handles.edit73,'Enable','Off');
            set(handles.edit81,'Enable','Off');
            set(handles.edit82,'Enable','Off');
            set(handles.edit83,'Enable','Off');
            set(handles.edit91,'Enable','Off');
            set(handles.edit92,'Enable','Off');
            set(handles.edit93,'Enable','Off');
            % a4
            set(handles.edit101,'Enable','Off');
            set(handles.edit102,'Enable','Off');
            set(handles.edit103,'Enable','Off');
            set(handles.edit111,'Enable','Off');
            set(handles.edit112,'Enable','Off');
            set(handles.edit113,'Enable','Off');
            set(handles.edit121,'Enable','Off');
            set(handles.edit122,'Enable','Off');
            set(handles.edit123,'Enable','Off');
        case 2
            % a3
            set(handles.edit71,'Enable','Off');
            set(handles.edit72,'Enable','Off');
            set(handles.edit73,'Enable','Off');
            set(handles.edit81,'Enable','Off');
            set(handles.edit82,'Enable','Off');
            set(handles.edit83,'Enable','Off');
            set(handles.edit91,'Enable','Off');
            set(handles.edit92,'Enable','Off');
            set(handles.edit93,'Enable','Off');   
            % a4
            set(handles.edit101,'Enable','Off');
            set(handles.edit102,'Enable','Off');
            set(handles.edit103,'Enable','Off');
            set(handles.edit111,'Enable','Off');
            set(handles.edit112,'Enable','Off');
            set(handles.edit113,'Enable','Off');
            set(handles.edit121,'Enable','Off');
            set(handles.edit122,'Enable','Off');
            set(handles.edit123,'Enable','Off');
        case 3
            % a4
            set(handles.edit101,'Enable','Off');
            set(handles.edit102,'Enable','Off');
            set(handles.edit103,'Enable','Off');
            set(handles.edit111,'Enable','Off');
            set(handles.edit112,'Enable','Off');
            set(handles.edit113,'Enable','Off');
            set(handles.edit121,'Enable','Off');
            set(handles.edit122,'Enable','Off');
            set(handles.edit123,'Enable','Off');
    end
    set(handles.text1,'String','Ed1  =');
    set(handles.text3,'String','Ed2  =');
    set(handles.text4,'String','Ed3  =');
    set(handles.text5,'String','Ed4  =');
end 

% --- Executes on button press in push_Fd.
function push_Fd_Callback(hObject, eventdata, handles)
% hObject    handle to push_Fd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Poly_mat
load('fileData.mat');

load('customData.mat');
% if the custom use GUI to generate system model
if c_parameter.Choice(1,2)==1 
   dim_output=f_parameter.Sys_dim(3);
   dim_disturbance=f_parameter.Sys_dim(4);
% if the custom load system model    
elseif c_parameter.Choice(1,1)==1
   dim_output=size(c_parameter.Process_model{3},1);  
   if (isempty(c_parameter.Process_model{5}) & isempty(c_parameter.Process_model{6}))==1 % if Ed and Fd is empty
      errordlg('There is no disturbance matrix','Error');
      set(handles.checkbox_load,'Value',0);
   elseif isempty(c_parameter.Process_model{6})==1 % if Fd is empty
      errordlg('There is no ''Fd'' matrix','Error');
      set(handles.checkbox_load,'Value',0); 
   else
      dim_disturbance=size(c_parameter.Process_model{5},2);  
   end
end

if dim_output > 3 || dim_disturbance>3
   errordlg('Beyond dimension! Please use the load polytopic uncertainty function.','Error');
   set(handles.checkbox_load,'Value',0);
elseif f_parameter.Uncertainty{1}(7) == 0
    errordlg('Please give value on l .','Error');
else
    Poly_mat = 6;
    Poly_matrix;
    handles=guihandles;
    if [dim_output dim_disturbance] == [1 1]
            % a1
            set(handles.edit11,'Enable','On');
            % a2
            set(handles.edit41,'Enable','On');
            % a3
            set(handles.edit71,'Enable','On');
            % a4
            set(handles.edit101,'Enable','On');
            
    elseif [dim_output dim_disturbance] == [1 2]
            % a1
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            % a2
            set(handles.edit41,'Enable','On');
            set(handles.edit42,'Enable','On');
            % a3
            set(handles.edit71,'Enable','On');
            set(handles.edit72,'Enable','On');
            % a4
            set(handles.edit101,'Enable','On');
            set(handles.edit102,'Enable','On');
    elseif [dim_output dim_disturbance] == [1 3]
            % a1
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit13,'Enable','On');
            % a2
            set(handles.edit41,'Enable','On');
            set(handles.edit42,'Enable','On');
            set(handles.edit43,'Enable','On');
            % a3
            set(handles.edit71,'Enable','On');
            set(handles.edit72,'Enable','On');
            set(handles.edit73,'Enable','On');
            % a4
            set(handles.edit101,'Enable','On');
            set(handles.edit102,'Enable','On');
            set(handles.edit103,'Enable','On');
    elseif [dim_output dim_disturbance] == [2 1]    
            % a1
            set(handles.edit11,'Enable','On');
            set(handles.edit21,'Enable','On');
            % a2
            set(handles.edit41,'Enable','On');
            set(handles.edit51,'Enable','On');
            % a3
            set(handles.edit71,'Enable','On');
            set(handles.edit81,'Enable','On');
            % a4
            set(handles.edit101,'Enable','On');
            set(handles.edit111,'Enable','On');
    elseif [dim_output dim_disturbance] == [2 2]     
            % a1
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit22,'Enable','On');
            % a2
            set(handles.edit41,'Enable','On');
            set(handles.edit42,'Enable','On');
            set(handles.edit51,'Enable','On');
            set(handles.edit52,'Enable','On');
            % a3
            set(handles.edit71,'Enable','On');
            set(handles.edit72,'Enable','On');
            set(handles.edit81,'Enable','On');
            set(handles.edit82,'Enable','On');
            % a4
            set(handles.edit101,'Enable','On');
            set(handles.edit102,'Enable','On');
            set(handles.edit111,'Enable','On');
            set(handles.edit112,'Enable','On');
    elseif [dim_output dim_disturbance] == [2 3]     
            % a1
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit13,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit22,'Enable','On');
            set(handles.edit23,'Enable','On');
            % a2
            set(handles.edit41,'Enable','On');
            set(handles.edit42,'Enable','On');
            set(handles.edit43,'Enable','On');
            set(handles.edit51,'Enable','On');
            set(handles.edit52,'Enable','On');
            set(handles.edit53,'Enable','On');
            % a3
            set(handles.edit71,'Enable','On');
            set(handles.edit72,'Enable','On');
            set(handles.edit73,'Enable','On');
            set(handles.edit81,'Enable','On');
            set(handles.edit82,'Enable','On');
            set(handles.edit83,'Enable','On');
            % a4
            set(handles.edit101,'Enable','On');
            set(handles.edit102,'Enable','On');
            set(handles.edit103,'Enable','On');
            set(handles.edit111,'Enable','On');
            set(handles.edit112,'Enable','On');
            set(handles.edit113,'Enable','On');
    elseif [dim_output dim_disturbance] == [3 1]    
            % a1
            set(handles.edit11,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit31,'Enable','On');
            % a2
            set(handles.edit41,'Enable','On');
            set(handles.edit51,'Enable','On');
            set(handles.edit61,'Enable','On');
            % a3
            set(handles.edit71,'Enable','On');
            set(handles.edit81,'Enable','On');
            set(handles.edit91,'Enable','On');
            % a4
            set(handles.edit101,'Enable','On');
            set(handles.edit111,'Enable','On');
            set(handles.edit121,'Enable','On');
    elseif [dim_output dim_disturbance] == [3 2]     
            % a1
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit22,'Enable','On');
            set(handles.edit31,'Enable','On');
            set(handles.edit32,'Enable','On');
            % a2
            set(handles.edit41,'Enable','On');
            set(handles.edit42,'Enable','On');
            set(handles.edit51,'Enable','On');
            set(handles.edit52,'Enable','On');
            set(handles.edit61,'Enable','On');
            set(handles.edit62,'Enable','On');
            % a3
            set(handles.edit71,'Enable','On');
            set(handles.edit72,'Enable','On');
            set(handles.edit81,'Enable','On');
            set(handles.edit82,'Enable','On');
            set(handles.edit91,'Enable','On');
            set(handles.edit92,'Enable','On');
            % a4
            set(handles.edit101,'Enable','On');
            set(handles.edit102,'Enable','On');
            set(handles.edit111,'Enable','On');
            set(handles.edit112,'Enable','On');
            set(handles.edit121,'Enable','On');
            set(handles.edit122,'Enable','On');
    elseif [dim_output dim_disturbance] == [3 3]     
            % a1
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit13,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit22,'Enable','On');
            set(handles.edit23,'Enable','On');
            set(handles.edit31,'Enable','On');
            set(handles.edit32,'Enable','On');
            set(handles.edit33,'Enable','On');
            % a2
            set(handles.edit41,'Enable','On');
            set(handles.edit42,'Enable','On');
            set(handles.edit43,'Enable','On');
            set(handles.edit51,'Enable','On');
            set(handles.edit52,'Enable','On');
            set(handles.edit53,'Enable','On');
            set(handles.edit61,'Enable','On');
            set(handles.edit62,'Enable','On');
            set(handles.edit63,'Enable','On');
            % a3
            set(handles.edit71,'Enable','On');
            set(handles.edit72,'Enable','On');
            set(handles.edit73,'Enable','On');
            set(handles.edit81,'Enable','On');
            set(handles.edit82,'Enable','On');
            set(handles.edit83,'Enable','On');
            set(handles.edit91,'Enable','On');
            set(handles.edit92,'Enable','On');
            set(handles.edit93,'Enable','On');
            % a4
            set(handles.edit101,'Enable','On');
            set(handles.edit102,'Enable','On');
            set(handles.edit103,'Enable','On');
            set(handles.edit111,'Enable','On');
            set(handles.edit112,'Enable','On');
            set(handles.edit113,'Enable','On');
            set(handles.edit121,'Enable','On');
            set(handles.edit122,'Enable','On');
            set(handles.edit123,'Enable','On');
    end
    
    switch f_parameter.Uncertainty{1}(7)
        case 1
            % a2
            set(handles.edit41,'Enable','Off');
            set(handles.edit42,'Enable','Off');
            set(handles.edit43,'Enable','Off');
            set(handles.edit51,'Enable','Off');
            set(handles.edit52,'Enable','Off');
            set(handles.edit53,'Enable','Off');
            set(handles.edit61,'Enable','Off');
            set(handles.edit62,'Enable','Off');
            set(handles.edit63,'Enable','Off');
            % a3
            set(handles.edit71,'Enable','Off');
            set(handles.edit72,'Enable','Off');
            set(handles.edit73,'Enable','Off');
            set(handles.edit81,'Enable','Off');
            set(handles.edit82,'Enable','Off');
            set(handles.edit83,'Enable','Off');
            set(handles.edit91,'Enable','Off');
            set(handles.edit92,'Enable','Off');
            set(handles.edit93,'Enable','Off');
            % a4
            set(handles.edit101,'Enable','Off');
            set(handles.edit102,'Enable','Off');
            set(handles.edit103,'Enable','Off');
            set(handles.edit111,'Enable','Off');
            set(handles.edit112,'Enable','Off');
            set(handles.edit113,'Enable','Off');
            set(handles.edit121,'Enable','Off');
            set(handles.edit122,'Enable','Off');
            set(handles.edit123,'Enable','Off');
        case 2
            % a3
            set(handles.edit71,'Enable','Off');
            set(handles.edit72,'Enable','Off');
            set(handles.edit73,'Enable','Off');
            set(handles.edit81,'Enable','Off');
            set(handles.edit82,'Enable','Off');
            set(handles.edit83,'Enable','Off');
            set(handles.edit91,'Enable','Off');
            set(handles.edit92,'Enable','Off');
            set(handles.edit93,'Enable','Off');   
            % a4
            set(handles.edit101,'Enable','Off');
            set(handles.edit102,'Enable','Off');
            set(handles.edit103,'Enable','Off');
            set(handles.edit111,'Enable','Off');
            set(handles.edit112,'Enable','Off');
            set(handles.edit113,'Enable','Off');
            set(handles.edit121,'Enable','Off');
            set(handles.edit122,'Enable','Off');
            set(handles.edit123,'Enable','Off');
        case 3
            % a4
            set(handles.edit101,'Enable','Off');
            set(handles.edit102,'Enable','Off');
            set(handles.edit103,'Enable','Off');
            set(handles.edit111,'Enable','Off');
            set(handles.edit112,'Enable','Off');
            set(handles.edit113,'Enable','Off');
            set(handles.edit121,'Enable','Off');
            set(handles.edit122,'Enable','Off');
            set(handles.edit123,'Enable','Off');
    end
    set(handles.text1,'String','Fd1  =');
    set(handles.text3,'String','Fd2  =');
    set(handles.text4,'String','Fd3  =');
    set(handles.text5,'String','Fd4  =');
end 


% --- Executes on button press in checkbox_l4.
function checkbox_l4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_l4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_l4
load('fileData.mat');
if get(hObject,'Value') == 1
    set(handles.checkbox_l1,'Value',0);
    set(handles.checkbox_l2,'Value',0);    
    set(handles.checkbox_l3,'Value',0); 
    f_parameter.Uncertainty{1}(6) = 4;

else
    f_parameter.Uncertainty{1}(6) = 0;
end
save ('fileData','f_parameter'); 


% --- Executes on button press in checkbox_load.
function checkbox_load_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_load
if (get(hObject,'Value')==1)
    set(handles.checkbox_generate,'Value',0);
    % unselect checkboxes
    set(handles.checkbox_A,'Value',0);
    set(handles.checkbox_B,'Value',0);
    set(handles.checkbox_C,'Value',0);
    set(handles.checkbox_Ed,'Value',0);
    set(handles.checkbox_Fd,'Value',0);
    set(handles.checkbox_l1,'Value',0);
    set(handles.checkbox_l2,'Value',0);
    set(handles.checkbox_l3,'Value',0);
    set(handles.checkbox_l4,'Value',0);
    % unable to checkboxes
    set(handles.checkbox_A,'Enable','off');
    set(handles.checkbox_B,'Enable','off');
    set(handles.checkbox_C,'Enable','off');
    set(handles.checkbox_Ed,'Enable','off');
    set(handles.checkbox_Fd,'Enable','off');
    set(handles.checkbox_l1,'Enable','off');
    set(handles.checkbox_l2,'Enable','off');
    set(handles.checkbox_l3,'Enable','off');
    set(handles.checkbox_l4,'Enable','off');
    % unable to pushbuttons and txt
    set(handles.push_A,'Enable','off');
    set(handles.push_B,'Enable','off');
    set(handles.push_C,'Enable','off');
    set(handles.push_Ed,'Enable','off');
    set(handles.push_Fd,'Enable','off');
    set(handles.text_A,'Visible','off');
    set(handles.text_B,'Visible','off');
    set(handles.text_C,'Visible','off');
    set(handles.text_E,'Visible','off');
    set(handles.text_F,'Visible','off');
    % load file and save data
    [filename,pathname]=uigetfile(['*.mat'],'Please choose file.');
    str=[pathname,filename];
    if ((filename==0) & (pathname==0))
        msgbox('You have not chosen any file.','Error open file','error');
    else
        data=load (strcat([pathname filename]));
        load('customData.mat');
        % dimension check
        check = 0;
        dim = [];
        % A
        if isfield(data,'A')
            dim = [dim size(data.A,2)];
            c_parameter.Poly_uncertainty{1} = data.A;
            for i = 1:size(data.A,2)-1
                if size(data.A(i)) ~= size(data.A(i+1))
                    check = 1;
                end
            end
            if check == 0
                if (size(data.A{1})~=  size(c_parameter.Process_model{1})) & (size(data.A{1})~=  size(c_parameter.Process_model{1}'))
                    check = 1;
                end
            end
        else
            c_parameter.Poly_uncertainty{1} = {};
        end        
        % B
        if isfield(data,'B')
            dim = [dim size(data.B,2)];
            c_parameter.Poly_uncertainty{2} = data.B;
            for i = 1:size(data.B,2)-1
                if size(data.B(i)) ~= size(data.B(i+1))
                    check = 1;
                end
            end
            if check == 0
                if (size(data.B{1})~=  size(c_parameter.Process_model{2})) & (size(data.B{1})~=  size(c_parameter.Process_model{2}'))
                    check = 1;
                end
            end
        else
            c_parameter.Poly_uncertainty{2} = {};
        end
        % C
        if isfield(data,'C')
            dim = [dim size(data.C,2)];
            c_parameter.Poly_uncertainty{3} = data.C;
            for i = 1:size(data.C,2)-1
                if size(data.C(i)) ~= size(data.C(i+1))
                    check = 1; 
                end
            end
            if check == 0
                if (size(data.C{1})~=  size(c_parameter.Process_model{3})) & (size(data.C{1})~=  size(c_parameter.Process_model{3}'))
                        check = 1;
                end
            end
        else
            c_parameter.Poly_uncertainty{3} = {};
        end
        % D
        if isfield(data,'D')
            dim = [dim size(data.D,2)];
            c_parameter.Poly_uncertainty{4} = data.D;
            for i = 1:size(data.D,2)-1
                if size(data.D(i)) ~= size(data.D(i+1))
                    check = 1;
                end
            end
            if check == 0
                if (size(data.D{1})~=  size(c_parameter.Process_model{4})) & (size(data.D{1})~=  size(c_parameter.Process_model{4}'))
                        check = 1;
                end
            end
        else
            c_parameter.Poly_uncertainty{4} = {};
        end
        % Ed
        if isfield(data,'Ed')
            dim = [dim size(data.Ed,2)];
            c_parameter.Poly_uncertainty{5} = data.Ed;
            for i = 1:size(data.Ed,2)-1
                if size(data.Ed(i)) ~= size(data.Ed(i+1))
                    check = 1;     
                end
            end
            if check == 0
                if (size(data.Ed{1})~=  size(c_parameter.Process_model{5})) & (size(data.Ed{1})~=  size(c_parameter.Process_model{5}'))
                    check = 1;
                end              
            end
        else
            c_parameter.Poly_uncertainty{5} = {};
        end
        % Fd
        if isfield(data,'Fd')
            dim = [dim size(data.Fd,2)];
            c_parameter.Poly_uncertainty{6} = data.Fd;
            for i = 1:size(data.Fd,2)-1
                if size(data.Fd(i)) ~= size(data.Fd(i+1))
                    check = 1;
                end
            end
            if check == 0
             if (size(data.Fd{1})~=  size(c_parameter.Process_model{6})) & (size(data.Fd{1})~=  size(c_parameter.Process_model{6}'))
               check = 1;
              end   
            end
        else
            c_parameter.Poly_uncertainty{6} = {};
        end
        
        if isempty(dim)
            errordlg('No uncertainty information in loaded file.','Error');
        else
            if max(dim) ~= min(dim)
                check = 1;
            end
            if check == 1 
                errordlg('Uncertainty matrices do not match to each other.','Error');
                set(handles.checkbox_load,'Value',0);
            elseif check == 0
                save ('customData','c_parameter');
            end
        end
    end
end
    

% --- Executes on button press in checkbox_generate.
function checkbox_generate_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_generate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_generate
if (get(hObject,'Value')==1)
    set(handles.checkbox_load,'Value',0);
    % enable checkboxes
    set(handles.checkbox_A,'Enable','on');
    set(handles.checkbox_B,'Enable','on');
    set(handles.checkbox_C,'Enable','on');
    set(handles.checkbox_D,'Enable','on');
    set(handles.checkbox_Ed,'Enable','on');
    set(handles.checkbox_Fd,'Enable','on');
    set(handles.checkbox_l1,'Enable','on');
    set(handles.checkbox_l2,'Enable','on');
    set(handles.checkbox_l3,'Enable','on');
    set(handles.checkbox_l4,'Enable','on');
end


% --- Executes on button press in checkbox_D.
function checkbox_D_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_D
load('fileData.mat');
if get(hObject,'Value') == 1
    if sum(f_parameter.Uncertainty{1}(1:6))==3
        errordlg('Maximum only 3 can be chosen .','Error');
        set(hObject,'Value',0);
    else
        set(handles.push_D,'Enable','On');
        f_parameter.Uncertainty{1}(4) = 1;
    end
else
    f_parameter.Uncertainty{1}(4) = 0;
    set(handles.push_D,'Enable','Off');
    set(handles.text_D,'Visible','Off');
    f_parameter.Uncertainty{4} = zeros(12,3);
end
save ('fileData','f_parameter'); 

% --- Executes on button press in push_D.
function push_D_Callback(hObject, eventdata, handles)
% hObject    handle to push_D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Poly_mat
load('fileData.mat');

load('customData.mat');
% if the custom use GUI to generate system model
if c_parameter.Choice(1,2)==1 
   dim_output=f_parameter.Sys_dim(3);
   dim_input=f_parameter.Sys_dim(2);
% if the custom load system model    
elseif c_parameter.Choice(1,1)==1
    
   if isempty(c_parameter.Process_model{4})==1 % if D is empty
      errordlg('There is no ''D'' matrix','Error');
      set(handles.checkbox_load,'Value',0);
   else
      dim_output=size(c_parameter.Process_model{3},1); 
      dim_input=size(c_parameter.Process_model{2},2);  
   end
end

if dim_output > 3 || dim_input>3
   errordlg('Beyond dimension! Please use the load polytopic uncertainty function.','Error');
   set(handles.checkbox_load,'Value',0);
elseif f_parameter.Uncertainty{1}(7) == 0
    errordlg('Please give value on l .','Error');
else
    Poly_mat = 4;
    Poly_matrix;
    handles=guihandles;
    if [dim_output dim_input] == [1 1]
            % a1
            set(handles.edit11,'Enable','On');
            % a2
            set(handles.edit41,'Enable','On');
            % a3
            set(handles.edit71,'Enable','On');
            % a4
            set(handles.edit101,'Enable','On');
            
    elseif [dim_output dim_input] == [1 2]
            % a1
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            % a2
            set(handles.edit41,'Enable','On');
            set(handles.edit42,'Enable','On');
            % a3
            set(handles.edit71,'Enable','On');
            set(handles.edit72,'Enable','On');
            % a4
            set(handles.edit101,'Enable','On');
            set(handles.edit102,'Enable','On');
    elseif [dim_output dim_input] == [1 3]
            % a1
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit13,'Enable','On');
            % a2
            set(handles.edit41,'Enable','On');
            set(handles.edit42,'Enable','On');
            set(handles.edit43,'Enable','On');
            % a3
            set(handles.edit71,'Enable','On');
            set(handles.edit72,'Enable','On');
            set(handles.edit73,'Enable','On');
            % a4
            set(handles.edit101,'Enable','On');
            set(handles.edit102,'Enable','On');
            set(handles.edit103,'Enable','On');
    elseif [dim_output dim_input] == [2 1]    
            % a1
            set(handles.edit11,'Enable','On');
            set(handles.edit21,'Enable','On');
            % a2
            set(handles.edit41,'Enable','On');
            set(handles.edit51,'Enable','On');
            % a3
            set(handles.edit71,'Enable','On');
            set(handles.edit81,'Enable','On');
            % a4
            set(handles.edit101,'Enable','On');
            set(handles.edit111,'Enable','On');
    elseif [dim_output dim_input] == [2 2]     
            % a1
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit22,'Enable','On');
            % a2
            set(handles.edit41,'Enable','On');
            set(handles.edit42,'Enable','On');
            set(handles.edit51,'Enable','On');
            set(handles.edit52,'Enable','On');
            % a3
            set(handles.edit71,'Enable','On');
            set(handles.edit72,'Enable','On');
            set(handles.edit81,'Enable','On');
            set(handles.edit82,'Enable','On');
            % a4
            set(handles.edit101,'Enable','On');
            set(handles.edit102,'Enable','On');
            set(handles.edit111,'Enable','On');
            set(handles.edit112,'Enable','On');
    elseif [dim_output dim_input] == [2 3]     
            % a1
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit13,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit22,'Enable','On');
            set(handles.edit23,'Enable','On');
            % a2
            set(handles.edit41,'Enable','On');
            set(handles.edit42,'Enable','On');
            set(handles.edit43,'Enable','On');
            set(handles.edit51,'Enable','On');
            set(handles.edit52,'Enable','On');
            set(handles.edit53,'Enable','On');
            % a3
            set(handles.edit71,'Enable','On');
            set(handles.edit72,'Enable','On');
            set(handles.edit73,'Enable','On');
            set(handles.edit81,'Enable','On');
            set(handles.edit82,'Enable','On');
            set(handles.edit83,'Enable','On');
            % a4
            set(handles.edit101,'Enable','On');
            set(handles.edit102,'Enable','On');
            set(handles.edit103,'Enable','On');
            set(handles.edit111,'Enable','On');
            set(handles.edit112,'Enable','On');
            set(handles.edit113,'Enable','On');
    elseif [dim_output dim_input] == [3 1]    
            % a1
            set(handles.edit11,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit31,'Enable','On');
            % a2
            set(handles.edit41,'Enable','On');
            set(handles.edit51,'Enable','On');
            set(handles.edit61,'Enable','On');
            % a3
            set(handles.edit71,'Enable','On');
            set(handles.edit81,'Enable','On');
            set(handles.edit91,'Enable','On');
            % a4
            set(handles.edit101,'Enable','On');
            set(handles.edit111,'Enable','On');
            set(handles.edit121,'Enable','On');
    elseif [dim_output dim_input] == [3 2]     
            % a1
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit22,'Enable','On');
            set(handles.edit31,'Enable','On');
            set(handles.edit32,'Enable','On');
            % a2
            set(handles.edit41,'Enable','On');
            set(handles.edit42,'Enable','On');
            set(handles.edit51,'Enable','On');
            set(handles.edit52,'Enable','On');
            set(handles.edit61,'Enable','On');
            set(handles.edit62,'Enable','On');
            % a3
            set(handles.edit71,'Enable','On');
            set(handles.edit72,'Enable','On');
            set(handles.edit81,'Enable','On');
            set(handles.edit82,'Enable','On');
            set(handles.edit91,'Enable','On');
            set(handles.edit92,'Enable','On');
            % a4
            set(handles.edit101,'Enable','On');
            set(handles.edit102,'Enable','On');
            set(handles.edit111,'Enable','On');
            set(handles.edit112,'Enable','On');
            set(handles.edit121,'Enable','On');
            set(handles.edit122,'Enable','On');
    elseif [dim_output dim_input] == [3 3]     
            % a1
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit13,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit22,'Enable','On');
            set(handles.edit23,'Enable','On');
            set(handles.edit31,'Enable','On');
            set(handles.edit32,'Enable','On');
            set(handles.edit33,'Enable','On');
            % a2
            set(handles.edit41,'Enable','On');
            set(handles.edit42,'Enable','On');
            set(handles.edit43,'Enable','On');
            set(handles.edit51,'Enable','On');
            set(handles.edit52,'Enable','On');
            set(handles.edit53,'Enable','On');
            set(handles.edit61,'Enable','On');
            set(handles.edit62,'Enable','On');
            set(handles.edit63,'Enable','On');
            % a3
            set(handles.edit71,'Enable','On');
            set(handles.edit72,'Enable','On');
            set(handles.edit73,'Enable','On');
            set(handles.edit81,'Enable','On');
            set(handles.edit82,'Enable','On');
            set(handles.edit83,'Enable','On');
            set(handles.edit91,'Enable','On');
            set(handles.edit92,'Enable','On');
            set(handles.edit93,'Enable','On');
            % a4
            set(handles.edit101,'Enable','On');
            set(handles.edit102,'Enable','On');
            set(handles.edit103,'Enable','On');
            set(handles.edit111,'Enable','On');
            set(handles.edit112,'Enable','On');
            set(handles.edit113,'Enable','On');
            set(handles.edit121,'Enable','On');
            set(handles.edit122,'Enable','On');
            set(handles.edit123,'Enable','On');
    end
    
    switch f_parameter.Uncertainty{1}(7)
        case 1
            % a2
            set(handles.edit41,'Enable','Off');
            set(handles.edit42,'Enable','Off');
            set(handles.edit43,'Enable','Off');
            set(handles.edit51,'Enable','Off');
            set(handles.edit52,'Enable','Off');
            set(handles.edit53,'Enable','Off');
            set(handles.edit61,'Enable','Off');
            set(handles.edit62,'Enable','Off');
            set(handles.edit63,'Enable','Off');
            % a3
            set(handles.edit71,'Enable','Off');
            set(handles.edit72,'Enable','Off');
            set(handles.edit73,'Enable','Off');
            set(handles.edit81,'Enable','Off');
            set(handles.edit82,'Enable','Off');
            set(handles.edit83,'Enable','Off');
            set(handles.edit91,'Enable','Off');
            set(handles.edit92,'Enable','Off');
            set(handles.edit93,'Enable','Off');
            % a4
            set(handles.edit101,'Enable','Off');
            set(handles.edit102,'Enable','Off');
            set(handles.edit103,'Enable','Off');
            set(handles.edit111,'Enable','Off');
            set(handles.edit112,'Enable','Off');
            set(handles.edit113,'Enable','Off');
            set(handles.edit121,'Enable','Off');
            set(handles.edit122,'Enable','Off');
            set(handles.edit123,'Enable','Off');
        case 2
            % a3
            set(handles.edit71,'Enable','Off');
            set(handles.edit72,'Enable','Off');
            set(handles.edit73,'Enable','Off');
            set(handles.edit81,'Enable','Off');
            set(handles.edit82,'Enable','Off');
            set(handles.edit83,'Enable','Off');
            set(handles.edit91,'Enable','Off');
            set(handles.edit92,'Enable','Off');
            set(handles.edit93,'Enable','Off');   
            % a4
            set(handles.edit101,'Enable','Off');
            set(handles.edit102,'Enable','Off');
            set(handles.edit103,'Enable','Off');
            set(handles.edit111,'Enable','Off');
            set(handles.edit112,'Enable','Off');
            set(handles.edit113,'Enable','Off');
            set(handles.edit121,'Enable','Off');
            set(handles.edit122,'Enable','Off');
            set(handles.edit123,'Enable','Off');
        case 3
            % a4
            set(handles.edit101,'Enable','Off');
            set(handles.edit102,'Enable','Off');
            set(handles.edit103,'Enable','Off');
            set(handles.edit111,'Enable','Off');
            set(handles.edit112,'Enable','Off');
            set(handles.edit113,'Enable','Off');
            set(handles.edit121,'Enable','Off');
            set(handles.edit122,'Enable','Off');
            set(handles.edit123,'Enable','Off');
    end
    set(handles.text1,'String','D1  =');
    set(handles.text3,'String','D2  =');
    set(handles.text4,'String','D3  =');
    set(handles.text5,'String','D4  =');
end 




% --- Executes during object creation, after setting all properties.
function text_A_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_A (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function text_D_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
