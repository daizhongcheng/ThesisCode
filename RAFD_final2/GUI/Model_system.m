function varargout = Model_system(varargin)
% MODEL_SYSTEM MATLAB code for Model_system.fig
%      MODEL_SYSTEM, by itself, creates a new MODEL_SYSTEM or raises the existing
%      singleton*.
%
%      H = MODEL_SYSTEM returns the handle to a new MODEL_SYSTEM or the handle to
%      the existing singleton*.
%
%      MODEL_SYSTEM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MODEL_SYSTEM.M with the given input arguments.
%
%      MODEL_SYSTEM('Property','Value',...) creates a new MODEL_SYSTEM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Model_system_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Model_system_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Model_system

% Last Modified by GUIDE v2.5 18-May-2017 13:39:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Model_system_OpeningFcn, ...
                   'gui_OutputFcn',  @Model_system_OutputFcn, ...
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


% --- Executes just before Model_system is made visible.
function Model_system_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Model_system (see VARARGIN)

% Choose default command line output for Model_system
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Model_system wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Model_system_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
c=questdlg('Do you want to close the toolbox?','Close','Yes','No','Yes');
if strcmp(c,'Yes')
close all;
end


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
text('Interpreter','latex','Units','Normalized','String',... 
    '$$\mathop x(k+1)   = A_0x(k) + B_0u(k) + E_{d0}d(k)$$',...
    'Position',[.1 .98],'FontSize',12,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    '$$y(k) = C_0x(k) + D_0u(k) + F_{d0}d(k)$$',...
    'Position',[.195 .885],'FontSize',12,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    '$$A_0$$',...
    'Position',[.3 .77],'FontSize',13,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    '$$B_0$$',...
    'Position',[.445 .77],'FontSize',13,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    '$$C_0$$',...
    'Position',[.58 .77],'FontSize',13,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    '$$E_{d0}$$',...
    'Position',[.715 .77],'FontSize',13,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    '$$F_{d0}$$',...
    'Position',[.855 .77],'FontSize',13,'Fontname','MS Sans Serif')

% --- Executes on button press in pushbutton_A.
function pushbutton_A_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_A (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Sys_mat
Sys_mat = 1;
System_matrix;
handles=guihandles;
load('fileData.mat');
switch f_parameter.Sys_dim(1)
    case 1
        set(handles.edit11,'Enable','On');
    case 2
        set(handles.edit11,'Enable','On');
        set(handles.edit12,'Enable','On');
        set(handles.edit21,'Enable','On');
        set(handles.edit22,'Enable','On');
    case 3
        set(handles.edit11,'Enable','On');
        set(handles.edit12,'Enable','On');
        set(handles.edit13,'Enable','On');
        set(handles.edit21,'Enable','On');
        set(handles.edit22,'Enable','On');
        set(handles.edit23,'Enable','On');
        set(handles.edit31,'Enable','On');
        set(handles.edit32,'Enable','On');
        set(handles.edit33,'Enable','On');
end
set(handles.text1,'String','A0  =');

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if [get(handles.checkbox_load,'Value') get(handles.checkbox_generate,'Value')] == [1 0]
    if isempty(get(handles.edit_ts,'String'))
        errordlg('Please set sampling time.','Error');
    else
        load('fileData.mat');
        f_parameter.Samp_time = str2double(get(handles.edit_ts,'String'));
        save ('fileData','f_parameter');
        load('customData.mat');
        c_parameter.Choice(1,1:2) = [get(handles.checkbox_load,'Value') get(handles.checkbox_generate,'Value')];
        save ('customData','c_parameter');
        close;
    end
elseif [get(handles.checkbox_load,'Value') get(handles.checkbox_generate,'Value')] == [0 1]
    load('fileData.mat');
    if f_parameter.Mat_check ~= 5
        errordlg('Please complete matrices.','Error');
    else
        if isempty(get(handles.edit_ts,'String'))
            errordlg('Please set sampling time.','Error');
        else
            f_parameter.Samp_time = str2double(get(handles.edit_ts,'String'));
            save ('fileData','f_parameter');
            load('customData.mat');
            c_parameter.Choice(1,1:2) = [get(handles.checkbox_load,'Value') get(handles.checkbox_generate,'Value')];
            save ('customData','c_parameter');
            close;
        end
    end
end

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
Data_type;


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in checkbox_load.
function checkbox_load_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_load
if get(hObject,'Value')==1
    set(handles.checkbox_generate,'Value',0);
    set(handles.popup_dim_state,'Enable','Off');
    set(handles.popup_dim_input,'Enable','Off');
    set(handles.popup_dim_output,'Enable','Off');
    set(handles.popup_dim_disturbance,'Enable','Off');
    set(handles.pushbutton12,'Enable','Off');
    set(handles.pushbutton_A,'Enable','Off');
    set(handles.pushbutton_B,'Enable','Off');
    set(handles.pushbutton_C,'Enable','Off');
    set(handles.pushbutton_E,'Enable','Off');
    set(handles.pushbutton_F,'Enable','Off');
    
    [filename,pathname]=uigetfile(['*.mat'],'Please choose file.');
    str=[pathname,filename];
    if ((filename==0) & (pathname==0))
        msgbox('You have not chosen any file.','Error open file','error');
    else
        data=load (strcat([pathname filename]));
        % dimension check
        check = 0;
        % A0
        if isfield(data,'A0')
            c_parameter.Process_model{1} = data.A0;
        else
            check = 2;
        end
        % B0
        if isfield(data,'B0')
            if size(data.A0,2) ~= size(data.B0,1)
                check =1;
            else
                c_parameter.Process_model{2} = data.B0;
            end
        else
            check = 2;
        end
        % C0
        if isfield(data,'C0')
            if size(data.A0,2) ~= size(data.C0,2)
                check =1;
            else
                c_parameter.Process_model{3} = data.C0;          
            end
        else
            check = 2;
        end
        % D0
        if isfield(data,'D0')
            if ((size(data.D0,1) ~= size(data.C0,1)) && (size(data.D0,2) ~= size(data.B0,2)))
                check =1;
            else
                c_parameter.Process_model{4} = data.D0;
            end
        else
            c_parameter.Process_model{4} = {};
        end
        % Ed0
        if isfield(data,'Ed0')
            if size(data.A0,1) ~= size(data.Ed0,1)
                check =1;
            else
                c_parameter.Process_model{5} = data.Ed0;
            end
        else
            c_parameter.Process_model{5} = {};
        end
        % Fd0
        if isfield(data,'Ed0')
            if size(data.A0,2) ~= size(data.B0,1)
                check =1;
            else
                c_parameter.Process_model{6} = data.Fd0;
            end
        else
            c_parameter.Process_model{6} = {};
        end
        
        if check == 1
            errordlg('Matrices do not match to each other.','Error');
            set(handles.checkbox_load,'Value',0);
        elseif check == 2
            errordlg('Matrix(ces) missing.','Error');
            set(handles.checkbox_load,'Value',0);
        elseif check == 0
            save ('customData','c_parameter');  
        end
    end
end

% --- Executes on button press in checkbox_generate.
function checkbox_generate_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_generate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_generate
if get(hObject,'Value')==1
set(handles.popup_dim_state,'Enable','On');
set(handles.popup_dim_input,'Enable','On');
set(handles.popup_dim_output,'Enable','On');
set(handles.popup_dim_disturbance,'Enable','On');
set(handles.pushbutton12,'Enable','On');
set(handles.checkbox_load,'Value',0);
else
 set(handles.popup_dim_state,'Enable','Off');
 set(handles.popup_dim_input,'Enable','Off');
set(handles.popup_dim_output,'Enable','Off');
set(handles.popup_dim_disturbance,'Enable','Off');
set(handles.pushbutton12,'Enable','Off');  
end

% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;


% --- Executes on selection change in popup_dim_state.
function popup_dim_state_Callback(hObject, eventdata, handles)
% hObject    handle to popup_dim_state (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popup_dim_state contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popup_dim_state


% --- Executes during object creation, after setting all properties.
function popup_dim_state_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popup_dim_state (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Sys_matrix = [];
Sys_dim = [get(handles.popup_dim_state,'Value') get(handles.popup_dim_input,'Value'),...
           get(handles.popup_dim_output,'Value') get(handles.popup_dim_disturbance,'Value')];
load('fileData.mat');
f_parameter.Mat_check = 0;
f_parameter.Sys_dim = Sys_dim;
f_parameter.Sys_matrix = Sys_matrix;
save ('fileData','f_parameter');
set(handles.pushbutton_A,'Enable','On');
set(handles.pushbutton_B,'Enable','On');
set(handles.pushbutton_C,'Enable','On');
set(handles.pushbutton_E,'Enable','On');
set(handles.pushbutton_F,'Enable','On');

% --- Executes on button press in pushbutton_B.
function pushbutton_B_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Sys_mat
Sys_mat = 2;
System_matrix;
handles=guihandles;
load('fileData.mat');
if [f_parameter.Sys_dim(1) f_parameter.Sys_dim(2)] == [1 1]
        set(handles.edit11,'Enable','On');
elseif [f_parameter.Sys_dim(1) f_parameter.Sys_dim(2)] == [1 2]
        set(handles.edit11,'Enable','On');
        set(handles.edit12,'Enable','On');
elseif [f_parameter.Sys_dim(1) f_parameter.Sys_dim(2)] == [2 1]
        set(handles.edit11,'Enable','On');
        set(handles.edit21,'Enable','On');
elseif [f_parameter.Sys_dim(1) f_parameter.Sys_dim(2)] == [2 2]
        set(handles.edit11,'Enable','On');
        set(handles.edit12,'Enable','On');
        set(handles.edit21,'Enable','On');
        set(handles.edit22,'Enable','On');
elseif [f_parameter.Sys_dim(1) f_parameter.Sys_dim(2)] == [3 1]
        set(handles.edit11,'Enable','On');
        set(handles.edit21,'Enable','On');
        set(handles.edit31,'Enable','On');
elseif [f_parameter.Sys_dim(1) f_parameter.Sys_dim(2)] == [3 2]
        set(handles.edit11,'Enable','On');
        set(handles.edit12,'Enable','On');
        set(handles.edit21,'Enable','On');
        set(handles.edit22,'Enable','On');
        set(handles.edit31,'Enable','On');
        set(handles.edit32,'Enable','On');
end
set(handles.text1,'String','B0  =');

% --- Executes on button press in pushbutton_C.
function pushbutton_C_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_C (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Sys_mat
Sys_mat = 3;
System_matrix;
handles=guihandles;
load('fileData.mat');
if [f_parameter.Sys_dim(1) f_parameter.Sys_dim(3)] == [1 1]
        set(handles.edit11,'Enable','On');
elseif [f_parameter.Sys_dim(1) f_parameter.Sys_dim(3)] == [1 2]
        set(handles.edit11,'Enable','On');
        set(handles.edit21,'Enable','On');
elseif [f_parameter.Sys_dim(1) f_parameter.Sys_dim(3)] == [2 1]
        set(handles.edit11,'Enable','On');
        set(handles.edit12,'Enable','On');
elseif [f_parameter.Sys_dim(1) f_parameter.Sys_dim(3)] == [2 2]
        set(handles.edit11,'Enable','On');
        set(handles.edit12,'Enable','On');
        set(handles.edit21,'Enable','On');
        set(handles.edit22,'Enable','On');
elseif [f_parameter.Sys_dim(1) f_parameter.Sys_dim(3)] == [3 1]
        set(handles.edit11,'Enable','On');
        set(handles.edit12,'Enable','On');
        set(handles.edit13,'Enable','On');
elseif [f_parameter.Sys_dim(1) f_parameter.Sys_dim(3)] == [3 2]
        set(handles.edit11,'Enable','On');
        set(handles.edit12,'Enable','On');
        set(handles.edit13,'Enable','On');
        set(handles.edit21,'Enable','On');
        set(handles.edit22,'Enable','On');
        set(handles.edit23,'Enable','On');
end
set(handles.text1,'String','C0  =');

% --- Executes on button press in pushbutton_E.
function pushbutton_E_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_E (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Sys_mat
Sys_mat = 4;
System_matrix;
handles=guihandles;
load('fileData.mat');
if [f_parameter.Sys_dim(1) f_parameter.Sys_dim(4)] == [1 1]
        set(handles.edit11,'Enable','On');
elseif [f_parameter.Sys_dim(1) f_parameter.Sys_dim(4)] == [1 2]
        set(handles.edit11,'Enable','On');
        set(handles.edit12,'Enable','On');
elseif [f_parameter.Sys_dim(1) f_parameter.Sys_dim(4)] == [2 1]
        set(handles.edit11,'Enable','On');
        set(handles.edit21,'Enable','On');
elseif [f_parameter.Sys_dim(1) f_parameter.Sys_dim(4)] == [2 2]
        set(handles.edit11,'Enable','On');
        set(handles.edit12,'Enable','On');
        set(handles.edit21,'Enable','On');
        set(handles.edit22,'Enable','On');
elseif [f_parameter.Sys_dim(1) f_parameter.Sys_dim(4)] == [3 1]
        set(handles.edit11,'Enable','On');
        set(handles.edit21,'Enable','On');
        set(handles.edit31,'Enable','On');
elseif [f_parameter.Sys_dim(1) f_parameter.Sys_dim(4)] == [3 2]
        set(handles.edit11,'Enable','On');
        set(handles.edit12,'Enable','On');
        set(handles.edit21,'Enable','On');
        set(handles.edit22,'Enable','On');
        set(handles.edit31,'Enable','On');
        set(handles.edit32,'Enable','On');
end
set(handles.text1,'String','Ed0  =');

% --- Executes on button press in pushbutton_F.
function pushbutton_F_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_F (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Sys_mat
Sys_mat = 5;
System_matrix;
handles=guihandles;
load('fileData.mat');
if [f_parameter.Sys_dim(3) f_parameter.Sys_dim(4)] == [1 1]
        set(handles.edit11,'Enable','On');
elseif [f_parameter.Sys_dim(3) f_parameter.Sys_dim(4)] == [1 2]
        set(handles.edit11,'Enable','On');
        set(handles.edit12,'Enable','On');
elseif [f_parameter.Sys_dim(3) f_parameter.Sys_dim(4)] == [2 1]
        set(handles.edit11,'Enable','On');
        set(handles.edit21,'Enable','On');
elseif [f_parameter.Sys_dim(3) f_parameter.Sys_dim(4)] == [2 2]
        set(handles.edit11,'Enable','On');
        set(handles.edit12,'Enable','On');
        set(handles.edit21,'Enable','On');
        set(handles.edit22,'Enable','On');
end
set(handles.text1,'String','Fd0  =');



function edit_ts_Callback(hObject, eventdata, handles)
% hObject    handle to edit_ts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_ts as text
%        str2double(get(hObject,'String')) returns contents of edit_ts as a double


% --- Executes during object creation, after setting all properties.
function edit_ts_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_ts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popup_dim_input.
function popup_dim_input_Callback(hObject, eventdata, handles)
% hObject    handle to popup_dim_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popup_dim_input contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popup_dim_input


% --- Executes during object creation, after setting all properties.
function popup_dim_input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popup_dim_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popup_dim_output.
function popup_dim_output_Callback(hObject, eventdata, handles)
% hObject    handle to popup_dim_output (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popup_dim_output contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popup_dim_output


% --- Executes during object creation, after setting all properties.
function popup_dim_output_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popup_dim_output (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popup_dim_disturbance.
function popup_dim_disturbance_Callback(hObject, eventdata, handles)
% hObject    handle to popup_dim_disturbance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popup_dim_disturbance contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popup_dim_disturbance


% --- Executes during object creation, after setting all properties.
function popup_dim_disturbance_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popup_dim_disturbance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popup_dim_F.
function popup_dim_F_Callback(hObject, eventdata, handles)
% hObject    handle to popup_dim_F (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popup_dim_F contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popup_dim_F


% --- Executes during object creation, after setting all properties.
function popup_dim_F_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popup_dim_F (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function axes3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes3
text('Interpreter','latex','Units','Normalized','String',... 
    '$$\mathop x(k+1)   = A_0x(k) + B_0u(k) + E_{d0}d(k)$$',...
    'Position',[.1 .8],'FontSize',12,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    '$$y(k) = C_0x(k) + D_0u(k) + F_{d0}d(k)$$',...
    'Position',[.195 .4],'FontSize',12,'Fontname','MS Sans Serif')
