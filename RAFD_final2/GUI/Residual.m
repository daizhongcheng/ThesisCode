function varargout = Residual(varargin)
% RESIDUAL MATLAB code for Residual.fig
%      RESIDUAL, by itself, creates a new RESIDUAL or raises the existing
%      singleton*.
%
%      H = RESIDUAL returns the handle to a new RESIDUAL or the handle to
%      the existing singleton*.
%
%      RESIDUAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RESIDUAL.M with the given input arguments.
%
%      RESIDUAL('Property','Value',...) creates a new RESIDUAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Residual_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Residual_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Residual

% Last Modified by GUIDE v2.5 08-Jun-2017 12:27:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Residual_OpeningFcn, ...
                   'gui_OutputFcn',  @Residual_OutputFcn, ...
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


% --- Executes just before Residual is made visible.
function Residual_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Residual (see VARARGIN)

% Choose default command line output for Residual
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Residual wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Residual_OutputFcn(hObject, eventdata, handles) 
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
if get(handles.checkbox_load,'Value')==1
    if [get(handles.radiobutton_fct1,'Value') get(handles.radiobutton_fct2,'Value')] == [0 0]
        errordlg('Please choose evaluation function .','Error');
    else
        load('fileData.mat');
        eva_f = zeros(2,2);
        eva_f(:,1) = [get(handles.radiobutton_fct1,'Value') get(handles.radiobutton_fct2,'Value')];
        if eva_f(2,1) == 1
            eva_f(2,2)= str2double(get(handles.edit_n,'String'));
        end
        f_parameter.Residual{1}= {};
        f_parameter.Residual{2} = eva_f;
        save ('fileData','f_parameter');
        load('customData.mat');
        c_parameter.Choice(4,1:2) = [get(handles.checkbox_load,'Value') get(handles.checkbox_generate,'Value')];
        save ('customData','c_parameter');
        close;
    end
elseif get(handles.checkbox_generate,'Value')==1
    if [get(handles.radiobutton_fct1,'Value') get(handles.radiobutton_fct2,'Value')] == [0 0]
        errordlg('Please choose evaluation function .','Error');
    else
    res_m = [get(handles.radio_kal,'Value') get(handles.radio_uni,'Value') get(handles.radio_custom,'Value')];
    eva_f = zeros(2,2);
    eva_f(:,1) = [get(handles.radiobutton_fct1,'Value') get(handles.radiobutton_fct2,'Value')];
    if eva_f(2,1) == 1
        eva_f(2,2)= str2double(get(handles.edit_n,'String'));
    end
    load('fileData.mat');
    f_parameter.Residual{1} = res_m;
    f_parameter.Residual{2} = eva_f;
    if res_m(3)==1
        Matrix = zeros(3,3);
        if isempty(get(handles.edit_11,'String')) ~= 1
            Matrix(1,1) = str2double(get(handles.edit_11,'String'));
        end
        if isempty(get(handles.edit_12,'String')) ~= 1
            Matrix(1,2) = str2double(get(handles.edit_12,'String'));
        end
        if isempty(get(handles.edit_13,'String')) ~= 1
            Matrix(1,3) = str2double(get(handles.edit_13,'String'));
        end
        if isempty(get(handles.edit_21,'String')) ~= 1
            Matrix(2,1) = str2double(get(handles.edit_21,'String'));
        end
        if isempty(get(handles.edit_22,'String')) ~= 1
            Matrix(2,2) = str2double(get(handles.edit_22,'String'));
        end
        if isempty(get(handles.edit_23,'String')) ~= 1
            Matrix(2,3) = str2double(get(handles.edit_23,'String'));
        end
        if isempty(get(handles.edit_31,'String')) ~= 1
            Matrix(3,1) = str2double(get(handles.edit_31,'String'));
        end
        if isempty(get(handles.edit_32,'String')) ~= 1
            Matrix(3,2) = str2double(get(handles.edit_32,'String'));
        end
        if isempty(get(handles.edit_33,'String')) ~= 1
            Matrix(3,3) = str2double(get(handles.edit_33,'String'));
        end
        f_parameter.Residual{3} = Matrix;
    end
    save ('fileData','f_parameter');
    %  kalman filter
    load('fileData.mat');
    if get(handles.radio_kal,'Value')== 1
        L = Kalman_filter(f_parameter);
        f_parameter.Residual{3} = L;
        save ('fileData','f_parameter');
        %disp(result);
    end
    
    if get(handles.radio_uni,'Value')== 1
        [L,V] = Unified_solution(f_parameter);
        f_parameter.Residual{3} = L;
        f_parameter.Residual{4} = V;
        save ('fileData','f_parameter');
        %disp(result);
    end
    load('customData.mat');
    c_parameter.Choice(4,1:2) = [get(handles.checkbox_load,'Value') get(handles.checkbox_generate,'Value')];
    save ('customData','c_parameter');
    close;
    end
end


% --- Executes on button press in pushbutton_next.
function pushbutton_next_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_next (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if (get(handles.radiobutton_fct1,'Value')==1)||(get(handles.radiobutton_fct1,'Value')==1)
    if (isempty(get(handles.edit_n,'String'))==0)||(isempty(get(handles.edit_n2,'String'))==0)
        close;
        Input_data;
    else
        errordlg('Please enter the value of k.','Error');
    end
else
    errordlg('Please choose an evaluation function.','Error');
end

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
Uncertainty;


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
%Evaluation fct1
text('Interpreter','latex','Units','Normalized','String',... 
    '$${J_{RMS}}(k) = \sqrt {\frac{1}{N}\sum\limits_{i = 1}^N {{r^{^{T}}}(k + i)}{r(k + i)} }$$',...
    'Position',[.0 .25],'FontSize',13,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    '$$N = $$',...
    'Position',[.9 .25],'FontSize',13,'Fontname','MS Sans Serif')

%Evaluation fct2
text('Interpreter','latex','Units','Normalized','String',... 
    '$${J_{peak}}(k) = sup\sqrt{r^{^{T}}(k)r(k)} $$',...
    'Position',[.17 .73],'FontSize',13,'Fontname','MS Sans Serif')

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in radiobutton_fct1.
function radiobutton_fct1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_fct1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_fct1
handles=guihandles;
set(handles.radiobutton_fct2,'value',0);
set(handles.radiobutton_fct1,'value',1);
set(handles.edit_n,'enable','off');
% --- Executes on button press in radiobutton_fct1.
function radiobutton_fct2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_fct1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_fct1
handles=guihandles;
set(handles.radiobutton_fct2,'value',1);
set(handles.radiobutton_fct1,'value',0);
set(handles.edit_n,'enable','on');


function edit_n_Callback(hObject, eventdata, handles)
% hObject    handle to edit_n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_n as text
%        str2double(get(hObject,'String')) returns contents of edit_n as a double


% --- Executes during object creation, after setting all properties.
function edit_n_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_n2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_n2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_n2 as text
%        str2double(get(hObject,'String')) returns contents of edit_n2 as a double


% --- Executes during object creation, after setting all properties.
function edit_n2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_n2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radio_kal.
function radio_kal_Callback(hObject, eventdata, handles)
% hObject    handle to radio_kal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radio_kal
if get(hObject,'Value') == 1
    set(handles.radio_uni,'Value',0);
    set(handles.radio_custom,'Value',0);
    set(handles.edit_11,'Enable','Off');
    set(handles.edit_12,'Enable','Off');
    set(handles.edit_13,'Enable','Off');
    set(handles.edit_21,'Enable','Off');
    set(handles.edit_22,'Enable','Off');
    set(handles.edit_23,'Enable','Off');
    set(handles.edit_31,'Enable','Off');
    set(handles.edit_32,'Enable','Off');
    set(handles.edit_33,'Enable','Off');
end
% --- Executes on button press in radio_uni.
function radio_uni_Callback(hObject, eventdata, handles)
% hObject    handle to radio_uni (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radio_uni
if get(hObject,'Value') == 1
    set(handles.radio_kal,'Value',0);
    set(handles.radio_custom,'Value',0);
    set(handles.edit_11,'Enable','Off');
    set(handles.edit_12,'Enable','Off');
    set(handles.edit_13,'Enable','Off');
    set(handles.edit_21,'Enable','Off');
    set(handles.edit_22,'Enable','Off');
    set(handles.edit_23,'Enable','Off');
    set(handles.edit_31,'Enable','Off');
    set(handles.edit_32,'Enable','Off');
    set(handles.edit_33,'Enable','Off');
end

% --- Executes on button press in radio_custom.
function radio_custom_Callback(hObject, eventdata, handles)
% hObject    handle to radio_custom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radio_custom
if get(hObject,'Value') == 1
    set(handles.radio_uni,'Value',0);
    set(handles.radio_kal,'Value',0);
    load('fileData.mat');
if [f_parameter.Sys_dim(1) f_parameter.Sys_dim(3)] == [1 1]
        set(handles.edit_11,'Enable','On');
elseif [f_parameter.Sys_dim(1) f_parameter.Sys_dim(3)] == [1 2]
        set(handles.edit_11,'Enable','On');
        set(handles.edit_12,'Enable','On');
elseif [f_parameter.Sys_dim(1) f_parameter.Sys_dim(3)] == [2 1]
        set(handles.edit_11,'Enable','On');
        set(handles.edit_21,'Enable','On');
elseif [f_parameter.Sys_dim(1) f_parameter.Sys_dim(3)] == [2 2]
        set(handles.edit_11,'Enable','On');
        set(handles.edit_12,'Enable','On');
        set(handles.edit_21,'Enable','On');
        set(handles.edit_22,'Enable','On');
elseif [f_parameter.Sys_dim(1) f_parameter.Sys_dim(3)] == [3 1]
        set(handles.edit_11,'Enable','On');
        set(handles.edit_21,'Enable','On');
        set(handles.edit_31,'Enable','On');
elseif [f_parameter.Sys_dim(1) f_parameter.Sys_dim(3)] == [3 2]
        set(handles.edit_11,'Enable','On');
        set(handles.edit_21,'Enable','On');
        set(handles.edit_31,'Enable','On');
        set(handles.edit_12,'Enable','On');
        set(handles.edit_22,'Enable','On');
        set(handles.edit_32,'Enable','On');
end
else
    set(handles.edit_11,'Enable','Off');
    set(handles.edit_12,'Enable','Off');
    set(handles.edit_13,'Enable','Off');
    set(handles.edit_21,'Enable','Off');
    set(handles.edit_22,'Enable','Off');
    set(handles.edit_23,'Enable','Off');
    set(handles.edit_31,'Enable','Off');
    set(handles.edit_32,'Enable','Off');
    set(handles.edit_33,'Enable','Off');
end


function edit_11_Callback(hObject, eventdata, handles)
% hObject    handle to edit_11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_11 as text
%        str2double(get(hObject,'String')) returns contents of edit_11 as a double


% --- Executes during object creation, after setting all properties.
function edit_11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_12_Callback(hObject, eventdata, handles)
% hObject    handle to edit_12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_12 as text
%        str2double(get(hObject,'String')) returns contents of edit_12 as a double


% --- Executes during object creation, after setting all properties.
function edit_12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_13_Callback(hObject, eventdata, handles)
% hObject    handle to edit_13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_13 as text
%        str2double(get(hObject,'String')) returns contents of edit_13 as a double


% --- Executes during object creation, after setting all properties.
function edit_13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_21_Callback(hObject, eventdata, handles)
% hObject    handle to edit_21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_21 as text
%        str2double(get(hObject,'String')) returns contents of edit_21 as a double


% --- Executes during object creation, after setting all properties.
function edit_21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_22_Callback(hObject, eventdata, handles)
% hObject    handle to edit_22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_22 as text
%        str2double(get(hObject,'String')) returns contents of edit_22 as a double


% --- Executes during object creation, after setting all properties.
function edit_22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_23_Callback(hObject, eventdata, handles)
% hObject    handle to edit_23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_23 as text
%        str2double(get(hObject,'String')) returns contents of edit_23 as a double


% --- Executes during object creation, after setting all properties.
function edit_23_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_31_Callback(hObject, eventdata, handles)
% hObject    handle to edit_31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_31 as text
%        str2double(get(hObject,'String')) returns contents of edit_31 as a double


% --- Executes during object creation, after setting all properties.
function edit_31_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_32_Callback(hObject, eventdata, handles)
% hObject    handle to edit_32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_32 as text
%        str2double(get(hObject,'String')) returns contents of edit_32 as a double


% --- Executes during object creation, after setting all properties.
function edit_32_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_33_Callback(hObject, eventdata, handles)
% hObject    handle to edit_33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_33 as text
%        str2double(get(hObject,'String')) returns contents of edit_33 as a double


% --- Executes during object creation, after setting all properties.
function edit_33_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;


% --- Executes on button press in checkbox_load.
function checkbox_load_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_load
check = 0;
if get(hObject,'Value')==1
    set(handles.checkbox_generate,'Value',0); 
    % unselect radiobuttons
   set(handles.radio_kal,'Value',0); 
   set(handles.radio_uni,'Value',0);
   set(handles.radio_custom,'Value',0);
   
   set(handles.radio_kal,'Enable','Off'); 
   set(handles.radio_uni,'Enable','Off');
   set(handles.radio_custom,'Enable','Off');
    % clear eidts
    set(handles.edit_11,'String',''); 
    set(handles.edit_12,'String',''); 
    set(handles.edit_13,'String',''); 
    set(handles.edit_21,'String',''); 
    set(handles.edit_22,'String',''); 
    set(handles.edit_23,'String',''); 
    set(handles.edit_31,'String',''); 
    set(handles.edit_32,'String',''); 
    set(handles.edit_33,'String',''); 
    
    set(handles.edit_11,'Enable','Off'); 
    set(handles.edit_12,'Enable','Off'); 
    set(handles.edit_13,'Enable','Off'); 
    set(handles.edit_21,'Enable','Off'); 
    set(handles.edit_22,'Enable','Off'); 
    set(handles.edit_23,'Enable','Off'); 
    set(handles.edit_31,'Enable','Off'); 
    set(handles.edit_32,'Enable','Off'); 
    set(handles.edit_33,'Enable','Off'); 
    
    %load file and save data
    [filename,pathname]=uigetfile(['*.mat'],'Please choose file.');
    str=[pathname,filename];
    if ((filename==0) & (pathname==0))
        msgbox('You have not chosen any file.','Error open file','error');
    else
        data=load (strcat([pathname filename]));
        load('customData.mat');
        if isfield(data,'L')
            if (size(data.L,1) == size(c_parameter.Process_model{1},2)) && (size(data.L,2) == size(c_parameter.Process_model{3},1))
                c_parameter.Filter_gain = data.L;
            else
                check = 2;
            end
        else
           check = 1;
        end
        if isfield(data,'V')
            c_parameter.Filter = data.V;
        else
            c_parameter.Filter = {};
        end
        if check == 0
            save ('customData','c_parameter');
        elseif check ==1
            errordlg('No filter gain in loaded file .','Error');
            set(handles.checkbox_load,'Value',0);
        elseif check ==2
            errordlg('Matrices do not match.','Error');
            set(handles.checkbox_load,'Value',0);
        end
    end
end

% --- Executes on button press in checkbox_generate.
function checkbox_generate_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_generate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_generate
    set(handles.checkbox_load,'Value',0); 
    % enable radio buttons
    set(handles.radio_kal,'Enable','On'); 
   set(handles.radio_uni,'Enable','On');
   set(handles.radio_custom,'Enable','On');
